import 'package:flutter/material.dart';
import 'package:optimal_prime/utils/build_context_extensions.dart';

class CardInfoTitle extends StatelessWidget {
  final String name;

  const CardInfoTitle({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Text(
            name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.titleSmall,
          ),
        ],
      );
}
