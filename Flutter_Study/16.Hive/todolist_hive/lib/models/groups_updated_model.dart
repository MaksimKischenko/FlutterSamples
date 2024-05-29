import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist_hive/domain/group.dart';

class GroupsUpdatedModel extends ChangeNotifier {

  GroupsUpdatedModel() {
    _setUp();
  }

  void showForm(BuildContext context) {
    Navigator.of(context).pushNamed('/groups/form');
  }

  var _groups = <Group>[];

  List<Group> get groups => _groups.toList(); //для возвращения другого листа так чтобы ничего туда нельзя было положить 


  void deleteGroup(int index) async {

    if(!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(GroupAdapter());
    }
    final box = await Hive.openBox<Group>('groups_box'); 
    await box.deleteAt(index);
  }

  void _readGroupsFromHive(Box<Group> box) async {
    _groups = box.values.toList();
    notifyListeners();
  } 

  void _setUp() async {

    if(!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(GroupAdapter());
    }
    final box = await Hive.openBox<Group>('groups_box');

    _readGroupsFromHive(box);

    box.listenable().addListener(() {
      _readGroupsFromHive(box);
    });
  }
}

class GroupsUpdatedModelProvider extends InheritedNotifier {
  

  final GroupsUpdatedModel model;

  const GroupsUpdatedModelProvider({
      Key? key,
      required this.model,
      required Widget child
    }
  ) : super(child: child, notifier: model, key: key);
  


  static GroupsUpdatedModelProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GroupsUpdatedModelProvider>();
  }

  
  static GroupsUpdatedModelProvider? read(BuildContext context) {
    final widget = context.getElementForInheritedWidgetOfExactType<GroupsUpdatedModelProvider>()?.widget;
    return widget is GroupsUpdatedModelProvider? widget : null;
  }


}