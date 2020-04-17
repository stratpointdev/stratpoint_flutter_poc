import 'package:flutter/material.dart';

class BreweryTextTitle extends StatelessWidget {
  final String text;
  final Color textColor;
  final double fontSize;

  BreweryTextTitle({@required this.text, @required this.textColor,this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(32.0, 32.0, 0.0, 32.0),
      child: Text(text,
        style: TextStyle(
            fontSize: fontSize != null ? fontSize : 20.0,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            color: textColor

        ),

      ),
    );
  }


}