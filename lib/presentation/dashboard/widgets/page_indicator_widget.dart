import 'dart:math';

import 'package:flutter/material.dart';

class PageIndicatorWidget extends AnimatedWidget {
  final PageController controller;
  final int itemCount;
  final ValueChanged<int> onPageSelected;
  final Color dotColor;
  final Color selectedDotColor;
  final double dotSize;
  final double dotDistance;

  PageIndicatorWidget({
    @required this.controller,
    @required this.itemCount,
    @required this.onPageSelected,
    this.dotColor: const Color(0xff598DDA),
    this.selectedDotColor: Colors.white,
    this.dotSize: 8,
    this.dotDistance: 25,
  }) : super(listenable: controller);

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(
        itemCount,
        (index) => Container(
          width: dotDistance,
          child: Center(
            child: Material(
              color: controller.page % itemCount == index
                  ? selectedDotColor
                  : dotColor,
              type: MaterialType.circle,
              child: Container(
                width: dotSize,
                height: dotSize,
                child: InkWell(onTap: () => onPageSelected(index)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
