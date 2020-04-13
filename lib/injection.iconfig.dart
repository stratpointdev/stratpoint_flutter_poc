// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:google_sign_in/google_sign_in.dart';
import 'package:finished_notes_firebase_ddd_course/infrastructure/core/firebase_injectable_module.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finished_notes_firebase_ddd_course/infrastructure/auth/firebase_user_mapper.dart';
import 'package:finished_notes_firebase_ddd_course/infrastructure/notes/note_repository.dart';
import 'package:finished_notes_firebase_ddd_course/domain/notes/i_note_repository.dart';
import 'package:finished_notes_firebase_ddd_course/application/notes/note_watcher/note_watcher_bloc.dart';
import 'package:finished_notes_firebase_ddd_course/application/notes/note_actor/note_actor_bloc.dart';
import 'package:finished_notes_firebase_ddd_course/application/notes/note_form/note_form_bloc.dart';
import 'package:finished_notes_firebase_ddd_course/infrastructure/auth/firebase_auth_facade.dart';
import 'package:finished_notes_firebase_ddd_course/domain/auth/i_auth_facade.dart';
import 'package:finished_notes_firebase_ddd_course/application/auth/auth_bloc.dart';
import 'package:finished_notes_firebase_ddd_course/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  g.registerLazySingleton<GoogleSignIn>(
      () => firebaseInjectableModule.googleSignIn);
  g.registerLazySingleton<FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth);
  g.registerLazySingleton<Firestore>(() => firebaseInjectableModule.firestore);
  g.registerLazySingleton<FirebaseUserMapper>(() => FirebaseUserMapper());
  g.registerFactory<NoteWatcherBloc>(
      () => NoteWatcherBloc(g<INoteRepository>()));
  g.registerFactory<NoteActorBloc>(() => NoteActorBloc(g<INoteRepository>()));
  g.registerFactory<NoteFormBloc>(() => NoteFormBloc(g<INoteRepository>()));
  g.registerFactory<AuthBloc>(() => AuthBloc(g<IAuthFacade>()));
  g.registerFactory<SignInFormBloc>(() => SignInFormBloc(g<IAuthFacade>()));

  //Register prod Dependencies --------
  if (environment == 'prod') {
    g.registerLazySingleton<INoteRepository>(
        () => NoteRepository(g<Firestore>()));
    g.registerLazySingleton<IAuthFacade>(() => FirebaseAuthFacade(
          g<FirebaseAuth>(),
          g<GoogleSignIn>(),
          g<FirebaseUserMapper>(),
        ));
  }
}

class _$FirebaseInjectableModule extends FirebaseInjectableModule {}
