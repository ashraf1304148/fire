import 'package:fire/pages/log_in_page.dart';
import 'package:fire/pages/show_data.dart';
import 'package:fire/routes/route_helper.dart';
import 'package:fire/utils/Dimensions.dart';
import 'package:fire/widget/big_text.dart';
import 'package:fire/widget/input_feild_widget.dart';
import 'package:fire/widget/sign_button.dart';
import 'package:fire/widget/small_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  List signupIcons = ["google.png", "twitter.png", "facebook.png"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // header
              Container(
                height: Dimensions.screenHeight * .45,
                width: Dimensions.screenWidth,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/home_header.png"),
                    // fit: BoxFit.cover,
                  ),
                ),
              ),

              //body
              Container(
                // height: Dimensions.height20 * 3.5,
                width: Dimensions.screenWidth,
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //email
                      BigText(
                        "Sign Up",
                        size: Dimensions.font20 * 2.5,
                      ),
                      SizedBox(height: Dimensions.height10 * 2),

                      SmallText("it's easier to sign up new"),

                      SizedBox(height: Dimensions.height10 * 2),
//continue button
                      GestureDetector(
                        onTap: () => Get.to(ShowData()),
                        child: Container(
                          width: Dimensions.screenWidth * .82,
                          height: Dimensions.height20 * 2.5,
                          padding: EdgeInsets.only(
                              left: Dimensions.height20,
                              right: Dimensions.height20),
                          decoration: BoxDecoration(
                              color: Color(0xff1977f3),
                              borderRadius:
                                  BorderRadius.circular(Dimensions.height30),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    spreadRadius: 1,
                                    offset: Offset(0, 10),
                                    color: Color(0xffd9d8ff))
                              ]),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CircleAvatar(
                                  radius: Dimensions.height20,
                                  backgroundImage:
                                      AssetImage("assets/images/facebook.png"),
                                ),
                                BigText(
                                  "Contiue with Facebook",
                                  size: Dimensions.font20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )
                              ]),
                        ),
                      ),
                      SizedBox(height: Dimensions.height30),
                      // user email or phone
                      Container(
                        width: Dimensions.screenWidth * .70,
                        height: Dimensions.height20 * 2.1,
                        padding: EdgeInsets.only(
                            left: Dimensions.height20,
                            right: Dimensions.height20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),

                          // color: Color(0xff1977f3),
                          borderRadius:
                              BorderRadius.circular(Dimensions.height30),
                        ),
                        child: Center(
                          child: GestureDetector(
                            onTap: () => Get.toNamed(
                              RouteHelper.getSignUpPage(),
                            ),
                            child: SmallText(
                              "I'll use email or phone",
                              size: Dimensions.font20 * .8,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: Dimensions.height20 * 2),
                      Center(
                        child: Wrap(
                          runAlignment: WrapAlignment.end,
                          crossAxisAlignment: WrapCrossAlignment.end,

                          // alignment: WrapAlignment.end,
                          spacing: Dimensions.width10,
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: List<Widget>.generate(signupIcons.length,
                              (index) {
                            return CircleAvatar(
                              radius: Dimensions.height10 * 2,
                              backgroundImage: AssetImage(
                                  "assets/images/" + signupIcons[index]),
                            );
                          }),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height20 * 3,
                      ),
                      RichText(
                        text: TextSpan(
                            text: "Already have account? ",
                            style: TextStyle(
                              fontSize: Dimensions.font20 * .9,
                              color: Colors.grey,
                            ),
                            children: [
                              TextSpan(
                                text: "Login",
                                style: TextStyle(
                                    fontSize: Dimensions.font20 * .9,
                                    color: Color(0xff5861fe),
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Get.toNamed(
                                        RouteHelper.getSignInPage(),
                                      ),
                              ),
                            ]),
                      ),
                    ]),
              ),
            ]),
      ),
    );
  }
}
