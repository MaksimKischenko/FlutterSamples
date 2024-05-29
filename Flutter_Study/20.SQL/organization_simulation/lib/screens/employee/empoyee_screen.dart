import 'package:flutter/material.dart';

class EmployeeScreen extends StatefulWidget {

  static String pageName = 'Employee menu';
  
  @override
  _EmployeeScreenScreenState createState() => _EmployeeScreenScreenState();
}

class _EmployeeScreenScreenState extends State<EmployeeScreen> {


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text('EMPLOYEE'),
    );
  }
}