import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:widgets_example/styles.dart';


class CabinetMenuItem extends StatelessWidget {
  final Function() onTap;
  final IconData? icon;
  final String text;
  final bool selected;

  const CabinetMenuItem({
    required this.onTap,
    this.icon,
    required this.text,
    this.selected = false
  });

  @override
  Widget build(BuildContext context) => ResponsiveBuilder(
    builder: (context, sizingInformation) {
      if (sizingInformation.screenSize.width < 1200) {
        // small button. only icon
        return Tooltip(
          message: text,
          child: TextButton(
            //TODO: color hover
            onPressed: selected ? null : onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
              decoration: BoxDecoration(
                border: selected ? const Border(
                  bottom: BorderSide(
                    color: AppStyles.mainColor,
                    width: 3
                  )
                ) : null
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Icon(
                  icon ?? Icons.error,
                  color: selected ? AppStyles.mainColor : AppStyles.mainTextColor
                ),
              ),
            ),
          ),
        );
      } 
      
      else {
        // large button
        return TextButton(
          //TODO: color hover
          onPressed: selected ? null : onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
            decoration: BoxDecoration(
              border: selected ? const Border(
                bottom: BorderSide(
                  color: AppStyles.mainColor,
                  width: 3
                )
              ) : null
            ),
            child: Row(
              children: [
                if (icon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Icon(
                    icon,
                    color: selected ? AppStyles.mainColor : AppStyles.mainTextColor
                  ),
                ),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: selected ? AppStyles.mainColor : AppStyles.mainTextColor
                  ),
                )
              ],
            ),
          ),
        );
      }


    },
  );


}

