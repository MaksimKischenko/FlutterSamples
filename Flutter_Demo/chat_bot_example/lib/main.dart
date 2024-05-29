import 'package:flutter/material.dart';
import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';


//https://habr.com/ru/post/598761/
void main() async{
  var BOT_TOKEN = '5485309737:AAHgs9fkmreCe8q-GzEg4k0Rj15z4-PpCZ8';

  final username = (await Telegram(BOT_TOKEN).getMe()).username;

  var teledart = TeleDart(BOT_TOKEN, Event(username!));

  teledart.start();

  teledart.onMessage(keyword: 'Hello')
    .listen((message) => message.reply('SevillaMax'));
  
  teledart.onCommand('glory')
    .listen((message) => message.reply('to Jeday!'));


  teledart.onMessage(keyword: 'dart')
    .listen((message) => message.reply('Hellotelegram'));

  teledart
    .onMessage(keyword: 'photo')
    .listen((message) => message.replyPhoto(
        'https://raw.githubusercontent.com/DinoLeung/TeleDart/master/example/dash_paper_plane.png',
        caption: 'This is how the Dart Bird and Telegram are met'));

  
  teledart
    .onMessage(keyword: 'phone')
    .listen((message) => message.replyContact('+375295020246', 'Max'));

    
  teledart
    .onMessage(keyword: 'animation')
    .listen((message) => message.replyAnimation(const FlutterLogo()));


  teledart
    .onMessage(keyword: 'dice')
    .listen((message) => message.replyDice());


//и сердце не бьется 
//


  //Не работает
  // teledart
  //   .onMessage(keyword: 'dart')
  //   .where((message) => message.text?.contains('telegram') ?? false)
  //   .listen((message) => message.replyPhoto(
  //       //  io.File('example/dash_paper_plane.png'),
  //       'https://raw.githubusercontent.com/DinoLeung/TeleDart/master/example/dash_paper_plane.png',
  //       caption: 'This is how the Dart Bird and Telegram are met'));

}

