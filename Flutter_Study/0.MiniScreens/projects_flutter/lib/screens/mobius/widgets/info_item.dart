import 'package:flutter/material.dart';

class InfoItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;

  const InfoItem(
      {Key? key,
      required this.icon,
      required this.title,
      required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.green, size: 40),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(title, style: TextStyle(fontSize: 16)),
                if (subtitle != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(subtitle!,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black.withOpacity(0.55))),
                  ),
              ],
            ),
          ),
          SizedBox(width: 26),
          Icon(Icons.chevron_right_outlined)
        ],
      ),
    );
  }
}
