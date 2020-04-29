import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    this.item,
    this.textStyle,
  });

  final String item;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      item,
      style: textStyle,
    );
  }
}
