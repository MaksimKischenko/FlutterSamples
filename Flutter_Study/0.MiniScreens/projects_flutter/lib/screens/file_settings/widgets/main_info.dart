import 'package:flutter/material.dart';
import 'package:untitled1/screens/file_settings/widgets/widgets.dart';

class MainInfo extends StatelessWidget {
  final int occupiedSpace;
  final int totalSpace;
  const MainInfo({
    Key? key,
    required this.occupiedSpace,
    required this.totalSpace,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Use Cellular Data',
                  style: TextStyle(
                    color: Color(0xff39434C).withOpacity(0.7),
                    fontSize: 15,
                  )),
              CupertinoSwitchWidget()
            ],
          ),
          Divider(),
          Row(
            children: [
              Text('Used Storage',
                  style: TextStyle(
                    color: Color(0xff39434C).withOpacity(0.7),
                    fontSize: 15,
                  )),
              Spacer(),
              Text('${occupiedSpace}GB of ${totalSpace}GB',
                  style: TextStyle(
                    color: Color(0xff47A7FF),
                    fontSize: 16,
                  )),
              Icon(Icons.arrow_forward_ios, color: Color(0xffE5E5E5))
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Security',
                  style: TextStyle(
                    color: Color(0xff39434C).withOpacity(0.7),
                    fontSize: 15,
                  )),
              Icon(Icons.arrow_forward_ios, color: Color(0xffE5E5E5))
            ],
          )
        ],
      ),
    );
  }
}
