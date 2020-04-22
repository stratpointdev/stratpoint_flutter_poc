part of 'login_bloc.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState(
      {String emailAddress,
      String password,
      bool showErrorMessages,
      String errorMessage,
      bool isSubmitting,
      bool isRemember,
      String token,
      Profile profile}) = _LoginState;

  factory LoginState.initial() => LoginState(
      emailAddress: '',
      password: '',
      showErrorMessages: false,
      errorMessage: '',
      isSubmitting: false,
      isRemember: false,
      token: '',
      profile: new Profile());
}
