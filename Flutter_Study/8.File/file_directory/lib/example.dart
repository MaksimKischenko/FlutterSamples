
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

class ExampleWidgetModel extends ChangeNotifier {
  //FOR mobile
  void readFile() async {
    //любые файлы о которых пользователь должен знать (например создает)
    //pathProvider.getApplicationDocumentsDirectory();

    //любые файлы куда загружаются файлы 
    //pathProvider.getDownloadsDirectory();

    //любые файлы кеша
    //pathProvider.getTemporaryDirectory();

    //технические документы на IOS (пользователь о них не знает но они нужны)
    //pathProvider.getLibraryDirectory();

    //get() только для андроида SD carta

    //I/flutter ( 8936): Directory: '/data/user/0/com.example.file_directory/app_flutter'
    final directory = await pathProvider.getApplicationDocumentsDirectory();
    final pathFile = directory.path + '/file';

    print(directory);    
    print(pathFile);  

    //Начинаем работу с файлом (пока его еще нет)
    final file = File(pathFile);
    file.exists().then((value) => print(value));

    //Теперь он появится 
    await file.writeAsString('$pathFile');
    file.exists().then((value) => print(value));

    final result = await file.readAsString();
    print(result);

   
  }
}

class ExampleWidgetModelProvider extends InheritedNotifier {
  final ExampleWidgetModel model;

  const ExampleWidgetModelProvider({Key? key, required this.model, required Widget child}) 
  : super(key: key, notifier: model, child: child);

  static ExampleWidgetModelProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ExampleWidgetModelProvider>();
  }

  static ExampleWidgetModelProvider? read(BuildContext context) {
    final widget = context.getElementForInheritedWidgetOfExactType<ExampleWidgetModelProvider>()?.widget;
    return widget is ExampleWidgetModelProvider ? widget: null; 
  }
}

class ExampleWidget extends StatefulWidget {
  const ExampleWidget({ Key? key }) : super(key: key);

  @override
  _ExampleWidgetState createState() => _ExampleWidgetState();
}

class _ExampleWidgetState extends State<ExampleWidget> {

  final _model = ExampleWidgetModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ExampleWidgetModelProvider(
            model: _model,
            child: Column(
              children: const [
                _ReadFileButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ReadFileButton extends StatelessWidget {
  const _ReadFileButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ExampleWidgetModelProvider.read(context)!.model.readFile,
      child: const Text('Прочитать файл'),
    );
  }
}



