import 'package:flutter/material.dart';
import 'package:random_provider_app/styles.dart';


class TitleApp extends StatefulWidget {

  final String name;
  final AnimatedIconData icon;
  final Function() onPressed;


  TitleApp({
    Key? key,
    required this.name,
    required this.icon,
    required this.onPressed
  }) : super(key: key);

  @override
  State<TitleApp> createState() => _TitleAppState();
}

class _TitleAppState extends State<TitleApp> with SingleTickerProviderStateMixin{

  late AnimationController _animationController;
  bool isInfoPressed = false;

  @override
  void initState() {
    super.initState();
     _animationController =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 450));
  }
  
  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(widget.name, style: AppStyles.headerTextStyle),
      IconButton(
        icon: AnimatedIcon(
          progress: _animationController,
          color: Colors.white,
          icon: widget.icon,
        ),
        onPressed: () {
          _handleOnPressed();
          widget.onPressed.call();
        } //setState(_handleOnPressed)
      )
    ],
  );

  void _handleOnPressed() {
    isInfoPressed = !isInfoPressed;
    isInfoPressed
          ? _animationController.forward()
          : _animationController.reverse();
  }
}
