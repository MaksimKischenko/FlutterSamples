import 'package:flutter/material.dart';

class TextValidation extends StatefulWidget {
  @override
  //State<StatefulWidget> createState() => MyFormState();
  MyFormState createState() => MyFormState();
}

//работает и просто с State
class MyFormState extends State<TextValidation> {
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(10.0),
          child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    'Имя пользователя:',
                    style: TextStyle(fontSize: 10.0),
                  ),
                  TextFormField(validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Пожалуйста введите свое имя';
                  }),
                  SizedBox(height: 10.0),
                  Text(
                    'Контактный E-mail:',
                    style: TextStyle(fontSize: 10.0),
                  ),
                  TextFormField(validator: (value) {
                    if (value?.isEmpty ?? true)
                      return 'Пожалуйста введите свой Email';

                    String p =
                        "[a-zA-Z0-9+.\_\%-+]{1,256}@[a-zA-Z0-9][a-zA-Z0-9-]{0,64}(.[a-zA-Z0-9][a-zA-Z0-9-]{0,25})+";
                    RegExp regExp = RegExp(p);

                    if (!regExp.hasMatch(value!)) return 'Это не E-mail';
                    return null;
                  }),
                  SizedBox(height: 10.0),
                  Text(
                    'Введите недробное целое значение',
                    style: TextStyle(fontSize: 10.0),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Пожалуйста введите данные';
                      }
                      if (int.tryParse(value!) == null ||
                          int.tryParse(value)! <= 20)
                        return 'Эти данные не подходят';
                      return null;
                    },
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Введите дробное значение',
                    style: TextStyle(fontSize: 10.0),
                  ),
                  TextFormField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Пожалуйста введите данные';
                      }
                      if (double.tryParse(value!) == null ||
                          double.tryParse(value)! % 1 == 0)
                        return 'Это не дробное число';
                      return null;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate())
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Форма успешно заполнена'),
                          backgroundColor: Colors.green,
                        ));
                    },
                    child: Text('Проверить'),
                  ),
                ],
              ))),
    );
  }
}
