
part of 'login_bloc.dart';

@freezed
abstract class LoginEvent with _$LoginEvent {
  const factory LoginEvent.emailChanged(String emailStr) = EmailChanged;
  const factory LoginEvent.passwordChanged(String passwordStr) =
  PasswordChanged;
  const factory LoginEvent.LogInWithEmailAndPasswordPressed() =
  SignInWithEmailAndPasswordPressed;

}
