import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class FilesSettingsScreen extends StatefulWidget {
  const FilesSettingsScreen({Key? key}) : super(key: key);

  @override
  _FilesSettingsScreenState createState() => _FilesSettingsScreenState();
}

class _FilesSettingsScreenState extends State<FilesSettingsScreen> {
  int _menuIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Material(
            child: CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  border: Border(bottom: BorderSide.none),
                  middle: Text('Settings',
                      style: TextStyle(
                          color: Color(0xff39434C),
                          fontSize: 34,
                          fontWeight: FontWeight.w800)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 8),
                      InfoTitle(title: 'Personal information'),
                      PersonalInfo(
                          name: 'Brandon Ward', userName: '@brndn_wrd'),
                      InfoTitle(title: 'Main'),
                      MainInfo(occupiedSpace: 24, totalSpace: 50),
                      InfoTitle(title: 'Account'),
                      AccountInfo(),
                      SizedBox(height: 24),
                      Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.fromLTRB(16, 24, 16, 70),
                        color: Color(0xffE5E5E5),
                        child: MaterialButton(
                            color: Colors.white,
                            child: Text('Log Out',
                                style: TextStyle(
                                  color: Color(0xffF43535),
                                  fontSize: 15,
                                )),
                            padding: EdgeInsets.symmetric(
                                horizontal: 144, vertical: 16),
                            onPressed: () {}),
                      ),
                      MenuBottom(
                          selectedIndex: _menuIndex,
                          onTap: (selected) =>
                              setState(() => _menuIndex = selected))
                    ],
                  ),
                ))));
  }
}
