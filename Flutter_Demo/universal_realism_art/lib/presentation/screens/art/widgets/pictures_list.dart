

import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:universal_realism_art/color_styles.dart';
import 'package:universal_realism_art/domain/domain.dart';



class PicturesList extends StatefulWidget {
  final List<Picture> pictures;
  final ScrollController hideBottomNavController;
  

  const PicturesList({
    Key? key,
    required this.pictures,
    required this.hideBottomNavController,
  }) : super(key: key);

  @override
  State<PicturesList> createState() => _PicturesListState();
}

class _PicturesListState extends State<PicturesList> {
  var _middleIndex = 0;

  @override
  void initState() {
    super.initState();
     widget.hideBottomNavController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    widget.hideBottomNavController.removeListener(_scrollListener);
    widget.hideBottomNavController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    setState(() {
    _middleIndex = (widget.hideBottomNavController.offset / MediaQuery.of(context).size.height).round();
    });
    log('${_middleIndex}');
  }  

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ListView.separated(
        itemCount: widget.pictures.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),      
        separatorBuilder: (context, index) => const SizedBox(height: 42),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 24),
          child: Ink(
            child: InkWell(
              onTap: () async{
                // final result =  await imageToBytes(const AssetImage('assets/images/Kischenko.png'));
                // navigateToPicture(context, widget.pictures[index]);
              },
              child: AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: _middleIndex == index? 1:0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.pictures[index].name, style: Theme.of(context).textTheme.bodyMedium),
                    Text(widget.pictures[index].description, style: Theme.of(context).textTheme.bodySmall),
                    const SizedBox(height: 12),
                    Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: ColorStyles.mainColor,
                          width: 4,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: widget.pictures[index].image
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        )
      )
    );

  Future<void> navigateToPicture(BuildContext context, Picture picture) async {
     await context.pushNamed<Picture>('picture', 
      extra: picture
    );
  }

  // Future<Uint8List> imageToBytes(ImageProvider imageProvider) async{
  //   final completer = Completer<Uint8List>();
  //   final imageStream = imageProvider.resolve(ImageConfiguration.empty);
  //   // ignore: cascade_invocations
  //   imageStream.addListener(
  //     ImageStreamListener((imageInfo, _) async{
  //       final image = imageInfo.image;
  //       final byteData = image.toByteData(format: ImageByteFormat.png);
  //       final bytes = (await byteData)?.buffer.asUint8List();
  //       completer.complete(bytes);
  //     }),
  //   );

  //   return completer.future;
  // }
}