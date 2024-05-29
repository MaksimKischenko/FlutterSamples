import 'package:flutter/material.dart';

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }
WhyFarther? _selection = WhyFarther.harder;

class MyPopUpMenuButtonScreen extends StatefulWidget {
  MyPopUpMenuButtonScreen({Key? key}) : super(key: key);
  @override
  _PopupButtonState createState() => _PopupButtonState();
}

class _PopupButtonState extends State<MyPopUpMenuButtonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton<WhyFarther>(
            onSelected: (result) {
              setState(() {
                _selection = result;
                print(result);
              });
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem(
                value: WhyFarther.harder,
                child: Text('Working a lot harder'),
              ),
              const PopupMenuItem(
                value: WhyFarther.smarter,
                child: Text('Being a lot smarter'),
              ),
              const PopupMenuItem(
                value: WhyFarther.selfStarter,
                child: Text('Being a self-starter'),
              ),
              const PopupMenuItem(
                value: WhyFarther.tradingCharter,
                child: Text('Placed in charge of trading charter'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
