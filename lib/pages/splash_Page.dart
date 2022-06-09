import 'package:fire/utils/App_colors.dart';
import 'package:fire/utils/Dimensions.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.screenHeight,
      width: Dimensions.screenWidth,
      child: CircularProgressIndicator(
        backgroundColor: AppColors.mainColor,
      ),
    );
  }
}
