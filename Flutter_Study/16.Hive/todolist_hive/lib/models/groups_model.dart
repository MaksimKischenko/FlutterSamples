import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist_hive/domain/group.dart';

class GroupFormWidgetModel {
  
  var groupName = '';

  void saveGroup(BuildContext context) async {
    if(groupName.isEmpty) return;
    if(!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(GroupAdapter());
    }
    final box = await Hive.openBox<Group>('groups_box');
    final group = Group(name: groupName);
    //unawaited(box.add(group)); //если Future не ждем то обязательно нжно сделать такую штуку
    await box.add(group);
    Navigator.of(context).pop();
  }
}

class GroupFormWidgetProvider extends InheritedWidget {
  final GroupFormWidgetModel model;

  const GroupFormWidgetProvider({
    Key? key,
    required this.model,
    required Widget child
    
    }) : super(child: child, key: key);



  static GroupFormWidgetProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GroupFormWidgetProvider>();
  }

  
  static GroupFormWidgetProvider? read(BuildContext context) {
    final widget = context.getElementForInheritedWidgetOfExactType<GroupFormWidgetProvider>()?.widget;
    return widget is GroupFormWidgetProvider? widget : null;
  }


  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    throw true;
  }

}