import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:untitled1/models/models.dart';

enum FileType { docx, xlsx, pptx, unknown }

class FileItem extends StatelessWidget {
  final FileInfo item;

  static const Map<FileType, String> _icons = {
    FileType.docx: 'docx.svg',
    FileType.xlsx: 'xlsx.svg',
    FileType.pptx: 'pptx.svg',
    FileType.unknown: 'unknown.svg',
  };

  const FileItem({
    Key? key,
    required this.item,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SvgPicture.asset(
            'assets/icon/${_icons[item.type]}'), //как определяет тип
        SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${item.name}',
                  style: TextStyle(
                      color: Color(0xff39434C),
                      fontSize: 16,
                      fontWeight: FontWeight.w400)),
              Row(
                children: [
                  RichText(
                      text: TextSpan(
                          text: '${item.size} KB',
                          style: TextStyle(
                              color: Color(0xff39434C).withOpacity(0.2),
                              fontSize: 13,
                              fontWeight: FontWeight.w400),
                          children: [
                        TextSpan(text: ' - '),
                        TextSpan(
                            text: '${item.creationTime.minute} minutes ago')
                      ])),
                ],
              ),
            ],
          ),
        ),
        if (item.avatarURL != null) Image.asset(item.avatarURL!)
      ],
    );
  }
}
