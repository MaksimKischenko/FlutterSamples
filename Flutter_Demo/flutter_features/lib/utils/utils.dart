import 'package:flutter/material.dart';

extension ScorllControllerExt on ScrollController {
  Future<void> animateToBottom({
    double? extraOffset,
    Duration? duration,
    Curve? curve,
  }) async {
    if (!hasClients || position.maxScrollExtent < 0) {
      return;
    }
    return animateTo(
      position.maxScrollExtent + (extraOffset ?? 0),
      duration: duration ?? const Duration(milliseconds: 1000),
      curve: curve ?? Curves.easeOut,
    );
  } 
}


class ItemContext {
  ItemContext({
    required this.context,
    required this.id,
    required this.height,
  });
  final BuildContext context;
  final double height;
  final int id;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is ItemContext && other.id == id;

  @override
  int get hashCode => Object.hashAll([
        id,
      ]);
}