import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todolist_hive/models/models.dart';

class GroupsWidget extends StatefulWidget {
  const GroupsWidget({ Key? key }) : super(key: key);

  @override
  State<GroupsWidget> createState() => _GroupsWidgetState();
}

class _GroupsWidgetState extends State<GroupsWidget> {

  final _model = GroupsUpdatedModel();

  @override
  Widget build(BuildContext context) {
    return GroupsUpdatedModelProvider(
      model: _model,
      child: const _GroupWidgetBody()
    );
  }
}

class _GroupWidgetBody extends StatelessWidget {
  const _GroupWidgetBody({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Groups'),
      ),
      body: const _GroupList(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => GroupsUpdatedModelProvider.read(context)?.model.showForm(context)
      ),
    );
  }
}


class _GroupList extends StatelessWidget {
  const _GroupList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final groupsCount = GroupsUpdatedModelProvider.watch(context)?.model.groups.length ?? 0;
    return ListView.separated(
      itemCount: groupsCount,
      itemBuilder: (context, index) {
        return _GroupListRowWidget(
          indexInList: index,
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(height: 4);
      } ,
    );
  }
}

class _GroupListRowWidget extends StatelessWidget {

  final int indexInList;

  const _GroupListRowWidget({
    Key? key,
    required this.indexInList,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final model = GroupsUpdatedModelProvider.read(context)!.model;  
    final group = model.groups[indexInList];

    return Slidable(
      child: ListTile(
        title: Text('${group.name}'),
        trailing: const Icon(Icons.chevron_right),
        //onTap: () => model.deleteGroup(indexInList),
      ),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              flex: 2,
              onPressed: (context) {
                model.deleteGroup(indexInList);
              },
              backgroundColor: const Color(0xFF0392CF),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
    );
  }
}
