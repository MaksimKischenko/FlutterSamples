import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class TaxiVerifyScreen extends StatefulWidget {
  @override
  _TaxiVerifyScreenState createState() => _TaxiVerifyScreenState();
}

class _TaxiVerifyScreenState extends State<TaxiVerifyScreen> {
  final _firstDigitController = TextEditingController();
  final _secondDigitController = TextEditingController();
  final _thirdDigitController = TextEditingController();
  final _fouthDigitController = TextEditingController();

  final _firstFocusNode = FocusNode();
  final _secondFocusNode = FocusNode();
  final _thirdFocusNode = FocusNode();
  final _fouthFocusNode = FocusNode();

  String get code =>
      _firstDigitController.text +
      _secondDigitController.text +
      _thirdDigitController.text +
      _fouthDigitController.text;

  //!_geter для задания логики
  FocusNode? get currentFocusNode {
    final lenght = code.length;
    if (lenght == 0) {
      return _firstFocusNode;
    } else if (lenght == 1) {
      return _secondFocusNode;
    } else if (lenght == 2) {
      return _thirdFocusNode;
    } else if (lenght == 3) {
      return _fouthFocusNode;
    }
  }

  @override
  void initState() {
    super.initState();

    _firstFocusNode.requestFocus();
  }

  @override
  void dispose() {
    _firstDigitController.dispose();
    _secondDigitController.dispose();
    _thirdDigitController.dispose();
    _fouthDigitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Verify code',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Column(
        //mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 40),
                  Center(
                    child: Text(
                      'A code has been sent to\n+33 234 556 7888 via SMS',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CodeField(
                        controller: _firstDigitController,
                        focusNode: _firstFocusNode,
                        onTap: (focusNode) {
                          print('First');
                          final currFocusNode = currentFocusNode;
                          if (focusNode != currFocusNode) {
                            currFocusNode?.requestFocus();
                          }
                        },
                      ),
                      SizedBox(width: 12),
                      CodeField(
                        controller: _secondDigitController,
                        focusNode: _secondFocusNode,
                        onTap: (focusNode) {
                          final currFocusNode = currentFocusNode;
                          if (focusNode != currFocusNode) {
                            currFocusNode?.requestFocus();
                          }
                        },
                      ),
                      SizedBox(width: 12),
                      CodeField(
                        controller: _thirdDigitController,
                        focusNode: _thirdFocusNode,
                        onTap: (focusNode) {
                          final currFocusNode = currentFocusNode;
                          if (focusNode != currFocusNode) {
                            currFocusNode?.requestFocus();
                          }
                        },
                      ),
                      SizedBox(width: 12),
                      CodeField(
                        controller: _fouthDigitController,
                        focusNode: _fouthFocusNode,
                        onTap: (focusNode) {
                          final currFocusNode = currentFocusNode;
                          if (focusNode != currFocusNode) {
                            currFocusNode?.requestFocus();
                          }
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text('The SMS with the code didn’t arrive? ',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey)),
                ],
              ),
            ),
          ),
          CallButton(onTap: () {}),
          KeyboardFull(
            onNumTap: onNumTap,
            onBackspaceTap: _onBackspaceTap,
          )
        ],
      ),
    );
  }

  void onNumTap(int value) {
    if (_firstFocusNode.hasFocus) {
      _firstDigitController.text = value.toString();
      _secondFocusNode.requestFocus();
    } else if (_secondFocusNode.hasFocus && _firstDigitController.text != '') {
      _secondDigitController.text = value.toString();
      _thirdFocusNode.requestFocus();
    } else if (_thirdFocusNode.hasFocus && _secondDigitController.text != '') {
      _thirdDigitController.text = value.toString();
      _fouthFocusNode.requestFocus();
    } else if (_fouthFocusNode.hasFocus && _thirdDigitController.text != '') {
      _fouthDigitController.text = value.toString();
      onApplyTap();
    } else {
      _firstDigitController.text = value.toString();
      _secondFocusNode.requestFocus();
    }
  }

  void _onBackspaceTap() {
    if (_firstFocusNode.hasFocus) {
      _firstDigitController.clear();
    } else if (_secondFocusNode.hasFocus) {
      _firstDigitController.clear();
      _firstFocusNode.requestFocus();
    } else if (_thirdFocusNode.hasFocus) {
      _secondDigitController.clear();
      _secondFocusNode.requestFocus();
    } else if (_fouthFocusNode.hasFocus) {
      _thirdDigitController.clear();
      _thirdFocusNode.requestFocus();
    }
  }

  void onApplyTap() {
    print('code: $code');
    if (code == '1234') {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('corrent pin')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('incorrent pin')));
    }
    _firstFocusNode.requestFocus();
    _firstDigitController.clear();
    _secondDigitController.clear();
    _thirdDigitController.clear();
    _fouthDigitController.clear();
  }

  // Widget _futureButton() {
  //   Widget body = Container();
  //   _fouthDigitController.text != ''
  //       ? body = KeyboardButton(
  //           onTap: () {},
  //           child: Icon(
  //             Icons.check_circle,
  //             color: Colors.green,
  //             size: 28,
  //           ))
  //       : body = Spacer();
  //   return body;
  // }
}
