import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled1/models/models.dart';

class FolderItem extends StatelessWidget {
  final FileFolder folder;

  const FolderItem({
    Key? key,
    required this.folder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset('assets/icon/${folder.folderURL}'),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                folder.name,
                style: TextStyle(
                    color: Color(0xff39434C),
                    fontSize: 16,
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(height: 6),
              Text('${folder.fileNum} files - ${folder.creationTime}',
                  style: TextStyle(
                      color: Color(0xff39434C).withOpacity(0.5),
                      fontSize: 13,
                      fontWeight: FontWeight.w300)),
            ],
          ),
        ),
        Icon(Icons.arrow_forward_ios,
            size: 20, color: Color(0xff39434C).withOpacity(0.5))
      ],
    );
  }
}
