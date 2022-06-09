import 'package:fire/controller/main_controller.dart';
import 'package:fire/pages/sign_up_page.dart';
import 'package:fire/routes/route_helper.dart';
import 'package:fire/utils/Dimensions.dart';
import 'package:fire/widget/input_feild_widget.dart';
import 'package:fire/widget/sign_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    String email = "", password = "";
    _formValidation() {
      email = emailController.text.trim();
      password = passwordController.text.trim();
    }

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
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/sign_in_header.png"),
                      fit: BoxFit.cover),
                ),
              ),
              //body
              Container(
                // height: Dimensions.height20 * 3.5,
                width: Dimensions.screenWidth,
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Beroo",
                          style: TextStyle(
                            fontSize: 70,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )),
                      Text("Wellcome my heart",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                          )),
                      SizedBox(height: Dimensions.height10 * 5),
                      //email
                      InputFeildWidget(
                        controller: emailController,
                        name: "text",
                        hintText: "Email or Phone",
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
                      SizedBox(height: Dimensions.height20),
                      Row(
                        children: [
                          Expanded(child: Container()),
                          Text("Forget you Password?",
                              style: TextStyle(
                                fontSize: Dimensions.font20,
                                color: Colors.grey,
                              )),
                        ],
                      ),
                      SizedBox(height: 40),
                      GestureDetector(
                          onTap: () {
                            _formValidation();
                            MainController.instance.login(email, password);
                          },
                          child: SignButton(text: "Sign in")),
                      SizedBox(height: Dimensions.height30),

                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey.withOpacity(.7)),
                            children: [
                              TextSpan(
                                  text: "Create",
                                  style: TextStyle(
                                    fontSize: Dimensions.font20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Get.toNamed(
                                        RouteHelper.getSignUpPage()))
                            ],
                          ),
                        ),
                      ),
                    ]),
              ),
            ]),
      ),
    );
  }
}
