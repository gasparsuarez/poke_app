import 'package:flutter/material.dart';

class ShimmerContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final EdgeInsets? margin;
  const ShimmerContainer({
    super.key,
    this.height,
    this.width,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(6),
    );
    return Container(
      margin: margin,
      width: width,
      height: height,
      decoration: decoration,
    );
  }
}
