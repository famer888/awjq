import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme.dart';

class MemberVipWidget extends StatelessWidget {
  const MemberVipWidget({
    super.key,
    this.showText,
    this.fontSize = 10,
    this.height = 16,
    this.margin = 0,
  });
  final String? showText;
  final double fontSize;
  final double height;
  final double margin;

  @override
  Widget build(BuildContext context) {
    if (showText case final text? when text.isNotEmpty) {
      return Container(
        height: height,
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        margin: EdgeInsets.only(right: margin.w),
        decoration: BoxDecoration(
          gradient: MyTheme.gradient_90_114,
          borderRadius: BorderRadius.circular(height / 2),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: fontSize),
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
