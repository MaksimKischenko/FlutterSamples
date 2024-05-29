import 'package:flutter/material.dart';

class ColoredWidget extends StatefulWidget {

  final Widget child;
  final Color initialColor;

  const ColoredWidget({
    Key? key,
    required this.child,
    required this.initialColor,
  }) : super(key: key);

  

  @override
  _ColoredWidgetState createState() => _ColoredWidgetState();
}

class _ColoredWidgetState extends State<ColoredWidget> {

  late Color color;

  @override
  void initState() {
        super.initState();
    color = widget.initialColor;

  }

  void changeColor(Color color) {
    setState(() {
      this.color = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: widget.child,
    );
  }
}



class ColorButton extends StatelessWidget {
  const ColorButton({ Key? key }) : super(key: key);

  void _onPressed(BuildContext context) async {

    //находит ближайший к нему стейт
    context.findAncestorStateOfType<_ColoredWidgetState>()?.changeColor(Colors.pink);
    await Future.delayed(const Duration(seconds: 2));
    //находит последний стейт в дереве предков  
    context.findRootAncestorStateOfType<_ColoredWidgetState>()?.changeColor(Colors.green);
  }

  //BuildContext context только в виде аругмента в методе build
  //Context только этого виджета
  @override
  Widget build(BuildContext context) {
    return  Container(
        color: Colors.blue,
        child: Center(
          child: ElevatedButton(
            onPressed: () => _onPressed(context),
            child: const Text('PUSH')
          ),
        )
    );
  
  }
}

