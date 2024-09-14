import 'package:flutter/material.dart';
import 'package:flutter_features/extensions/build_context_extensions.dart';

class CDISecurityIcon extends StatelessWidget {
  const CDISecurityIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    return Center(
      child: ShaderMask(
        blendMode: BlendMode.srcIn,
        shaderCallback: (Rect bounds) => LinearGradient(
          begin: const Alignment(-1.0, 0.0),
          end: const Alignment(1.0, 0.0),
          stops: const [0.5, 0.5],
          colors: [
            colorScheme.primary,
            colorScheme.onPrimaryContainer,
          ],
        ).createShader(bounds),
        child: const Icon(Icons.security, size: 50),
      ),
    );
  }
}