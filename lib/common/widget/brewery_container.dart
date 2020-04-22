import 'package:flutter/material.dart';

class BreweryContainer extends Container {
  final String title;
  final Widget child;
  final double height;
  final double borderRadius;

  BreweryContainer(
      {this.title, @required this.child, this.height, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
          top: Radius.circular(borderRadius != null ? borderRadius : 25.0)),
      child: Container(
        height: height,
        color: Theme.of(context).accentColor,
        child: child,
      ),
    );
  }
}
