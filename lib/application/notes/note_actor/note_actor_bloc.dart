import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:finished_notes_firebase_ddd_course/domain/notes/note.dart';
import 'package:finished_notes_firebase_ddd_course/domain/notes/note_failure.dart';
import 'package:finished_notes_firebase_ddd_course/domain/notes/i_note_repository.dart';

part 'note_actor_event.dart';
part 'note_actor_state.dart';

part 'note_actor_bloc.freezed.dart';

@injectable
class NoteActorBloc extends Bloc<NoteActorEvent, NoteActorState> {
  final INoteRepository _noteRepository;

  NoteActorBloc(this._noteRepository);

  @override
  NoteActorState get initialState => const NoteActorState.initial();

  @override
  Stream<NoteActorState> mapEventToState(
    NoteActorEvent event,
  ) async* {
    // We have only one NoteActorEvent - there's no union type
    yield const NoteActorState.actionInProgress();
    final possibleFailure = await _noteRepository.delete(event.note);
    yield possibleFailure.fold(
      (f) => NoteActorState.deleteFailure(f),
      // Yielding unchanged state - nothing will be emitted from the BLoC
      (_) => const NoteActorState.deleteSuccess(),
    );
  }
}
