import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire/controller/main_controller.dart';
import 'package:fire/models/user_model.dart';
import 'package:fire/utils/Dimensions.dart';
import 'package:fire/widget/big_text.dart';
import 'package:fire/widget/show_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowData extends StatefulWidget {
  const ShowData({Key? key}) : super(key: key);

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  @override
  initState() {
    super.initState();
    MainController.instance.getUsers();
    print("askdlf");
  }

  double width = Dimensions.screenWidth;
  bool selectName = true,
      selectEmail = true,
      selectPhone = false,
      selectGender = false,
      selectBirthDay = false;

  List<String> getTitles() {
    List<String> titles = ["#"];
    if (selectName) titles.add("Name");
    if (selectEmail) titles.add("Email");
    if (selectPhone) titles.add("Phone");
    if (selectGender) titles.add("Gender");
    if (selectBirthDay) titles.add("Birth");

    return titles;
  }

  List<String> getData(int key, UserModel user) {
    List<String> data = [key.toString()];
    if (selectName) data.add(user.name!);
    if (selectEmail) data.add(user.email!);
    if (selectPhone) data.add(user.phone!);
    if (selectGender) data.add(user.gender! ? "Male" : "Female");
    if (selectBirthDay) data.add(user.birthDay!);

    return data;
  }

  int selectedCount = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          width: width,
          padding: EdgeInsets.only(top: Dimensions.screenHeight * .05),
          child: Column(
            children: [
              // options
              Container(
                width: Dimensions.screenWidth,
                height: Dimensions.screenHeight * .05,
                margin: EdgeInsets.only(bottom: Dimensions.height15),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // name
                      GestureDetector(
                          onTap: () => setState(() {
                                if (selectedCount > 1) {
                                  selectName = !selectName;
                                  selectName == false
                                      ? --selectedCount
                                      : ++selectedCount;
                                } else if (!selectName) {
                                  selectName = !selectName;
                                  ++selectedCount;
                                }
                              }),
                          child: CheckPoint("name", isSelected: selectName)),
                      // email
                      GestureDetector(
                          onTap: () => setState(() {
                                if (selectedCount > 1) {
                                  selectEmail = !selectEmail;
                                  selectEmail == false
                                      ? --selectedCount
                                      : ++selectedCount;
                                } else if (!selectEmail) {
                                  selectEmail = !selectEmail;
                                  ++selectedCount;
                                }
                                print(selectedCount);
                              }),
                          child: CheckPoint("email", isSelected: selectEmail)),
                      // phone
                      GestureDetector(
                          onTap: () => setState(() {
                                if (selectedCount > 1) {
                                  selectPhone = !selectPhone;
                                  selectPhone == false
                                      ? --selectedCount
                                      : ++selectedCount;
                                } else if (!selectPhone) {
                                  selectPhone = !selectPhone;
                                  ++selectedCount;
                                }

                                print(selectedCount);
                              }),
                          child: CheckPoint("phone", isSelected: selectPhone)),
                      // birthDay
                      GestureDetector(
                          onTap: () => setState(() {
                                if (selectedCount > 1) {
                                  selectBirthDay = !selectBirthDay;
                                  selectBirthDay == false
                                      ? --selectedCount
                                      : ++selectedCount;
                                } else if (!selectBirthDay) {
                                  selectBirthDay = !selectBirthDay;
                                  ++selectedCount;
                                }
                                print(selectedCount);
                              }),
                          child: CheckPoint("birth day",
                              isSelected: selectBirthDay)),
                      // gender
                      GestureDetector(
                          onTap: () => setState(() {
                                if (selectedCount > 1) {
                                  selectGender = !selectGender;
                                  selectGender == false
                                      ? --selectedCount
                                      : ++selectedCount;
                                } else if (!selectGender) {
                                  selectGender = !selectGender;
                                  ++selectedCount;
                                }

                                print(selectedCount);
                              }),
                          child:
                              CheckPoint("gender", isSelected: selectGender)),
                    ]),
              ),
              // header
              ShowForm(
                 
                data: getTitles(),
                isHeader: true,
              ),
              Center(
                  child: Container(
                width: Dimensions.screenWidth * .96,
                height: Dimensions.height5 * .6,
                color: Colors.black,
              )),
              GetBuilder<MainController>(builder: (_controller) {
                return Column(
                  children: _controller.users.asMap().entries.map((e) {
                    String gender = e.value.gender! ? "Male" : "Female";
                    return ShowForm(
                     user: e.value,
                      data: getData(e.key, e.value),
                     
                    );
                  }).toList(),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget CheckPoint(String text, {bool isSelected = false}) {
    return Container(
      // width: Dimensions.screenWidth * .18,
      padding: EdgeInsets.all(Dimensions.height5),
      height: Dimensions.screenHeight * .05,
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue[300] : Colors.white,
        borderRadius: BorderRadius.circular(Dimensions.height15),
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: Center(
          child: BigText(
        text,
        size: Dimensions.font16,
      )),
    );
  }
}
