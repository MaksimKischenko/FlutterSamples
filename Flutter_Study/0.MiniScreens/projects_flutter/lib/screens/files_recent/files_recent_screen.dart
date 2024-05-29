import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/models/models.dart';

import 'widgets/widgets.dart';

class FilesRecentScreen extends StatefulWidget {
  @override
  _FilesRecentScreenState createState() => _FilesRecentScreenState();
}

class _FilesRecentScreenState extends State<FilesRecentScreen> {
  final TextEditingController _searchController = TextEditingController();

  int _menuIndex = 0;

  final List<FileInfo> files = [
    FileInfo(
        name: 'Family budget.xlsx',
        size: 182,
        creationTime: DateTime(2021, 5, 24),
        avatarURL: null,
        type: FileType.xlsx),
    FileInfo(
        name: "John's offer.docx",
        size: 39,
        creationTime: DateTime(2021, 5, 24),
        avatarURL: 'assets/Editor.png',
        type: FileType.docx),
    FileInfo(
        name: 'Mobile UX.pptx',
        size: 821,
        creationTime: DateTime(2021, 5, 24),
        avatarURL: 'assets/Editor.png',
        type: FileType.pptx),
    FileInfo(
        name: 'package.json',
        size: 0.530,
        creationTime: DateTime(2021, 5, 24),
        avatarURL: null,
        type: FileType.unknown),
    FileInfo(
        name: 'Invoice (Oct).docx',
        size: 24,
        creationTime: DateTime(2021, 5, 24),
        avatarURL: null,
        type: FileType.docx),
    FileInfo(
        name: 'Family budget.xlsx',
        size: 182,
        creationTime: DateTime(2021, 5, 24),
        avatarURL: null,
        type: FileType.xlsx),
    FileInfo(
        name: "John's offer.docx",
        size: 39,
        creationTime: DateTime(2021, 5, 24),
        avatarURL: 'assets/Editor.png',
        type: FileType.docx),
    FileInfo(
        name: 'Mobile UX.pptx',
        size: 821,
        creationTime: DateTime(2021, 5, 24),
        avatarURL: 'assets/Editor.png',
        type: FileType.pptx),
    FileInfo(
        name: 'package.json',
        size: 0.530,
        creationTime: DateTime(2021, 5, 24),
        avatarURL: null,
        type: FileType.unknown),
    FileInfo(
        name: 'Invoice (Oct).docx',
        size: 24,
        creationTime: DateTime(2021, 5, 24),
        avatarURL: null,
        type: FileType.docx),
    FileInfo(
        name: 'Family budget.xlsx',
        size: 182,
        creationTime: DateTime(2021, 5, 24),
        avatarURL: null,
        type: FileType.xlsx),
    FileInfo(
        name: "John's offer.docx",
        size: 39,
        creationTime: DateTime(2021, 5, 24),
        avatarURL: 'assets/Editor.png',
        type: FileType.docx),
    FileInfo(
        name: 'Mobile UX.pptx',
        size: 821,
        creationTime: DateTime(2021, 5, 24),
        avatarURL: 'assets/Editor.png',
        type: FileType.pptx),
    FileInfo(
        name: 'package.json',
        size: 0.530,
        creationTime: DateTime(2021, 5, 24),
        avatarURL: null,
        type: FileType.unknown),
    FileInfo(
        name: 'Invoice (Oct).docx',
        size: 24,
        creationTime: DateTime(2021, 5, 24),
        avatarURL: null,
        type: FileType.docx),
    FileInfo(
        name: 'Family budget.xlsx',
        size: 182,
        creationTime: DateTime(2021, 5, 24),
        avatarURL: null,
        type: FileType.xlsx),
    FileInfo(
        name: "John's offer.docx",
        size: 39,
        creationTime: DateTime(2021, 5, 24),
        avatarURL: 'assets/Editor.png',
        type: FileType.docx),
    FileInfo(
        name: 'Mobile UX.pptx',
        size: 821,
        creationTime: DateTime(2021, 5, 24),
        avatarURL: 'assets/Editor.png',
        type: FileType.pptx),
    FileInfo(
        name: 'package.json',
        size: 0.530,
        creationTime: DateTime(2021, 5, 24),
        avatarURL: null,
        type: FileType.unknown),
    FileInfo(
        name: 'Invoice (Oct).docx',
        size: 24,
        creationTime: DateTime(2021, 5, 24),
        avatarURL: null,
        type: FileType.docx),
    FileInfo(
        name: 'Family budget.xlsx',
        size: 182,
        creationTime: DateTime(2021, 5, 24),
        avatarURL: null,
        type: FileType.xlsx),
    FileInfo(
        name: "John's offer.docx",
        size: 39,
        creationTime: DateTime(2021, 5, 24),
        avatarURL: 'assets/Editor.png',
        type: FileType.docx),
    FileInfo(
        name: 'Mobile UX.pptx',
        size: 821,
        creationTime: DateTime(2021, 5, 24),
        avatarURL: 'assets/Editor.png',
        type: FileType.pptx),
    FileInfo(
        name: 'package.json',
        size: 0.530,
        creationTime: DateTime(2021, 5, 24),
        avatarURL: null,
        type: FileType.unknown),
    FileInfo(
        name: 'Invoice (Oct).docx',
        size: 24,
        creationTime: DateTime(2021, 5, 24),
        avatarURL: null,
        type: FileType.docx),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Material(
        child: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
              border: Border(bottom: BorderSide.none),
              middle: Text('Recent',
                  style: TextStyle(
                      color: Color(0xff39434C),
                      fontSize: 34,
                      fontWeight: FontWeight.w800)),
              trailing: IconButton(
                  icon: Icon(Icons.add, size: 30, color: Color(0xff47A7FF)),
                  onPressed: () {})),
          child: Column(
            children: [
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: _searchController,
                  showCursor: false,
                  decoration: InputDecoration(
                    hintText: 'Search files',
                    hintStyle: TextStyle(
                        color: Color(0xff000000).withOpacity(0.2),
                        fontSize: 18),
                    fillColor: Color(0xff39434C).withOpacity(0.05),
                    filled: true,
                    isDense: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none),
                    prefixIcon: Icon(Icons.search,
                        color: Color(0xff000000).withOpacity(0.2), size: 30),
                    // icon:
                  ),
                ),
              ),
              SizedBox(height: 28),
              Expanded(
                child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    // physics: NeverScrollableScrollPhysics(),
                    // shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        FileItem(item: files[index]),
                    separatorBuilder: (context, _) => Divider(),
                    itemCount: files.length),
              ),
              MenuBottom(
                  selectedIndex: _menuIndex,
                  onTap: (selected) => setState(() => _menuIndex = selected))
            ],
          ),
        ),
      ),
    );
  }
}
