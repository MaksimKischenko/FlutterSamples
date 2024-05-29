import 'package:equatable/equatable.dart';

class Note extends Equatable {
  final bool check;
  final String? title;
  final String? text;

  Note({required this.check, required this.title, required this.text});

  @override
  List<Object?> get props => [check, title, text];

  Note copyWith({
    bool? check,
    String? title,
    String? text,
  }) {
    return Note(
      check: check ?? this.check,
      title: title ?? this.title,
      text: text ?? this.text,
    );
  }
}
