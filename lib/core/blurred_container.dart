import 'package:flutter/material.dart';
import 'dart:ui'; // لاستيراد ImageFilter و BackdropFilter

class BlurredContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final double sigmaX;
  final double sigmaY;
  final Color backgroundColor;

  const BlurredContainer({
    Key? key,
    required this.child,
    this.padding,
    this.borderRadius,
    this.sigmaX = 5.0,
    this.sigmaY = 5.0,
    this.backgroundColor = const Color(0xFF48677B),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent, 
        borderRadius: borderRadius ?? BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY), 
          child: Container(
            padding: padding ?? const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            decoration: BoxDecoration(
              color: backgroundColor.withOpacity(0.4), 
              borderRadius: borderRadius ?? BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
