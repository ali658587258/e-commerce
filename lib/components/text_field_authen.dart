import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldAuthen extends StatelessWidget {
  final String label;
  final bool isPassword;
  final IconData iconData;
  final controller;
  final function;


  TextFieldAuthen({required this.label, required this.isPassword, required this.iconData, required this.controller,required this.function});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 5.h),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border:UnderlineInputBorder(),
          prefixIcon: Icon(iconData),
          labelText: label,
        ),
        obscureText: isPassword,
        validator: function
      ),
    );
  }
}
