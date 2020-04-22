import 'package:flutter/cupertino.dart';

class MenuItem extends StatefulWidget {
  const MenuItem({
    this.item,
    this.textStyle,
  });

  final String item;
  final TextStyle textStyle;

  @override
  _MenuItem createState() => _MenuItem();
}

class _MenuItem extends State<MenuItem> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      widget.item,
      style: widget.textStyle,
    );
  }
}