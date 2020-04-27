import 'package:flutter/material.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  final double width;
  final double height;
  ProgressIndicatorWidget({this.width = 50, this.height = 50});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            width: width,
            height: height,
            child: CircularProgressIndicator(
              backgroundColor: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
