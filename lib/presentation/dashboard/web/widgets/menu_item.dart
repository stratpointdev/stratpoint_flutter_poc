import 'package:flutter/material.dart';

//reusable widget that used for web/desktop_view/widgets/desktop_view_header_menu
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
