import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


//На замену таким виджетам как MouseRegion

class MyCustomButton extends StatefulWidget {
  const MyCustomButton(
      {Key? key,
      required this.onPressed,
      required this.label,
      required this.color1,
      required this.color2})
      : super(key: key);
  final VoidCallback onPressed;
  final String label;
  final Color color1;
  final Color color2;

  @override
  State<MyCustomButton> createState() => _MyCustomButtonState();
}

class _MyCustomButtonState extends State<MyCustomButton> {
  bool _isHovered = false;
  bool _isFocused = false;
  final FocusNode _focusNode = FocusNode();

  void _handleFocusHighlight(bool value) {
    setState(() {
      _isFocused = value;
    });
  }

  void _handleHoveHighlight(bool value) {
    setState(() {
      _isHovered = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color outlineColor = _isFocused ? Colors.black : Colors.transparent;
    Color bgColor = _isHovered ? widget.color1 : widget.color2;
    return GestureDetector(
      onTap: _handlePressed,
      child: FocusableActionDetector(
        mouseCursor: SystemMouseCursors.click,
        onShowFocusHighlight: _handleFocusHighlight,
        onShowHoverHighlight: _handleHoveHighlight,

        //привязка клавиатуры
        actions: {
          ActivateIntent:
              CallbackAction<Intent>(onInvoke: (_) => _handlePressed()),
        },
        //привязка шорткатов для действий 
        shortcuts: const {
          SingleActivator(LogicalKeyboardKey.keyZ, control: true):
              ActivateIntent(),
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: bgColor,
            border: Border.all(color: outlineColor, width: 2),
          ),
          child: Text(widget.label),
        ),
      ),
    );
  }

  void _handlePressed() {
    _focusNode.requestFocus();
    widget.onPressed();
  }
}

class FocusableExample extends StatefulWidget {
  const FocusableExample({Key? key}) : super(key: key);

  @override
  State<FocusableExample> createState() => _FocusableExampleState();
}

class _FocusableExampleState extends State<FocusableExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MyCustomButton(
          onPressed: () {
            
          },
          color1: Colors.blue,
          color2: Colors.blueGrey,
          label: 'Click',
        ),
      ),
    );
  }
}