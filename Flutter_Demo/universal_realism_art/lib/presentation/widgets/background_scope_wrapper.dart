import 'package:flutter/material.dart';
import 'package:universal_realism_art/color_styles.dart';

class BackgroundScopeWrapper extends StatelessWidget {
  final Widget child;

  const BackgroundScopeWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
    decoration:  BoxDecoration(
      color: ColorStyles.thirdColor,
      // gradient: RadialGradient(
      //   center: Alignment.topRight,
      //   radius: 2,
      //   colors: [
      //     const Color(0xffFDF5E6).withOpacity(0.6),
      //     const Color(0xffFDF5E6).withOpacity(0.6),
      //     const Color(0xffFDF5E6).withOpacity(0.6),
      //   ],
      //   stops: const [0.1, 0.5, 0.9],
      // ),
    ),
    child: child,
  );
}
