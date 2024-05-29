import 'package:flutter/material.dart';

import 'package:untitled1/models/models.dart';
import 'package:untitled1/screens/files_folders/widgets/widgets.dart';

class FolderSharedItem extends StatelessWidget {
  final FileSharedFolder folder;

  const FolderSharedItem({
    Key? key,
    required this.folder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Image.asset('assets/${folder.ownerURL}'),
              SizedBox(width: 14),
              Expanded(
                child: Text(folder.ownerName,
                    style: TextStyle(
                        color: Color(0xff39434C),
                        fontSize: 17,
                        fontWeight: FontWeight.w800)),
              ),
              Icon(Icons.more_horiz, size: 30, color: Color(0xff47A7FF))
            ],
          ),
          Divider(),
          Column(
            children: [
              for (var i = 0; i < folder.folders.length; i++)
                Column(
                  children: [
                    FolderItem(folder: folder.folders[i]),
                    Divider(),
                  ],
                )
            ],
          ),
          SizedBox(height: 10)
        ],
      ),
    );
  }
}
