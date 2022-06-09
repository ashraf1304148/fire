import 'package:fire/controller/main_controller.dart';
import 'package:fire/pages/log_in_page.dart';
import 'package:fire/routes/route_helper.dart';
import 'package:fire/utils/Dimensions.dart';
import 'package:fire/widget/big_text.dart';
import 'package:fire/widget/input_feild_widget.dart';
import 'package:fire/widget/sign_button.dart';
import 'package:fire/widget/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WellcomePage extends StatefulWidget {
  final email;

  const WellcomePage({this.email = "", Key? key}) : super(key: key);

  @override
  State<WellcomePage> createState() => _WellcomePage(email);
}

class _WellcomePage extends State<WellcomePage> {
  var email;
  _WellcomePage(this.email);
  List signupIcons = ["google.png", "twitter.png", "facebook.png"];
  @override
  Widget build(BuildContext context) {
    // var x = email;
    // print(x);
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // header
              Container(
                height: Dimensions.screenHeight * .33,
                width: Dimensions.screenWidth,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/wellcome_header.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: (() {
                        setState(() {});
                        // Get.to(LogInPage());
                      }),
                      child: CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        radius: Dimensions.height20 * 3,
                        backgroundImage: AssetImage("assets/images/baraa.jpeg"),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Dimensions.height20 * 3),
              //body
              Container(
                  // height: Dimensions.height20 * 3.5,
                  width: Dimensions.screenWidth,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigText(
                              "Wellcome",
                              size: Dimensions.font20 * 2,
                            ),
                            SmallText(email.toString()),
                            SizedBox(height: Dimensions.screenHeight * .25),
                          ]),
                      GestureDetector(
                          onTap: (() => MainController.instance.logOut()),
                          child: SignButton(text: "Sign out")),
                    ],
                  )),
            ]),
      ),
    );
  }
}
