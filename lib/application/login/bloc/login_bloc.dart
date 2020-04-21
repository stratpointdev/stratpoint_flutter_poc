import 'package:globe_one_poc_project/infrastructure/login/login_service.dart';
import 'package:globe_one_poc_project/infrastructure/login/models/profile.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserService userService = UserService();

  @override
  LoginState get initialState => LoginState.initial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    yield* event.map(
      emailChanged: (e) async* {
        yield state.copyWith(
          emailAddress: e.emailStr,
        );
      },
      passwordChanged: (e) async* {
        yield state.copyWith(
          password: e.passwordStr,
        );
      },
      signInWithEmailAndPasswordPressed: (e) async* {
        yield* _LogInWithEmailAndPassword();
      },
    );
  }

  Stream<LoginState> _LogInWithEmailAndPassword() async* {
    yield state.copyWith(
      isSubmitting: true,
    );
    String response =
        await userService.logInUser(state.emailAddress, state.password);

    Profile profile = await userService.getUserViaSession(response);

    if (response != "error" && profile != null) {
      yield state.copyWith(
          isSubmitting: false, token: response, profile: profile);
    } else {
      yield state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        errorMessage: 'Invalid email address or password!',
      );
    }
  }
}
