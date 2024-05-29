import 'package:flutter/material.dart';

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }
WhyFarther? _selection = WhyFarther.harder;

class PopUpMenuButtonScreen extends StatefulWidget {

  static String routeName = '/_elementsDemos/06_popUpMenu';

  @override
  _PopupButtonState createState() => _PopupButtonState();
}

class _PopupButtonState extends State<PopUpMenuButtonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('PopUpMenu'),
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
