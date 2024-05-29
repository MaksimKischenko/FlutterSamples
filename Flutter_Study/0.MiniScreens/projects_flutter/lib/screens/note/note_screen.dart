import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/blocs/blocs.dart';
import 'package:untitled1/models/note_model.dart';

import 'widgets/widgets.dart';

class NoteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => context.read<NotesBloc>().add(NotesCreate()),
          ),
        ],
      ),
      body: BlocBuilder<NotesBloc, NotesState>(
        builder: (context, state) {
          Widget body = Container();
          if (state is NotesLoading) {
            body = Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: double.maxFinite),
                CircularProgressIndicator()
              ],
            );
          } else if (state is NotesList) {
            body = ListView.builder(
                itemCount: state.notes.length,
                itemBuilder: (context, index) => NoteItem(
                      note: state.notes[index],
                      onTap: (note) => context
                          .read<NotesBloc>()
                          .add(NotesChange(id: index, note: note)),
                      onCheckTap: (value) => context
                          .read<NotesBloc>()
                          .add(NotesCheck(id: index, value: value)),
                    ));
          } else if (state is NotesEdit) {
            body = NoteEdit(
              note: state.note,
              onSave: (note) => context
                  .read<NotesBloc>()
                  .add(NotesSave(id: state.id, note: note)),
              onDelete: (note) =>
                  context.read<NotesBloc>().add(NotesDelete(note: note)),
            );
          }
          return body;
        },
      ),
    );
  }
}
