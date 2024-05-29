import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FileManagerScreen extends StatefulWidget {
  const FileManagerScreen({ Key? key }) : super(key: key);

  @override
  State<FileManagerScreen> createState() => _FileManagerScreenState();
}

class _FileManagerScreenState extends State<FileManagerScreen> {

late List<File> files;

@override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: _loadFile, 
                child: const Text('LOAD')
              ),
              // ...files.map((e) => Container(
              //   child: Text(e.path),
              // )).toList()
            ],
          ),
        ),
      ),
    );
  }

  void _loadFile() async {
    //FilePickerResult? result = await FilePicker.platform.pickFiles();
    String file = await FilePicker.platform.getDirectoryPath(
      initialDirectory: 'D//FlutterWork'
    ) ?? '';
    print(file);

    //  if(result != null) {
    //   files = result.paths.map((path) => File('D:/FlutterWork')).toList();
    //  }
  }
}