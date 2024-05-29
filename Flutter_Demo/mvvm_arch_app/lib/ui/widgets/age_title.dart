
import 'package:flutter/material.dart';
import 'package:mvvm_arch_app/ui/models/models.dart';
import 'package:provider/provider.dart';

class AgeTitle extends StatelessWidget {
  const AgeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final title = context.select((ViewModel vm)=> vm.state.ageTitle); 
    return Text(title);
  }
}