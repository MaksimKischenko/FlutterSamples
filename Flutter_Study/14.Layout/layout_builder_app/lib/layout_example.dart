import 'package:flutter/material.dart';

class LayoutExampleScreen extends StatefulWidget {
  const LayoutExampleScreen({ Key? key }) : super(key: key);

  @override
  State<LayoutExampleScreen> createState() => _LayoutExampleScreenState();
}

class _LayoutExampleScreenState extends State<LayoutExampleScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.red,
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                color: Colors.green,
                alignment: Alignment.center,
                height: constraints.maxHeight * 0.5,
                width: constraints.maxWidth * 0.5,
                child: const Text(
                  'LayoutBuilder Widget',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),                
              ));
            }, 
          ),          
        )
      ),
    );
  }
}