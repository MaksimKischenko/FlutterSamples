import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class SimpleUser {
  final int age;
  final ActionCategories test;

  const SimpleUser({
    required this.age,
    required this.test
  });
}

enum ActionCategories {

  paymentOffLine('Oplata', Colors.amber),
  paymentOnLine('Oplata v internete', Colors.blueAccent), 
  available('Dostupno', Colors.green),
  transferTo('Spisan perevod', Colors.redAccent),
  moneyFromTerminal('Sniatie nalichnyh', Colors.redAccent),
  unknown('unknown', Colors.black),
  transfer('Zachisleno', Colors.amberAccent),
  transferFrom('Zachislen perevod', Colors.amberAccent);

  const ActionCategories(this.actionName, this.color);
  final String actionName;
  final Color color;
}


class IsolateData {
  final RootIsolateToken token;
  final Function(int i) function;
  final SendPort answerPort;

  IsolateData({
    required this.token,
    required this.function,
    required this.answerPort,
  });
}


