import 'package:flutter/material.dart';

class BreweryHeader extends StatelessWidget{
  final Color textColor;
  final String text;
  final String description;

  BreweryHeader({
    @required this.textColor,
    @required this.text,
    this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          text,
          style: TextStyle(
              fontSize: 20.0,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              color: textColor

          ),

        ),
        description !=null ?
        Padding(
        padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
          child: Text(description, style: TextStyle(
              fontSize: 12.0,
              fontFamily: 'Roboto',
              color: textColor

          ),
          ),
        ): Text("")
      ],
    );
  }



}