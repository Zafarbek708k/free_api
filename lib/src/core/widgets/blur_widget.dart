import "dart:ui";
import "package:flutter/material.dart";

class BlurWidget extends StatelessWidget {
  const BlurWidget({required this.radius, required this.blur, required this.child, super.key});

  final double radius;
  final double blur;
  final Widget child;

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: blur,
            sigmaY: blur,
          ),
          child: child,
        ),
      );
}
