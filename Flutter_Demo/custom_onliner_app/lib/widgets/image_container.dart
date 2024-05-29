import 'package:custom_onliner_app/resources.dart';
import 'package:custom_onliner_app/styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ImageContainer extends StatefulWidget {
  const ImageContainer({ Key? key }) : super(key: key);

  @override
  State<ImageContainer> createState() => _ImageContainerState();
}

class _ImageContainerState extends State<ImageContainer> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {

        double width = sizingInformation.screenSize.width;
        double height = sizingInformation.screenSize.height;
        bool isWideScreen = height < width;

        return Container(
          height: isWideScreen? (height / 1.5): (height / 3),
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppStyles.mainColor,
              width: 2
            )
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              Resources.mainPictureSrc,
              fit: BoxFit.fill,
            ),
          ),
        );
      }
    );
  }
}