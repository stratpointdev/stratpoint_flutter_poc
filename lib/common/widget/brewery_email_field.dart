
import 'package:finished_notes_firebase_ddd_course/domain/validation/string_format_validation.dart';
import 'package:flutter/material.dart';

class BreweryEmailField extends StatefulWidget {
  final String title;
  final String hint;
  final int maxLength;
  final TextInputType inputType;
  final String errorText;
  final Function onSavedFunction;
  final ValueChanged<String> onChanged;

  BreweryEmailField(
      {this.inputType,
      @required this.hint,
      this.maxLength,
      this.errorText,
      @required this.title,
      @required this.onSavedFunction,
      this.onChanged});

  @override
  _BreweryEmailFieldState createState() => _BreweryEmailFieldState();
}

class _BreweryEmailFieldState extends State<BreweryEmailField> {
  bool _isValid = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 24.0, 0.0, 10.0),
            child: Text(
              widget.title,
              style: _isValid
                  ? TextStyle(
                      color: Theme.of(context).primaryColor.withOpacity(.5),
                      fontWeight: FontWeight.bold)
                  : TextStyle(
                      color: Theme.of(context).errorColor.withOpacity(.5),
                      fontWeight: FontWeight.bold),
            ),
          ),
          TextFormField(
            maxLength: widget.maxLength,
            keyboardType: widget.inputType,
            decoration: InputDecoration(
              errorText: widget.errorText,
              counter: Offstage(),
              hintText: widget.hint,
              hintStyle: TextStyle(fontSize: 12, fontFamily: 'Roboto'),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  width: 5,
                  style: BorderStyle.none,
                ),
              ),
              filled: true,
              contentPadding: EdgeInsets.all(10),
              fillColor: _isValid
                  ? Theme.of(context).accentColor
                  : Theme.of(context).errorColor.withOpacity(.05),
            ),
            textInputAction: TextInputAction.next,
            //controller: emailFieldController,
            onChanged: widget.onChanged,
            validator: (value) {
              if (StringFormatValidation.validateEmail(value) != null) {
                updateState(false);
                return StringFormatValidation.validateEmail(value);
              } else {
                updateState(true);
                return null;
              }
            },
            onSaved: (value) {
              widget.onSavedFunction(value);
            },
          ),
        ],
      ),
    );
  }

  void updateState(bool newState) {
    setState(() {
      _isValid = newState;
    });
  }
}
