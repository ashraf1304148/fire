import 'package:fire/controller/main_controller.dart';
import 'package:fire/models/user_model.dart';
import 'package:fire/pages/log_in_page.dart';
import 'package:fire/pages/show_data.dart';
import 'package:fire/routes/route_helper.dart';
import 'package:fire/utils/Dimensions.dart';
import 'package:fire/widget/big_text.dart';
import 'package:fire/widget/input_feild_widget.dart';
import 'package:fire/widget/sign_button.dart';
import 'package:fire/widget/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
  List signupIcons = ["google.png", "twitter.png", "facebook.png"];
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var birthDayController = TextEditingController();
  var passwordController = TextEditingController();

  // var genderController = Controller();

  String name = "", email = "", phone = "", birthDay = "", password = "";
  bool gender = true;
  UserModel? user;
  _formValidation() {
    name = nameController.text.trim();
    email = emailController.text.trim();
    phone = phoneController.text.trim();
    birthDay = birthDayController.text.trim();

    password = passwordController.text.trim();
    user = UserModel.fromJson({
      'birth_day': birthDay,
      'email': email,
      'name': name,
      'phone': phone,
      'gender': gender,
      "password": password,
    });
  }

  @override
  Widget build(BuildContext context) {
    // widget.user == null ? print("null") : print("not null");
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // header
              Container(
                height: Dimensions.screenHeight * .25,
                width: Dimensions.screenWidth,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/sign_up_header.png"),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: (() {
                        setState(() {});
                        // Get.to(LogInPage());
                      }),
                      child: GestureDetector(
                        onTap: () => Get.to(ShowData()),
                        child: CircleAvatar(
                          backgroundColor: Colors.blueAccent,
                          radius: Dimensions.height20 * 3,
                          backgroundImage:
                              AssetImage("assets/images/baraa.jpeg"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Dimensions.height20),
              //body
              Container(
                // height: Dimensions.height20 * 3.5,
                width: Dimensions.screenWidth,
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //name
                      InputFeildWidget(
                        controller: nameController,
                        name: "text",
                        hintText: "Name ",
                      ),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      //email
                      InputFeildWidget(
                        controller: emailController,
                        name: "Email",
                        hintText: "Email ",
                      ),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      //phone
                      InputFeildWidget(
                        controller: phoneController,
                        name: "phone",
                        hintText: "Phone ",
                      ),
                      SizedBox(
                        height: Dimensions.height10,
                      ),

                      //password
                      InputFeildWidget(
                        controller: passwordController,
                        name: "password",
                        hintText: "Password",
                      ),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      InputFeildWidget(
                        controller: birthDayController,
                        name: "birthDay",
                        hintText: "Birth Day",
                      ),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      ToggleSwitch(
                        initialLabelIndex: 0,
                        totalSwitches: 2,
                        labels: ['Male', 'Female'],
                        onToggle: (index) {
                          gender = (index == 0) ? true : false;
                        },
                      ),
                      SizedBox(height: Dimensions.height20),

                      SizedBox(height: Dimensions.height20),
                      GestureDetector(
                        onTap: () {
                          _formValidation();

                          MainController.instance.register(user!);
                        },
                        child: SignButton(text: "Sing Up"),
                      ),
                      SizedBox(height: Dimensions.height10),

                      // sign up mehods header
                      Column(
                        children: [
                          Center(
                            child: GestureDetector(
                                onTap: (() =>
                                    Get.toNamed(RouteHelper.getSignInPage())),
                                child: SmallText("already have account?")),
                          ),

                          SizedBox(height: Dimensions.height10),
                          Center(
                              child: SmallText(
                            "Sign up using on the following mehod",
                            size: Dimensions.font16,
                          )),
                          SizedBox(height: Dimensions.height20),
                          // sign up methods

                          Center(
                            child: Wrap(
                              runAlignment: WrapAlignment.end,
                              crossAxisAlignment: WrapCrossAlignment.end,

                              // alignment: WrapAlignment.end,
                              spacing: Dimensions.width10,
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: List<Widget>.generate(
                                  signupIcons.length, (index) {
                                return CircleAvatar(
                                  radius: Dimensions.height10 * 2.5,
                                  backgroundImage: AssetImage(
                                      "assets/images/" + signupIcons[index]),
                                );
                              }),
                            ),
                          )
                        ],
                      )
                    ]),
              ),
            ]),
      ),
    );
  }
}
