import 'package:flutter/material.dart';
import 'package:inherited_widget_example/testScreens/color_test/changeColor.dart';
import 'package:inherited_widget_example/testScreens/color_test/preferences_helper.dart';

class ColorChangeNotifier extends StatelessWidget {
  const ColorChangeNotifier({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: SimpleColorExample()
        )
      ),
    );
  }
}


class SimpleColorExample extends StatefulWidget {
  const SimpleColorExample({Key? key}) : super(key: key);

  @override
  State<SimpleColorExample> createState() => _SimpleColorExampleState();
}

class _SimpleColorExampleState extends State<SimpleColorExample> {

  final _model = AppStyles();
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppStylesProvider(
        widget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            
            ColorContainers(),
            DoColorButton()

          ],
        ),
        model: _model, 
      ),
    );
  }
}


class DoColorButton extends StatefulWidget {
  const DoColorButton({Key? key}) : super(key: key);

  @override
  State<DoColorButton> createState() => _DoColorButtonState();
}

class _DoColorButtonState extends State<DoColorButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            PreferencesHelper.setColorTheme('mainColor', 0xff2B50A1);
          }, 
          child: const Text('CHANGE_1')
        ),
        ElevatedButton(
          onPressed: () {
            PreferencesHelper.setColorTheme('mainColor', 0xff33C4A8);
          }, 
          child: const Text('CHANGE_2')
        ),        
      ],
    );
  }
}

class ColorContainers extends StatelessWidget {
  const ColorContainers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AppStylesProvider.watch(context)?.generateMainColor();

    return Column(
      children: [
        Container(
          height: 100,
          width: 100,
          color: AppStyles.mainColor,
        ),
        const SizedBox(height: 24),
        Container(
          height: 100,
          width: 100,
          color: AppStyles.mainColor,
        )
      ],
    );
  }
}