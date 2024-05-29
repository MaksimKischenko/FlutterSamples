part of 'notes_bloc.dart';

abstract class NotesEvent extends Equatable {
  const NotesEvent();

  @override
  List<Object?> get props => [];
}

class NotesCreate extends NotesEvent {}

class NotesChange extends NotesEvent {
  final int id;
  final Note note;

  NotesChange({required this.id, required this.note});

  @override
  List<Object?> get props => [id, note];
}

class NotesDelete extends NotesEvent {
  final Note note;

  NotesDelete({required this.note});

  @override
  List<Object?> get props => [note];
}

class NotesSave extends NotesEvent {
  final int id;
  final Note note;

  NotesSave({
    required this.id,
    required this.note,
  });

  @override
  List<Object?> get props => [id, note];
}

class NotesCheck extends NotesEvent {
  final int id;
  final bool value;

  NotesCheck({required this.id, required this.value});

  @override
  List<Object?> get props => [id, value];
}
