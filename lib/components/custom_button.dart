import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'custim_text.dart';


class CustomButton extends StatelessWidget {
  Color colorContainer;
  double width;
  double hight;
  var function;
  String text;
  var fontSize;
  FontWeight? fontWeight;
  Color? textColor;
  double radiusCircular;
  CustomButton(
      {required this.colorContainer,
      required this.radiusCircular,
      required this.width,
      required this.hight,
      required this.text,
      this.fontSize,
      this.fontWeight,
      this.function,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: function,
        child: Container(
          width: width,
          height: hight,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radiusCircular),
              color: colorContainer),
          child: Center(
            child: CustomText(
              text: text,
              color: textColor,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),
        ));
  }
}
