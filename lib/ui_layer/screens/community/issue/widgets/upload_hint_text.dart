import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme.dart';

class UploadHintText extends StatelessWidget {
  const UploadHintText({
    super.key,
    required this.title,
    this.subTitle,
    required this.text,
  });
  final String title;
  final String? subTitle;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: MyTheme.white14Medium,
        ),
        if (subTitle?.isNotEmpty == true) SizedBox(width: 11.w),
        if (subTitle?.isNotEmpty == true)
          Text(
            subTitle ?? '',
            style: TextStyle(
              color: const Color(0xFFE83125),
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}
