import 'package:flutter/cupertino.dart';

import '../../../r.dart';



class CupLevelIndicator{
  static  Image cupLevelIndicator(double remaining, double total){

    double percentage = (remaining / total) * 100;
    if(percentage == 0.0){
      return Image.asset(R.duck0);
    }else if(percentage <= 5.0){
      return Image.asset(R.duck5);
    }else if(percentage <= 10.0){
      return Image.asset(R.duck10);
    }else if(percentage <= 15.0){
      return Image.asset(R.duck15);
    }else if(percentage <= 20.0){
      return Image.asset(R.duck20);
    }else if(percentage <= 25.0){
      return Image.asset(R.duck25);
    }else if(percentage <= 30.0){
      return Image.asset(R.duck30);
    }else if(percentage <= 35.0){
      return Image.asset(R.duck35);
    }else if(percentage <= 40.0){
      return Image.asset(R.duck40);
    }else if(percentage <= 45.0){
      return Image.asset(R.duck45);
    }else if(percentage <= 50.0){
      return Image.asset(R.duck50);
    }else if(percentage <= 55.0){
      return Image.asset(R.duck55);
    }else if(percentage <= 60.0){
      return Image.asset(R.duck60);
    }else if(percentage <= 65.0){
      return Image.asset(R.duck65);
    }else if(percentage <= 70.0){
      return Image.asset(R.duck70);
    }else if(percentage <= 75.0){
      return Image.asset(R.duck75);
    }else if(percentage <= 80.0){
      return Image.asset(R.duck80);
    }else if(percentage <= 85.0){
      return Image.asset(R.duck85);
    }else if(percentage <= 90.0){
      return Image.asset(R.duck90);
    }else if(percentage <= 95.0){
      return Image.asset(R.duck95);
    }else if(percentage <= 100.0){
      return Image.asset(R.duck100);
    }else{
      return Image.asset(R.duckEmpty);
    }

  }
}