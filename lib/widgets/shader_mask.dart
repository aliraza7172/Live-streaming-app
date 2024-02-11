import 'package:flutter/material.dart';

class ShaderMaskWidget extends StatelessWidget {
  final Gradient _gradient;
  final bool isGradient;
  final Widget? child;
  const ShaderMaskWidget({
    Key? key,
    this.child,
    this.isGradient = false,
    required Gradient gradient,
  })  : _gradient = gradient,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: isGradient
            ? ShaderMask(
                blendMode: BlendMode.modulate,
                shaderCallback: (size) => _gradient.createShader(
                  Rect.fromLTWH(0, 0, size.width, size.height),
                ),
                child: child,
              )
            : child);
  }
}
