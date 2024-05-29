import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// This is the stateful widget that the main application instantiates.
class IconScreen extends StatefulWidget {
  const IconScreen({Key? key}) : super(key: key);

  @override
  _IconScreenState createState() => _IconScreenState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _IconScreenState extends State<IconScreen> {
  var url =
      'https://www.google.com/logos/doodles/2021/earth-day-2021-6753651837108909.2-s.png';
  // var url = '';
  double _volume = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.volume_up),
              tooltip: 'Increase volume by 10',
              onPressed: () {
                setState(() {
                  _volume += 10;
                });
              },
            ),
            Text('Volume : $_volume'),
            Image.network(
              url,
              width: 480,
              fit: BoxFit.cover,
              //height: 24,
              errorBuilder: (context, _, __) {
                return SizedBox(
                  width: 24,
                  height: 24,
                  child: Text(
                    "Sorry Error!",
                    style: TextStyle(color: Colors.black),
                  ),
                );
              },
            ),
            SvgPicture.asset(
              'assets/icon/dialog_success.svg',
              width: 480,
            )
          ],
        ),
      ),
    );
  }
}
