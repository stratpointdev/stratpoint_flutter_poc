
import 'package:finished_notes_firebase_ddd_course/domain/validation/string_format_validation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/string_cons.dart';

class BreweryPasswordField extends StatefulWidget {
  final String title;
  final String hint;
  final String passwordToMatch;
  final int maxLength;
  final Function onSavedFunction;
  final ValueChanged<String> onChanged;

  BreweryPasswordField(
      {@required this.hint,
      this.passwordToMatch,
      @required this.maxLength,
      @required this.title,
      @required this.onSavedFunction,
      this.onChanged});

  @override
  _BreweryPasswordFieldState createState() => new _BreweryPasswordFieldState();
}

class _BreweryPasswordFieldState extends State<BreweryPasswordField> {
  bool _obscureText = true;
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
                        color: Theme.of(context).errorColor.withOpacity(0.5),
                        fontWeight: FontWeight.bold),
              )),
          TextFormField(
            inputFormatters: [
              WhitelistingTextInputFormatter(
                  new RegExp(StringCons.passwordAllowedChar))
            ],
            maxLength: widget.maxLength,
            obscureText: _obscureText,
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility),
              ),
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
            onChanged: (value) {
              widget.onChanged(value);
            },
            validator: (value) {
              print("widgetValue: " + value);
              if (StringFormatValidation.validatePassword(value) != null) {
                updateState(false);
                return StringFormatValidation.validatePassword(value);
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
