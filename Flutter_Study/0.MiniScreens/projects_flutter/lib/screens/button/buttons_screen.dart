import 'package:flutter/material.dart';

class ButtonsForTask extends StatefulWidget {
  @override
  ButtonState createState() => ButtonState();
}

class ButtonState extends State<ButtonsForTask> {
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Bars"),
          ),
          body: Form(
            key: _formKey,
            child: Column(children: <Widget>[
              TextFormField(
                controller: myController,
                validator: (value) {
                  if (value?.isEmpty ?? true) return 'Enter text';
                },
                style: TextStyle(color: Colors.deepPurple),
              ),
              Row(
                children: [
                  ElevatedButton(
                      child: Text('Delite', style: TextStyle(fontSize: 22)),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            //_formKey.currentState!.reset();
                            myController.clear(); //или через контроллер
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Was delited...'),
                            backgroundColor: Colors.green,
                          ));
                        }
                      }),
                  ElevatedButton(
                      child: Text('Print', style: TextStyle(fontSize: 22)),
                      onPressed: () => {
                            if (_formKey.currentState!.validate())
                              {
                                print(myController.text),
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text('Is printing...'),
                                  backgroundColor: Colors.green,
                                )),
                              }
                          })
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              )
            ]),
          )),
    );
  }
}
