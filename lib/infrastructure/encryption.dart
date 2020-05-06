import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';
import 'package:meta/meta.dart';
import 'package:sembast/src/api/v2/sembast.dart';

Random _random = Random.secure();

/// Random bytes generator
Uint8List _randBytes(int length) {
  return Uint8List.fromList(
      List<int>.generate(length, (i) => _random.nextInt(256)));
}

/// Generate an encryption password based on a user input password

/// It uses MD5 which generates a 16 bytes blob, size needed for Salsa20
Uint8List _generateEncryptPassword(String password) {
  final Uint8List blob =
      Uint8List.fromList(md5.convert(utf8.encode(password)).bytes);
  assert(blob.length == 16);
  return blob;
}

/// Salsa20 based encoder
class _EncryptEncoder extends Converter<dynamic, String> {
  _EncryptEncoder(this.salsa20);
  final Salsa20 salsa20;

  @override
  String convert(dynamic input) {
    // Generate random initial value
    final Uint8List iv = _randBytes(8);
    final String ivEncoded = base64.encode(iv);
    assert(ivEncoded.length == 12);

    // Encode the input value
    final String encoded =
        Encrypter(salsa20).encrypt(json.encode(input), iv: IV(iv)).base64;

    // Prepend the initial value
    return '$ivEncoded$encoded';
  }
}

/// Salsa20 based decoder
class _EncryptDecoder extends Converter<String, dynamic> {
  _EncryptDecoder(this.salsa20);
  final Salsa20 salsa20;

  @override
  dynamic convert(String input) {
    // Read the initial value that was prepended
    assert(input.length >= 12);
    final iv = base64.decode(input.substring(0, 12));

    // Extract the real input
    input = input.substring(12);

    // Decode the input
    var decoded = json.decode(Encrypter(salsa20).decrypt64(input, iv: IV(iv)));
    if (decoded is Map) {
      return decoded.cast<String, dynamic>();
    }
    return decoded;
  }
}

/// Salsa20 based Codec
class _EncryptCodec extends Codec<dynamic, String> {
  _EncryptCodec(Uint8List passwordBytes) {
    final Salsa20 salsa20 = Salsa20(Key(passwordBytes));
    _encoder = _EncryptEncoder(salsa20);
    _decoder = _EncryptDecoder(salsa20);
  }
  _EncryptEncoder _encoder;
  _EncryptDecoder _decoder;

  @override
  Converter<String, dynamic> get decoder => _decoder;

  @override
  Converter<dynamic, String> get encoder => _encoder;
}

/// Our plain text signature
const String _encryptCodecSignature = 'encrypt';

/// Create a codec to use to open a database with encrypted stored data.
///
/// Hash (md5) of the password is used (but never stored) as a key to encrypt
/// the data using the Salsa20 algorithm with a random (8 bytes) initial value

SembastCodec getEncryptSembastCodec({@required String password}) =>
    SembastCodec(
        signature: _encryptCodecSignature,
        codec: _EncryptCodec(_generateEncryptPassword(password)));
