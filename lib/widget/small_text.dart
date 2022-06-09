import 'package:fire/utils/Dimensions.dart';
import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final double size;
  final FontWeight fontWeight;
  final String text;
  final Color color;
  const SmallText(
    this.text, {
    Key? key,
    this.size = 20,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          fontSize: size,
          fontWeight: fontWeight,
          color: color,
        ));
  }
}
