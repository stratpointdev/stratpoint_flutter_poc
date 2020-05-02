import 'package:flutter/cupertino.dart';

import '../../../r.dart';



class CupLevelIndicator{
  static  Image cupLevelIndicator(double remaining, double total){

    double percentage = (remaining / total) * 100;
    if(percentage == 0.0){
      return Image.asset(R.assetsImagesDuck0);
    }else if(percentage <= 5.0){
      return Image.asset(R.assetsImagesDuck5);
    }else if(percentage <= 10.0){
      return Image.asset(R.assetsImagesDuck10);
    }else if(percentage <= 15.0){
      return Image.asset(R.assetsImagesDuck15);
    }else if(percentage <= 20.0){
      return Image.asset(R.assetsImagesDuck20);
    }else if(percentage <= 25.0){
      return Image.asset(R.assetsImagesDuck25);
    }else if(percentage <= 30.0){
      return Image.asset(R.assetsImagesDuck30);
    }else if(percentage <= 35.0){
      return Image.asset(R.assetsImagesDuck35);
    }else if(percentage <= 40.0){
      return Image.asset(R.assetsImagesDuck40);
    }else if(percentage <= 45.0){
      return Image.asset(R.assetsImagesDuck45);
    }else if(percentage <= 50.0){
      return Image.asset(R.assetsImagesDuck50);
    }else if(percentage <= 55.0){
      return Image.asset(R.assetsImagesDuck55);
    }else if(percentage <= 60.0){
      return Image.asset(R.assetsImagesDuck60);
    }else if(percentage <= 65.0){
      return Image.asset(R.assetsImagesDuck65);
    }else if(percentage <= 70.0){
      return Image.asset(R.assetsImagesDuck70);
    }else if(percentage <= 75.0){
      return Image.asset(R.assetsImagesDuck75);
    }else if(percentage <= 80.0){
      return Image.asset(R.assetsImagesDuck80);
    }else if(percentage <= 85.0){
      return Image.asset(R.assetsImagesDuck85);
    }else if(percentage <= 90.0){
      return Image.asset(R.assetsImagesDuck90);
    }else if(percentage <= 95.0){
      return Image.asset(R.assetsImagesDuck95);
    }else if(percentage <= 100.0){
      return Image.asset(R.assetsImagesDuck100);
    }else{
      return Image.asset(R.assetsImagesDuckEmpty);
    }

  }
}