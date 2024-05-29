import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:organization_simulation/styles.dart';

class SaveButton extends StatelessWidget {
  final String? buttonText;
  final Function() onTap;
  final bool isAvaible;

  const SaveButton({
    required this.onTap,
    this.buttonText,
    this.isAvaible = true
  });
  
  @override
  Widget build(BuildContext context) => CupertinoButton(
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
    onPressed: isAvaible ? onTap : null,
    color: AppStyles.mainColor,
    disabledColor: AppStyles.mainTextColor.withOpacity(0.5),
    child:  Text(
      '$buttonText',
      style: TextStyle(
        color: Colors.white
      ),
    )
  );
}