import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organization_simulation/bloc/bloc.dart';
import 'package:organization_simulation/database/workers_database.dart';
import 'package:organization_simulation/models/models.dart';
import 'package:organization_simulation/navigation.dart';
import 'package:organization_simulation/styles.dart';
import 'package:organization_simulation/utils/utils.dart';
import 'package:organization_simulation/widgets/widgets.dart';

class ManagerScreen extends StatefulWidget {
  static String pageName = 'Manager menu';

  @override
  _ManagerScreenState createState() => _ManagerScreenState();
}

class _ManagerScreenState extends State<ManagerScreen> {
  WorkersRoles? roles;

  @override
  void initState() {
    super.initState();
    roles = WorkersRoles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MANAGER', style: AppStyles.headerTextStyleWhite),
        centerTitle: true,
        backgroundColor: AppStyles.mainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: BlocListener<ComonStatisticBloc, ComonStatisticState>(
            listener: (context, state) {
              if (state is ComonStatisticSucces) {
                Navigation.toManager();
                Multiplatform.showMessage(
                  context: context,
                  title: 'Succes!',
                  message:
                      'Лог ${state.fileName} с ${state.rowCount} ${state.rowCount} выгружен',
                  type: DialogType.success);
              } if (state is ComonStatisticError) {
                Navigation.toManager();
                Multiplatform.showMessage(
                  context: context,
                  title: 'Error',
                  message:'${state.error}',
                  type: DialogType.error);
              }
            },
            child: BlocBuilder<ComonStatisticBloc, ComonStatisticState>(
              builder: (context, state) {
                Widget body = Container();
              if(state is ComonStatisticLoading) {
                body = Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(width: double.maxFinite),
                      LoadingIndicator()
                    ],
                );
              } 
              if(state is ComonStatisticInitial) {
                  body = Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Deleate all'),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              Multiplatform.showDecisionMessage(
                                context: context,
                                message: '',
                                action: () async {
                                  await WorkersDataBaseHelper.instance
                                      .deleteWorkers();
                                },
                                dialogTitle:
                                    'Are you shure that you want to deleate all workers?',
                                buttonTitle: 'Deleate',
                                cancelButtonTitle: 'No'
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(width: 24),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Show all'),
                          IconButton(
                            icon: Icon(Icons.outbox),
                            onPressed: () =>
                                context.read<ComonStatisticBloc>()
                                  ..add(ComonStatisticDownLoad())
                            //  var workers= await WorkersDataBaseHelper.instance.allWorkers();
                            //  print(workers);
                          ),
                        ],
                      ),
                    ],
                  )),
                  const SizedBox(height: 24),
                  ExpansionTile(
                    title: Center(
                      child: Text('Add new workers',style: AppStyles.headerTextStyle)),
                    children: [
                      SizedBox(
                        height: 300,
                        width: 300,
                        child: ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) =>
                            CupertinoButton(
                              color: AppStyles.mainColor,
                              child: Text('${roles!.allRoles[index]}',
                                  style:
                                      TextStyle(color: Colors.white)),
                              onPressed: () {
                                setState(() {
                                  if (index == 0) {
                                    Navigation.toManagerAdd();
                                  } else if (index == 1) {
                                    Navigation.toEmployeeAdd();
                                  } else if (index == 2) {
                                    Navigation.toFrealamcerAdd();
                                  }
                                });
                              },
                              ),
                        separatorBuilder: (context, _) =>
                            SizedBox(height: 10),
                        itemCount: roles!.allRoles.length),
                      )
                    ]
                   )
                  ],
                 );
              }
                return body;
              },
            ),
          ),
        ),
      ),
    );
  }
}
