
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organization_simulation/bloc/bloc.dart';
import 'package:organization_simulation/models/models.dart';
import 'package:organization_simulation/navigation.dart';
import 'package:organization_simulation/styles.dart';
import 'package:organization_simulation/utils/utils.dart';
import 'package:organization_simulation/widgets/widgets.dart';
import 'package:organization_simulation/workers_indificators.dart';

class EmployeeAddScreen extends StatefulWidget {
  static const pageName = 'Add new employee';

  @override
  _EmployeeAddScreenState createState() => _EmployeeAddScreenState();
}

class _EmployeeAddScreenState extends State<EmployeeAddScreen> {

  List<Worker> _workers = [];

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();
  final TextEditingController _workedHoursController = TextEditingController();
  
  @override
  void initState()  {
    super.initState();
    _nameController.text = WorkersIndificators.employeeIndificator;
    _positionController.text = WorkersIndificators.employeePositin;
    _workedHoursController.text = WorkersIndificators.workedHoursInMonth.toString();

  }

  @override
  void dispose() {
    _nameController.dispose();
    _positionController.dispose();
    _salaryController.dispose();
    _workedHoursController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) =>
  BlocListener<EmployeeAddBloc, EmployeeAddState>(
    listener: (context, state) {
      if(state is EmployeeAddInitialError) {
        _showMessageError(state.error);
      } 
      else if (state is EmployeeAddSucces) {
        Navigation.toManager();
        _showMessageSuccces(state.name);
     } 
    },
    child: Scaffold(
      body: BlocBuilder<EmployeeAddBloc, EmployeeAddState>(
        builder: (context, state) {
          Widget body = Container();
          if(state is EmployeeAddInitial) {
            _workers= state.workers ?? [];
            body=Center(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Add employee', style: AppStyles.headerTextStyle),
                    const SizedBox(height: 12),
                    SimpleTextField(
                      controller: _nameController,
                      labelText: 'Name',
                      onSaved: (value) {
                        _nameController.text = value;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                        return 'Required field';
                        } else if (!value.contains(WorkersIndificators.employeeIndificator)) {
                        return 'Invalid username';
                        } else if(
                          _nameCheker(_workers, value)
                          ) {
                        return 'This user already exists';  
                        }
                      } 
                    ),
                    const SizedBox(height: 12),
                    SimpleTextField(
                      controller: _positionController,
                      isReadOnly: true,
                      labelText: 'Position',
                      onSaved: (value) {
                        _positionController.text = value;
                      },
                    ),
                    const SizedBox(height: 12),
                    SimpleTextField(
                      controller: _salaryController,
                      labelText: "Salary in month",
                      onSaved: (value) {
                        _salaryController.text = value;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                        return 'Required field';
                        } 
                      }, 
                      textInputType: TextInputType.number,
                    ),
                    const SizedBox(height: 12),
                    SimpleTextField(
                      controller: _workedHoursController,
                      isReadOnly: true,
                      labelText: 'Worked hours in month',
                      onSaved: (value) {
                        _workedHoursController.text = value;
                      },
                      textInputType: TextInputType.number,
                    ),
                    const SizedBox(height: 12),
                    SaveButton(
                      onTap: _onSaveTap,
                      buttonText: 'Add employee',
                    )
                  ],
                ),
              ),
            );
          }
          return body;
        },
      ),
    ));
  

bool _nameCheker (List<Worker> workers, String name) {
if(workers.isEmpty) return false;
return workers.any((element) => element.name==name);
}

void _showMessageError(Object? text) =>
    Multiplatform.showMessage(
      context: context,
      title: 'Error',
      message: '$text',
      type: DialogType.error
  );

void _showMessageSuccces(Object? text) =>
    Multiplatform.showMessage(
      context: context,
      title: 'Succes',
      message: 'The employee with name $text was added',
      type: DialogType.success
  );
 

void _onSaveTap() {

    if(_formKey.currentState?.validate() ?? false) {
    _formKey.currentState?.save();
    context.read<EmployeeAddBloc>().add(EmployeeAddRun(worker: Worker(
    name: _nameController.text,
    position: _positionController.text,
    salary: int.tryParse(_salaryController.text),
    hoursInMonth: int.tryParse(_workedHoursController.text))));
    }
  }
}