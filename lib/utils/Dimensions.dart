import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;
  static double sliderHeight = screenHeight / 2.63;
  static double imageSliderHeight = screenHeight / 3.84;
  static double detailedSliderHeight =
      screenHeight / 7.03 < 110 ? 110 : screenHeight / 7.03;

  // height
  static double height5 = screenHeight / 168.8;

  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.27;
  static double height20 = screenHeight / 42.2;
  static double height30 = screenHeight / 28.13;
  static double height45 = screenHeight / 18.75;
  // width
  static double width5 = screenHeight / 168.8;

  static double width10 = screenHeight / 84.4;
  static double width15 = screenHeight / 56.27;
  static double width20 = screenHeight / 42.2;
  static double width30 = screenHeight / 28.13;
  static double width45 = screenHeight / 18.75;
  // font
  static double font16 = screenHeight / 52.75;

  static double font20 = screenHeight / 42.2;
  static double font26 = screenHeight / 32.46;

  // icon size
  static double iconSize24 = screenHeight / 35.17;
  static double iconSize26 = screenHeight / 32.46;

  // menu item
  static double itemImageWidth = screenWidth / 3.76;
  static double itemImageHeight = itemImageWidth;

  /************ food_page_details */
  static double bannerImage = screenHeight / 2.41;
  // bottom Bar
  static double bottomHeightBar = screenHeight / 7.03;

  // splash screen dimentions
  static double splashImg = screenHeight / 3.375;

  // raduis
  static double radius10 = screenHeight / 84.4;
}
