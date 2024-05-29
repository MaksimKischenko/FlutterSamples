import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled1/models/models.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  NotesBloc() : super(NotesList(notes: []));

  List<Note> notes = [];

  @override
  Stream<NotesState> mapEventToState(
    NotesEvent event,
  ) async* {
    if (event is NotesCreate) {
      yield* _mapNotesCreateToState(event);
    } else if (event is NotesChange) {
      yield* _mapNotesChangeToState(event);
    } else if (event is NotesDelete) {
      yield* _mapNotesDeleteToState(event);
    } else if (event is NotesSave) {
      yield* _mapNotesSaveToState(event);
    } else if (event is NotesCheck) {
      yield* _mapNotesCheckToState(event);
    }
  }

  Stream<NotesState> _mapNotesCreateToState(NotesCreate event) async* {
    yield NotesLoading();
    await Future.delayed(Duration(milliseconds: 500));
    notes.add(Note(check: false, title: null, text: null));
    yield NotesList(notes: notes);
  }

  Stream<NotesState> _mapNotesChangeToState(NotesChange event) async* {
    yield NotesLoading();
    await Future.delayed(Duration(seconds: 1));
    yield NotesEdit(id: event.id, note: event.note);
  }

  Stream<NotesState> _mapNotesDeleteToState(NotesDelete event) async* {
    yield NotesLoading();
    notes.remove(event.note);
    yield NotesList(notes: notes);
  }

  Stream<NotesState> _mapNotesSaveToState(NotesSave event) async* {
    yield NotesLoading();
    notes[event.id] = event.note;
    yield NotesList(notes: notes);
  }

  Stream<NotesState> _mapNotesCheckToState(NotesCheck event) async* {
    yield NotesLoading();
    notes[event.id] = notes[event.id].copyWith(check: event.value);
    yield NotesList(notes: notes);
  }
}
