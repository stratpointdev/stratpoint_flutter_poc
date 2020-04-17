

import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
@freezed
abstract class Profile with _$Profile {
  const factory Profile({
    String objectId,
    String firstname,
    String middlename,
    String lastname,
    String company,
    String mobileNumber,
    String emailAddress,
    String securityQuestion,
    String securityAnswer,
  }) = _Profile;
}