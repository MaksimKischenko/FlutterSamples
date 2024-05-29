import 'package:untitled1/screens/files_recent/widgets/widgets.dart';

class FileInfo {
  final String name;

  /// in Kb
  final double size;
  final DateTime creationTime;
  final String? avatarURL;
  final FileType type;
  FileInfo(
      {required this.name,
      required this.size,
      required this.creationTime,
      required this.avatarURL,
      required this.type});
}
