import 'package:flutter/material.dart';

import '../models/groups_model.dart';

class GroupsFormWidget extends StatefulWidget {
  const GroupsFormWidget({ Key? key }) : super(key: key);

  @override
  State<GroupsFormWidget> createState() => _GroupsFormWidgetState();
}

class _GroupsFormWidgetState extends State<GroupsFormWidget> {
  final _model = GroupFormWidgetModel();

  @override
  Widget build(BuildContext context) {
    return GroupFormWidgetProvider( //вживляем Инхерит 
      model: _model,
      child: const _GroupFormWidgetBody()
    );
  }
}


class _GroupFormWidgetBody extends StatelessWidget {
  const _GroupFormWidgetBody({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New group'),
        centerTitle: true,
      ),
      body: const Center(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16),
          child:  _GroupNameWidget(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => GroupFormWidgetProvider.read(context)?.model.saveGroup(context),
        child: const Icon(Icons.done),
      ),
    );
  }
}

class _GroupNameWidget extends StatelessWidget {
  const _GroupNameWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = GroupFormWidgetProvider.read(context)?.model;
    return TextField(
      autofocus: true,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Group name'
      ),
      onChanged: (value) => model?.groupName = value,
      onEditingComplete: () => model?.saveGroup(context),
    );
  }
}