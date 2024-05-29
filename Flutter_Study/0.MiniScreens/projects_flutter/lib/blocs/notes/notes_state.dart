part of 'notes_bloc.dart';

abstract class NotesState extends Equatable {
  const NotesState();

  @override
  List<Object?> get props => [];
}

class NotesLoading extends NotesState {}

class NotesList extends NotesState {
  final List<Note> notes;

  NotesList({required this.notes});

  @override
  List<Object> get props => [];
}

class NotesEdit extends NotesState {
  final int id;
  final Note note;

  NotesEdit({required this.id, required this.note});

  @override
  List<Object?> get props => [id, note];
}
