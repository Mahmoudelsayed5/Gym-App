import 'package:flutter/material.dart';

class MainImages{
  static const yoga = "images/yoga.png";
  static const manHW = "images/mna.png";
  static const newsfeedPost = "images/bg.png";
  static const muscleMan = "images/Muscular System.png";
  static const logo = "images/logo.png";
  static const logo2 = "images/logo2.png";
}
class GymImages{
  static const emptyGym = "images/workout/emptyGym.jpeg";
  static const gymBg = "images/workout/gymBg.jpeg";
  static const runBg = "images/runBg.jpeg";
   List<String> gymImages = [];
  List gym(){
    gymImages.add(emptyGym);
    gymImages.add(gymBg);
    gymImages.add(runBg);
    return gymImages;
}

}

class FoodImages{
  static const emptyNutrition = "images/food/food.png";
  static const nutritionBg = "images/food/nutritionbg.jpg";

}