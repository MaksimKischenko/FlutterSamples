import 'package:flutter/material.dart';

class Example extends StatefulWidget {
  const Example({ Key? key }) : super(key: key);

  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {

  var _isCollapse = false;

  void _toggle() {
    _isCollapse = !_isCollapse;
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _toggle, 
              child: Text(_isCollapse? 'Развернуть': 'Свернуть')
            ),
            Expanded(
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.green,
                  //Выкидываем один виджет и добавляем другой
                  //Тут нам поможет didUpdateWidget()
                  child: CollapseAnimatedBox(
                    duration: const Duration(milliseconds: 2500),
                    isCollapse: _isCollapse,
                    child: Container(
                      height: 100,
                      color: Colors.blue,
                    )
                  ),
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}

class CollapseAnimatedBox extends StatefulWidget {

  final Duration duration;
  final Widget child;
  final bool isCollapse;

  const CollapseAnimatedBox({
    Key? key,
    required this.duration,
    required this.child,
    required this.isCollapse,
  }) : super(key: key);
  

  @override
  _CollapseAnimatedBoxState createState() => _CollapseAnimatedBoxState();
}

class _CollapseAnimatedBoxState extends State<CollapseAnimatedBox> with TickerProviderStateMixin {

  late AnimationController _animationController;


  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration
    );
    if(!widget.isCollapse) {
      _animationController.value = 1;
    }
  }

  @override
  void didUpdateWidget(CollapseAnimatedBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(oldWidget.isCollapse == widget.isCollapse) return;

    if(widget.isCollapse) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }


  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: CurvedAnimation(
        parent: _animationController, 
        curve: Curves.easeInOut
      ),
      axisAlignment: 0.0,
      child: FadeTransition(
        opacity: CurvedAnimation(
          parent: _animationController, 
          curve: Curves.linear
        ),
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

}

