
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'user_model.freezed.dart';

@freezed
abstract class User with _$User {
  const factory User({
    @required String firstname,
    @required String middlename,
    @required String lastname,
    @required  String company,
    @required String mobileNumber,
    @required String emailAddress,
    @required String securityQuestion,
    @required String securityAnswer,
  }) = _User;
}