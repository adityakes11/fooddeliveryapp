import 'package:flutter/material.dart';
class AppWidget{
  static TextStyle boldTextFieldStyle(){
    return TextStyle(
        color: Colors.black,
        fontSize: 20,fontWeight: FontWeight.bold,
        fontFamily:'Poppins');
  }
  static TextStyle HeadLineTextFieldStyle(){
    return TextStyle(
        color: Colors.black,
        fontSize: 24,fontWeight: FontWeight.bold,
        fontFamily:'Poppins');
  }
  static TextStyle LightTextFieldStyle(){
    return TextStyle(
        color: Colors.black38,
        fontSize: 15,fontWeight: FontWeight.w500,
        fontFamily:'Poppins');
  }
  static TextStyle semiBoldTextFieldStyle(){
    return TextStyle(
        color: Colors.black54,
        fontSize: 18,fontWeight: FontWeight.w500,
        fontFamily:'Poppins');
  }

}