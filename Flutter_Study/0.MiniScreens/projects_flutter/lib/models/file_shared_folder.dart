import 'package:untitled1/models/file_folder.dart';

class FileSharedFolder {
  final String ownerURL;
  final String ownerName;
  final List<FileFolder> folders;
  FileSharedFolder({
    required this.ownerURL,
    required this.ownerName,
    required this.folders,
  });
}
