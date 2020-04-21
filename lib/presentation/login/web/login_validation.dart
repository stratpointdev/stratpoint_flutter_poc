import 'dart:html';

import 'package:globe_one_poc_project/application/login/bloc/login_bloc.dart';
import 'package:globe_one_poc_project/common/brewery.dart';
import 'package:globe_one_poc_project/common/utils/string_cons.dart';
import 'package:globe_one_poc_project/common/widget/brewery_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginValidationPage extends StatefulWidget {
  @override
  _LoginValidationPageState createState() => _LoginValidationPageState();
}

class _LoginValidationPageState extends State<LoginValidationPage> {
  GlobalKey<FormState> signInForm = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BreweryContainer(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          key: signInForm,
          child: Wrap(children: <Widget>[
            BreweryHeader(
              textColor: Theme.of(context).secondaryHeaderColor,
              text: StringCons.signInHeader,
            ),
            BreweryEmailField(
              title: StringCons.emailAddress,
              hint: StringCons.emailAddressHint,
              maxLength: 255,
              onSavedFunction: (value) {},
              onChanged: (value) {},
            ),
            BreweryPasswordField(
              title: StringCons.password,
              hint: StringCons.passwordHint,
              maxLength: 255,
              onSavedFunction: (value) {},
              onChanged: (value) {},
            ),
            Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                  BreweryCheckbox(
                    checkboxText: StringCons.signInRememberMe,
                    isChecked: false,
                    onChanged: (bool value) {
                      setState(() {});
                    },
                  ),
                  Column(
                    children: <Widget>[
                      InkWell(
                        child: Text("Forgot Password?",
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 12.0,
                                color: Color(0xff007AFF))),
                        onTap: () {},
                      )
                    ],
                  )
                ])),
            Container(
              padding: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
              child: Material(
                borderRadius: BorderRadius.circular(10.0),
                color: Theme.of(context).primaryColor,
                child: MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  onPressed: () {
                    /*     if (signInForm.currentState.validate()) {
                        signInForm.currentState.save();
                       // loginBloc.add(LoginEvent.LogInWithEmailAndPasswordPressed());
                      }*/
                  },
                  child: BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                    /* if (state.isSubmitting) {
                            return CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            );
                          }*/
                    return new Text(
                      StringCons.signInTitle,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                    );
                  }),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Container(
                  margin: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 100.0),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Don't have an account? ",
                          style: TextStyle(
                              color: Color(0xffcccccc), fontSize: 12.0),
                        ),
                        InkWell(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Color(0xff007AFF),
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            // clickedSignUp(context);
                          },
                        )
                      ],
                    ),
                  )),
            )
          ]),
        ),
      ),
    );
  }
}
