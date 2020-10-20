import 'package:flutter/material.dart';
import 'package:flutter_splash/flutter_splash.dart';

Widget splash(Widget press, String title){
  return Splash(
    seconds: 2,
    navigateAfterSeconds:press ,
    image: Image.asset("assets/doaa.png"),
    photoSize: 100,
    title: new Text(title,
      style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          color: Colors.white
      ),textAlign: TextAlign.center,),
    backgroundColor: Color(0xff392850),
    loaderColor: Color(0xff453670),
  );
}
