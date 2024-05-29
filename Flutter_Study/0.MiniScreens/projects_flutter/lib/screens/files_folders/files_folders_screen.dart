import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/models/models.dart';

import 'widgets/widgets.dart';

class FilesFoldersScreen extends StatefulWidget {
  @override
  _FilesFoldersScreenState createState() => _FilesFoldersScreenState();
}

class _FilesFoldersScreenState extends State<FilesFoldersScreen> {
  final TextEditingController _searchController = TextEditingController();

  int _menuIndex = 0;

  List<FileFolder> folders = [
    FileFolder(
        name: 'Icons 24px',
        fileNum: 18,
        creationTime: DateTime(2020, 5, 23),
        folderURL: 'Folder.svg'),
    FileFolder(
        name: 'Icons 24px',
        fileNum: 18,
        creationTime: DateTime(2020, 5, 23),
        folderURL: 'Folder2.svg'),
    FileFolder(
        name: 'Icons 24px',
        fileNum: 18,
        creationTime: DateTime(2020, 5, 23),
        folderURL: 'Folder2.svg'),
    FileFolder(
        name: 'Icons 24px',
        fileNum: 18,
        creationTime: DateTime(2020, 5, 23),
        folderURL: 'Folder.svg'),
    FileFolder(
        name: 'Icons 24px',
        fileNum: 18,
        creationTime: DateTime(2020, 5, 23),
        folderURL: 'Folder2.svg'),
    FileFolder(
        name: 'Icons 24px',
        fileNum: 18,
        creationTime: DateTime(2020, 5, 23),
        folderURL: 'Folder.svg'),
    FileFolder(
        name: 'Icons 24px',
        fileNum: 18,
        creationTime: DateTime(2020, 5, 23),
        folderURL: 'Folder2.svg'),
    FileFolder(
        name: 'Icons 24px',
        fileNum: 18,
        creationTime: DateTime(2020, 5, 23),
        folderURL: 'Folder2.svg'),
    FileFolder(
        name: 'Icons 24px',
        fileNum: 18,
        creationTime: DateTime(2020, 5, 23),
        folderURL: 'Folder.svg'),
    FileFolder(
        name: 'Icons 24px',
        fileNum: 18,
        creationTime: DateTime(2020, 5, 23),
        folderURL: 'Folder.svg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Material(
        child: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
              border: Border(bottom: BorderSide.none),
              middle: Text('Files',
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
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Text('Manual',
                        style: TextStyle(
                            color: Color(0xff000000).withOpacity(0.2),
                            fontSize: 14)),
                    Icon(Icons.expand_more,
                        color: Color(0xff000000).withOpacity(0.2), size: 14),
                  ],
                ),
              ),
              Divider(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemBuilder: (context, index) =>
                              FolderItem(folder: folders[index]),
                          separatorBuilder: (context, _) => Divider(),
                          itemCount: folders.length),
                      Padding(
                        padding: const EdgeInsets.only(left: 64),
                        child: Divider(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: Text('${folders.length} Folders',
                            style: TextStyle(
                                color: Color(0xff39434C).withOpacity(0.5),
                                fontSize: 13,
                                fontWeight: FontWeight.w300)),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(),
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
