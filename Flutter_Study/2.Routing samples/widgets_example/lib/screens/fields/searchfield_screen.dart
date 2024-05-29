import 'package:flutter/material.dart';
import 'package:widgets_example/widgets/widgets.dart';


class SearchScreen extends StatefulWidget {

 static String routeName = '/_fieldsDemos/04_searchfield';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final _repositoryText = <String>
    [
    'Hello',
    'World',
    'Tanks',
    'World Press' 
    ];

  final TextEditingController textEditingController = TextEditingController();

   @override
  void initState() {
    super.initState();
    textEditingController.text = '';
  }

   
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('PasswordField'),
      centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SimpleTextField(
              controller: textEditingController,
              onChanged: (_) => setState(() {}),
              labelText: 'Search',
              hint: 'Words',
            ),
            CheepWords(
              repositoryText:_repositoryText,
              textEditingController: textEditingController,
            )
          ],
        ),
      ),
    );
  }
}