import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/common_utils.dart';
import '../../../theme.dart';

class CardContentView extends StatelessWidget {
  const CardContentView(
      {super.key,
        required this.isBest,
    required this.title,
    this.maxLines = 2});

  final bool isBest;
  final String title;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      TextSpan(
        children: [
          if (isBest)
            WidgetSpan(
              // alignment: PlaceholderAlignment.middle,
              child: Container(
                margin: EdgeInsets.only(right: 3.w), //, bottom: 1.5.w),
                width: 31.w,
                height: 17.w,
                // padding: EdgeInsets.only(left: 5.w, right: 5.w, bottom: kIsWeb ? 1.w : 0),
                decoration: BoxDecoration(
                  gradient: MyTheme.gradient_90_114,
                  borderRadius: BorderRadius.all(
                    Radius.circular(2.w),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'jhua'.tr(context: context),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11.sp,
                        height: 1
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          TextSpan(
            text: CommonUtils.convertEmojiAndHtml(title),
            style: TextStyle(
                color: Colors.white,
                fontSize: 15.sp,
                height: 1.2,
             ),
          )
        ],
      ),
    );
  }
}
