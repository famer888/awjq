import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../router/routes.dart';
import '../../../../../domain/model/feed/feed_model.dart';
import '../../../../utils/common_utils.dart';
import '../../../image_paths.dart';
import '../../../theme.dart';
import '../../my_image.dart';

class SurveillanceVideoCard extends StatelessWidget {
  const SurveillanceVideoCard({super.key, required this.data});

  final FeedVideoModel data;

  String get imageUrl => CommonUtils.getThumb(data.toJson());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        VideoDetailRoute('${data.id}').push(context);
      },
      child: SizedBox(
        height: 94.w,
        child: Stack(
          children: [
            MyImage.network(
              imageUrl,
              borderRadius: 5,
              backgroundColor: MyTheme.imageBgColor,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: MyImage.asset(
                MyImagePaths.appCardBottomBg,
                height: 53.w,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.w),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        '1303号摄像头',
                        style: MyTheme.white13medium,
                        maxLines: 1,
                      ),
                    ),
                    MyImage.asset(
                      MyImagePaths.appOffline,
                      height: 12.w,
                      width: 12.w,
                    ),
                    SizedBox(width: 3.w),
                    Text(
                      '离线',
                      style: MyTheme.white10medium,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
