import 'package:flutter/material.dart';

class BackgroundColors{
  static const background = Color.fromARGB(255, 0, 23, 36);
  static const whiteBG = Colors.white;
  static const blackBG = Colors.black;
  static const dialogBG = Color.fromARGB(255, 11, 36, 54);
  static const inkWellBG = Color.fromARGB(255, 22, 54, 80);
  static const offers = Color.fromARGB(255, 173, 141, 254);
  static const selectedButton = Color.fromARGB(255, 110, 247, 150);
  static const button = Color.fromARGB(255, 111, 175, 249);
  static const extraButton = Color.fromARGB(255, 238, 246, 97);
  static const alertColor = Colors.red;
  static const blueGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color.fromARGB(255, 20, 38, 61), Color.fromARGB(255, 31, 52, 79)],
  );
  static const greenGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color.fromARGB(255, 235, 247, 238), Color.fromARGB(
        255, 79, 210, 112)],
  );
  static const redGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color.fromARGB(255, 255, 229, 229), Color.fromARGB(
        255, 198, 54, 54)],
  );
  static const blackGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [BackgroundColors.background, BackgroundColors.dialogBG]
  );

}

class TextColors{
  static const whiteText = Colors.white;
  static const blackText = Colors.black;
  static var greyText = Colors.grey[700];
  static const recommendedText = Color.fromARGB(255, 110, 247, 150);
  static const dataText = Color.fromARGB(255, 238, 246, 17);
}