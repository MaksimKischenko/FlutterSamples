import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:organization_simulation/styles.dart';


class LoadingIndicator extends StatelessWidget {
  final Color color;
  
  const LoadingIndicator({
    Key? key,
    this.color = AppStyles.mainColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation<Color>(color),
  );
}