import 'package:flutter/material.dart';

class StepperScreen extends StatefulWidget {

  static String routeName = '/_fitchessDemos/05_stepper';


  @override
  _StepperScreenState createState() => _StepperScreenState();
}

class _StepperScreenState extends State<StepperScreen> {

  var _currenstStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Stepper'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stepper(
              type: StepperType.vertical,
              currentStep: _currenstStep,
              onStepContinue: _currenstStep < 2?
              () => setState(() => _currenstStep +=1) :null,
              onStepCancel: _currenstStep < 0?
              () => setState(() => _currenstStep -=1) :null,
              steps: [
                Step(
                  title: Text('Get ready'),
                  isActive: true,
                  content: Text('Lets begin'),
                ),
                Step(
                  title: Text('Get set'),
                  isActive: true,
                  content: Text('Just a litle more'),
                ),
                Step(
                  title: Text('Go'),
                  isActive: true,
                  content: Text('And we re done'),
                ),
              ]
            ),
            TextButton(
              onPressed: () {
                setState(() {
                _currenstStep=0;
                });
              },
            child: Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}