import 'package:flutter/material.dart';

class BoldTextClass{
  
  static TextStyle DarkboldText(){
    return TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            );
  }

  static TextStyle DarkboldTextLarge(){
    return TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            );
  }

  static TextStyle LightboldText(){
    return TextStyle(
              color: Colors.black38,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            );
  }

   static TextStyle semiBoldText(){
    return TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            );
  }

}