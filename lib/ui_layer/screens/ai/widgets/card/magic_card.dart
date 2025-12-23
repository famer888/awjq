import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../domain/model/ai/ai_magic_model.dart';
import '../../../../../ui_layer/screens/common_widgets/my_image.dart';
import '../../../../router/routes.dart';
import '../../../../utils/common_utils.dart';
import '../../../theme.dart';

import '../../../../../report/ui_layer/report_gesture_detector.dart';

import '../../../../../report/ui_layer/report_general_banner.dart';

class MagicCard extends StatelessWidget {
  const MagicCard({super.key, required this.data});
  final AIMagicModel data;
  static const aspectRatio = 9 / 16;

  String get imageUrl => CommonUtils.getThumb(data.toJson());

  @override
  Widget build(BuildContext context) {
    return ReportGestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        AIMagicDetailRoute(data).push(context);
      },
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: Stack(
          fit: StackFit.expand,
          children: [
            MyImage.network(
              imageUrl,
              fit: BoxFit.cover,
              backgroundColor: MyTheme.imageBgColor,
              borderRadius: 5.w,
            ),
            Positioned.fill(
                child: Container(
              color: Color.fromRGBO(0, 0, 0, 0.2),
            )),
            Center(
              child: Text(
                data.title ?? '',
                style: MyTheme.white255_24_B.copyWith(
                  shadows: [
                    Shadow(
                      offset: Offset(2, 2), // 阴影偏移 (x, y)
                      blurRadius: 3.0, // 模糊半径
                      color: Color.fromRGBO(0, 0, 0, 0.5), // 阴影颜色
                    ),
                  ],
                ),
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
