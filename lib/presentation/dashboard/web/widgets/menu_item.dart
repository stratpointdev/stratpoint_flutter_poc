import 'package:flutter/cupertino.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    this.item,
    this.textStyle,
  });

  final String item;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      item,
      style: textStyle,
    );
  }
}