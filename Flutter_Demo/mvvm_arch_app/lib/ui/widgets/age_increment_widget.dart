import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mvvm_arch_app/ui/models/models.dart';

class AgeIncrement extends StatelessWidget {
  const AgeIncrement({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ViewModel>(); 
    return ElevatedButton(
      onPressed: ()  {
        viewModel.onIncrementButtonPressed();
      }, 
      child: const Text('+')
    );
  }
}