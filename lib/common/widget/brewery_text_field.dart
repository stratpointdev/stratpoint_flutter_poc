import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class BreweryTextField extends StatefulWidget{
  final String title;
  final String hint;
  final String allowedCharacters;
  final int maxLength;
  final bool isValidate;
  final String errorText;
  final TextInputType inputType;
  final Function onSavedFunction;


  BreweryTextField({
    this.inputType,
    @required this.hint,
    this.allowedCharacters,
    this.maxLength,
    this.isValidate,
    this.errorText,
    @required this.title,
    @required this.onSavedFunction
    });

  @override
  _BreweryTextFieldState createState() => _BreweryTextFieldState();
}

class _BreweryTextFieldState extends State<BreweryTextField> {
  bool _isValid = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 24.0, 0.0, 10.0),
            child: Text(widget.title, style: _isValid? TextStyle(color: Theme.of(context).primaryColor.withOpacity(.5), fontWeight: FontWeight.bold) :
            TextStyle(color: Theme.of(context).errorColor.withOpacity(.5), fontWeight: FontWeight.bold),),
          ),
          TextFormField(
            maxLength: widget.maxLength,
            keyboardType: widget.inputType,
            inputFormatters: widget.allowedCharacters != null? [
              WhitelistingTextInputFormatter(new RegExp(widget.allowedCharacters))] : [
              BlacklistingTextInputFormatter(new RegExp(''))],
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
              fillColor: _isValid? Theme.of(context).accentColor: Theme.of(context).errorColor.withOpacity(.05),
            ),
            textInputAction: TextInputAction.next,
            //controller: emailFieldController,
            onChanged: (value){

            },
            validator: (value){
              if(widget.isValidate){
                if(value.isEmpty){
                  updateState(false);
                  return "Please enter "+widget.title.toLowerCase();
                }

              }
              updateState(true);
              return null;
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
