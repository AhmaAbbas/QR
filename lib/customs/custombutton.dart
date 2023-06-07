import 'package:flutter/material.dart';

class CustomTextFormFeild extends StatelessWidget {
  CustomTextFormFeild(
      {Key? key,
        this.hintText,
        this.icon,
        this.onchaged,
        this.validator,
        this.suffixicon,
        this.obsecure = false,
      });

  String? hintText;
  IconData? icon;
  Function(String)? onchaged;
  bool? obsecure;
  String? Function(String?)? validator;
  Icon? suffixicon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        validator: validator,
        textAlign: TextAlign.left,
        obscureText: obsecure!,
        onChanged: onchaged,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(
              20.0,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.black),
            ),
            hintText: hintText,
            labelStyle: const TextStyle(
              color: Colors.black,
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.grey)),
            suffixIcon: suffixicon,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.grey))),
      ),
    );
  }
}
