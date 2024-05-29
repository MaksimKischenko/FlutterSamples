import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {

 static String routeName = '/_elementsDemos/08_drawer';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Drawer')),
      body: Center(
        child: TextButton(
          child: Text('Back'),
          onPressed: ()=> Navigator.pop(context)
        )),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
