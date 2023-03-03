import 'package:flutter/material.dart';

import '../src/app_color.dart';


class CustomTextForm extends StatefulWidget {
  final String lable;
  bool isPassword = false;

  final TextEditingController controller;
  var icon;

  CustomTextForm(
      {required this.lable,
      this.isPassword = false,
      required this.controller,
      required this.icon});

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  bool isTaped = false;
  bool obScureText = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 22),
      child: Container(
        decoration: BoxDecoration(
            color: AppColor.kWhiteColor,
            borderRadius: BorderRadius.circular(25)),
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter ${widget.lable}';
            }
            return null;
          },
          controller: widget.controller,
          obscureText: obScureText,
          decoration: InputDecoration(
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColor.KMainColor)),
              labelStyle: const TextStyle(color: AppColor.kGreyColor),
              enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColor.KMainColor)),
              fillColor: AppColor.kWhiteColor,
              prefixIcon: Icon(
                widget.icon,
                color: AppColor.kGreyColor,
              ),
              suffixIcon: widget.isPassword == false
                  ? const SizedBox()
                  : IconButton(
                      onPressed: () {
                        obScureText = !obScureText;

                        setState(() {});
                      },
                      icon: obScureText
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off)),
              border: UnderlineInputBorder(
                  borderSide: const BorderSide(color: AppColor.KMainColor),
                  borderRadius: BorderRadius.circular(25)),
              label: Text(
                '${widget.lable}',
              )),
        ),
      ),
    );
  }
}
