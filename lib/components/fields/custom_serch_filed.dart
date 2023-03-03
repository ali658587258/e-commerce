import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../src/app_color.dart';


class CustomSearchField extends StatefulWidget {
  bool isContact;
  final String lable;
  int maxLine, minLine;

  final TextEditingController? controller;

  CustomSearchField({
    this.maxLine = 1,
    this.minLine = 1,
    this.isContact = false,
    required this.lable,
    this.controller,
  });

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 22),
      child: Container(
        decoration: BoxDecoration(
            color: AppColor.kWhiteColor,
            borderRadius: BorderRadius.circular(25)),
        child: TextFormField(
          minLines: widget.isContact ? widget.minLine : 1,
          maxLines: widget.isContact ? widget.maxLine : 1,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter ${widget.lable}';
            }
            return null;
          },
          controller: widget.controller,
          decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.kGreyColor)),
            labelStyle: const TextStyle(color: AppColor.kGreyColor),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.kGreyColor)),
            fillColor: AppColor.kWhiteColor,
            suffixIcon: widget.isContact
                ? const SizedBox()
                : Icon(
                    Icons.search,
                    color: AppColor.kGreyColor,
                    size: 25.sp,
                  ),
            border: UnderlineInputBorder(
                borderSide: const BorderSide(color: AppColor.KMainColor),
                borderRadius: BorderRadius.circular(25)),
            label: widget.isContact
                ? Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '${widget.lable}',
                    ),
                  )
                : Text(
                    '${widget.lable}',
                  ),
          ),
        ),
      ),
    );
  }
}
