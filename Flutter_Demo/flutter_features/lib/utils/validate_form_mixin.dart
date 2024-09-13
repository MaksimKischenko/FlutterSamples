import 'package:flutter/material.dart';

mixin ValidateFormMixin<T extends StatefulWidget> on State<T> {
  final formKey = GlobalKey<FormState>();
  bool canContinue = false;
  bool isProcessing = false;

  void onFormChanged() {
    var validForm = formKey.currentState?.validate() == true;
    var updateState = (validForm && !canContinue) || canContinue;
    if (updateState) {
      setState(() => canContinue = validForm);
    }
  }

  String? lengthValidator(String? value) {
    return (value?.trim().length ?? 0) < 1 ? '' : null;
  }

  String? lengthValidatorWithMessage(
    String? value,
    String? message,
  ) {
    return (value?.trim().length ?? 0) < 1 ? message : null;
  }

  String? emptyLengthValidator(String? value, {minLength = 0}) {
    final valueLength = value?.trim().length ?? 0;
    return valueLength == 0 || valueLength > minLength ? null : '';
  }

  Widget actionButton(String text) => FilledButton(
        key: ValueKey(text),
        onPressed: canContinue && !isProcessing ? onAction : null,
        child: Text(text),
      );

  void onAction();
}
