import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardImage extends StatelessWidget {
  final String image;


  CardImage({required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.w),
      child: Image.asset(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}
