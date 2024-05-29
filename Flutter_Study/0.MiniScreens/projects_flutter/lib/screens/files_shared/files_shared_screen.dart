import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/models/models.dart';

import 'widgets/widgets.dart';

class FilesSharedScreen extends StatefulWidget {
  @override
  _FilesSharedScreenState createState() => _FilesSharedScreenState();
}

class _FilesSharedScreenState extends State<FilesSharedScreen> {
  final TextEditingController _searchController = TextEditingController();

  int _menuIndex = 0;

  List<FileSharedFolder> sharedFolders = [
    FileSharedFolder(
        ownerURL: 'Owner.png',
        ownerName: 'Jonathan Cunningham',
        folders: [
          FileFolder(
              name: 'UI',
              fileNum: 2,
              creationTime: DateTime(2020, 5, 23),
              folderURL: 'Folder2.svg'),
          FileFolder(
              name: 'UX',
              fileNum: 3,
              creationTime: DateTime(2020, 5, 23),
              folderURL: 'Folder2.svg'),
          FileFolder(
              name: 'Framer Components',
              fileNum: 47,
              creationTime: DateTime(2020, 5, 23),
              folderURL: 'Folder2.svg')
        ]),
    FileSharedFolder(
        ownerURL: 'Owner.png',
        ownerName: 'Jonathan Cunningham',
        folders: [
          FileFolder(
              name: 'UI',
              fileNum: 2,
              creationTime: DateTime(2020, 5, 23),
              folderURL: 'Folder2.svg'),
          FileFolder(
              name: 'UX',
              fileNum: 3,
              creationTime: DateTime(2020, 5, 23),
              folderURL: 'Folder2.svg'),
          FileFolder(
              name: 'Framer Components',
              fileNum: 47,
              creationTime: DateTime(2020, 5, 23),
              folderURL: 'Folder2.svg')
        ])
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Material(
        child: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
              border: Border(bottom: BorderSide.none),
              middle: Text('Shared',
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
              SizedBox(height: 14),
              Container(height: 20, color: Color(0xff39434C).withOpacity(0.05)),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) =>
                        FolderSharedItem(folder: sharedFolders[index]),
                    separatorBuilder: (context, _) => Container(
                        height: 20, color: Color(0xff39434C).withOpacity(0.05)),
                    itemCount: sharedFolders.length),
              ),
              Divider(),
              Container(
                width: double.maxFinite,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 24),
                color: Color(0xff39434C).withOpacity(0.05),
                child: Text('${sharedFolders.length} Users',
                    style: TextStyle(
                        color: Color(0xff39434C).withOpacity(0.5),
                        fontSize: 13,
                        fontWeight: FontWeight.w300)),
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
