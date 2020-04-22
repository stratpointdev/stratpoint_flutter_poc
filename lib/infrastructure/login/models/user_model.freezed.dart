// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$UserTearOff {
  const _$UserTearOff();

  _User call(
      {@required String firstname,
      @required String middlename,
      @required String lastname,
      @required String company,
      @required String mobileNumber,
      @required String emailAddress,
      @required String securityQuestion,
      @required String securityAnswer}) {
    return _User(
      firstname: firstname,
      middlename: middlename,
      lastname: lastname,
      company: company,
      mobileNumber: mobileNumber,
      emailAddress: emailAddress,
      securityQuestion: securityQuestion,
      securityAnswer: securityAnswer,
    );
  }
}

// ignore: unused_element
const $User = _$UserTearOff();

mixin _$User {
  String get firstname;
  String get middlename;
  String get lastname;
  String get company;
  String get mobileNumber;
  String get emailAddress;
  String get securityQuestion;
  String get securityAnswer;

  $UserCopyWith<User> get copyWith;
}

abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {String firstname,
      String middlename,
      String lastname,
      String company,
      String mobileNumber,
      String emailAddress,
      String securityQuestion,
      String securityAnswer});
}

class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object firstname = freezed,
    Object middlename = freezed,
    Object lastname = freezed,
    Object company = freezed,
    Object mobileNumber = freezed,
    Object emailAddress = freezed,
    Object securityQuestion = freezed,
    Object securityAnswer = freezed,
  }) {
    return _then(_value.copyWith(
      firstname: firstname == freezed ? _value.firstname : firstname as String,
      middlename:
          middlename == freezed ? _value.middlename : middlename as String,
      lastname: lastname == freezed ? _value.lastname : lastname as String,
      company: company == freezed ? _value.company : company as String,
      mobileNumber: mobileNumber == freezed
          ? _value.mobileNumber
          : mobileNumber as String,
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress as String,
      securityQuestion: securityQuestion == freezed
          ? _value.securityQuestion
          : securityQuestion as String,
      securityAnswer: securityAnswer == freezed
          ? _value.securityAnswer
          : securityAnswer as String,
    ));
  }
}

abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String firstname,
      String middlename,
      String lastname,
      String company,
      String mobileNumber,
      String emailAddress,
      String securityQuestion,
      String securityAnswer});
}

class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object firstname = freezed,
    Object middlename = freezed,
    Object lastname = freezed,
    Object company = freezed,
    Object mobileNumber = freezed,
    Object emailAddress = freezed,
    Object securityQuestion = freezed,
    Object securityAnswer = freezed,
  }) {
    return _then(_User(
      firstname: firstname == freezed ? _value.firstname : firstname as String,
      middlename:
          middlename == freezed ? _value.middlename : middlename as String,
      lastname: lastname == freezed ? _value.lastname : lastname as String,
      company: company == freezed ? _value.company : company as String,
      mobileNumber: mobileNumber == freezed
          ? _value.mobileNumber
          : mobileNumber as String,
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress as String,
      securityQuestion: securityQuestion == freezed
          ? _value.securityQuestion
          : securityQuestion as String,
      securityAnswer: securityAnswer == freezed
          ? _value.securityAnswer
          : securityAnswer as String,
    ));
  }
}

class _$_User implements _User {
  const _$_User(
      {@required this.firstname,
      @required this.middlename,
      @required this.lastname,
      @required this.company,
      @required this.mobileNumber,
      @required this.emailAddress,
      @required this.securityQuestion,
      @required this.securityAnswer})
      : assert(firstname != null),
        assert(middlename != null),
        assert(lastname != null),
        assert(company != null),
        assert(mobileNumber != null),
        assert(emailAddress != null),
        assert(securityQuestion != null),
        assert(securityAnswer != null);

  @override
  final String firstname;
  @override
  final String middlename;
  @override
  final String lastname;
  @override
  final String company;
  @override
  final String mobileNumber;
  @override
  final String emailAddress;
  @override
  final String securityQuestion;
  @override
  final String securityAnswer;

  @override
  String toString() {
    return 'User(firstname: $firstname, middlename: $middlename, lastname: $lastname, company: $company, mobileNumber: $mobileNumber, emailAddress: $emailAddress, securityQuestion: $securityQuestion, securityAnswer: $securityAnswer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.firstname, firstname) ||
                const DeepCollectionEquality()
                    .equals(other.firstname, firstname)) &&
            (identical(other.middlename, middlename) ||
                const DeepCollectionEquality()
                    .equals(other.middlename, middlename)) &&
            (identical(other.lastname, lastname) ||
                const DeepCollectionEquality()
                    .equals(other.lastname, lastname)) &&
            (identical(other.company, company) ||
                const DeepCollectionEquality()
                    .equals(other.company, company)) &&
            (identical(other.mobileNumber, mobileNumber) ||
                const DeepCollectionEquality()
                    .equals(other.mobileNumber, mobileNumber)) &&
            (identical(other.emailAddress, emailAddress) ||
                const DeepCollectionEquality()
                    .equals(other.emailAddress, emailAddress)) &&
            (identical(other.securityQuestion, securityQuestion) ||
                const DeepCollectionEquality()
                    .equals(other.securityQuestion, securityQuestion)) &&
            (identical(other.securityAnswer, securityAnswer) ||
                const DeepCollectionEquality()
                    .equals(other.securityAnswer, securityAnswer)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(firstname) ^
      const DeepCollectionEquality().hash(middlename) ^
      const DeepCollectionEquality().hash(lastname) ^
      const DeepCollectionEquality().hash(company) ^
      const DeepCollectionEquality().hash(mobileNumber) ^
      const DeepCollectionEquality().hash(emailAddress) ^
      const DeepCollectionEquality().hash(securityQuestion) ^
      const DeepCollectionEquality().hash(securityAnswer);

  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);
}

abstract class _User implements User {
  const factory _User(
      {@required String firstname,
      @required String middlename,
      @required String lastname,
      @required String company,
      @required String mobileNumber,
      @required String emailAddress,
      @required String securityQuestion,
      @required String securityAnswer}) = _$_User;

  @override
  String get firstname;
  @override
  String get middlename;
  @override
  String get lastname;
  @override
  String get company;
  @override
  String get mobileNumber;
  @override
  String get emailAddress;
  @override
  String get securityQuestion;
  @override
  String get securityAnswer;
  @override
  _$UserCopyWith<_User> get copyWith;
}
