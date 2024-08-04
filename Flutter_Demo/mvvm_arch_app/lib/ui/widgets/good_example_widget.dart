import 'package:flutter/material.dart';
import 'package:mvvm_arch_app/ui/widgets/widgets.dart';

class GoodExampleWidget extends StatelessWidget {
  const GoodExampleWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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


