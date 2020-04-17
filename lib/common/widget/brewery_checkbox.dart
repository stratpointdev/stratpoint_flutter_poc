import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BreweryCheckbox extends StatefulWidget {

  const BreweryCheckbox({
    this.checkboxText,
    this.textStyle,
    this.isChecked,
    this.onChanged
  });

  final String checkboxText;
  final TextStyle textStyle;
  final ValueChanged<bool> onChanged;
  final bool isChecked;
  @override
  _BreweryCheckbox createState() => _BreweryCheckbox();
}

class _BreweryCheckbox extends State<BreweryCheckbox> {



  @override
  Widget build(BuildContext context) {
    return Row(

      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 7.0),
          child: SizedBox(
            width: 22,
            height: 22,
            child: Theme(
              data: ThemeData(unselectedWidgetColor: Color(0xff007AFF),),
              child: Checkbox(
                checkColor:  Colors.white,
                activeColor: Color(0xff007AFF) ,
                value: widget.isChecked,
                onChanged: widget.onChanged
              ),

            ),
          ),
        ),

        Text(
            widget.checkboxText,
            style: widget.textStyle ?? TextStyle(fontFamily: 'Roboto', fontSize: 12.0, color: Color(0xff007AFF))
        )
      ],
    );
  }
}