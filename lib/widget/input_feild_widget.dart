import 'package:fire/utils/Dimensions.dart';
import 'package:flutter/material.dart';

class InputFeildWidget extends StatelessWidget {
  final String name;
  final String hintText;
  final TextEditingController controller; 
  const InputFeildWidget(
      {required this.controller,
      this.name = "text", 
      required this.hintText,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _showPassword = false;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimensions.height30),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 7,
            offset: Offset(1, 1),
            color: Colors.grey.withOpacity(.7),
          )
        ],
      ),
      child: StatefulBuilder(builder: (context, setState) {
        return TextField(
          controller: controller,
          obscureText: (name == "password" && !_showPassword),
          // keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            prefixIcon: Icon(
              (name == "password")
                  ? Icons.password_outlined
                  : Icons.email_outlined,
              color: Color(0xff576dee),
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                _showPassword = !_showPassword;
                print(_showPassword);
                setState(() {});
              },
              child: Icon(
                (name == "password") ? Icons.remove_red_eye : (() {}()),
                color: Color(0xff575757),
              ),
            ),
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.height30),
            ),
          ),
        );
      }),
    );
  }
}
