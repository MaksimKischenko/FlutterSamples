import 'package:flutter/material.dart';
import 'package:mvvm_arch_app/ui/widgets/widgets.dart';

class GoodExampleWidget extends StatelessWidget {
  const GoodExampleWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              AgeTitle(),
              AgeIncrement(),
              AgeDecrement()         
            ],
          ),
        ),
      )
    );
  }
}


