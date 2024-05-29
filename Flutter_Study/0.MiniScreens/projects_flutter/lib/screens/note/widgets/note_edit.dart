import 'package:flutter/material.dart';

import 'package:untitled1/models/models.dart';

class NoteEdit extends StatefulWidget {
  final Note note;
  final Function(Note note) onSave;
  final Function(Note note) onDelete;

  NoteEdit({
    Key? key,
    required this.note,
    required this.onSave,
    required this.onDelete,
  }) : super(key: key);

  @override
  _NoteEditState createState() => _NoteEditState();
}

class _NoteEditState extends State<NoteEdit> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController? _titleController;
  TextEditingController? _textController;

  String? _title;
  String? _text;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note.title);
    _textController = TextEditingController(text: widget.note.text);
  }

  @override
  void dispose() {
    _titleController?.dispose();
    _textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _titleController,
            decoration: InputDecoration(labelText: "Title"),
            maxLines: 2,
            onSaved: (value) =>
                _title = (value?.isEmpty ?? true) ? null : value,
          ),
          TextFormField(
            controller: _textController,
            decoration: InputDecoration(labelText: "Text"),
            maxLines: 10,
            onSaved: (value) => _text = (value?.isEmpty ?? true) ? null : value,
          ),
          SizedBox(height: 16),
          Row(
            children: [
              TextButton(
                onPressed: _onSaveTap,
                child: Text('Save'),
              ),
              TextButton(
                onPressed: _onDeleteTap,
                child: Text('Delete'),
              ),
              TextButton(
                onPressed: () {
                  //_formKey.currentState?.reset();
                  _titleController?.clear();
                  _textController?.clear();
                },
                child: Text('Clean'),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _onSaveTap() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      widget.onSave(Note(check: widget.note.check, title: _title, text: _text));
    }
  }

  void _onDeleteTap() {
    if (_formKey.currentState?.validate() ?? false) {
      widget.onDelete(widget.note);
    }
  }
}
