import 'package:awjq/ui_layer/screens/image_paths.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../router/routes.dart';
import '../../../../../domain/model/feed/feed_model.dart';
import '../../../../utils/common_utils.dart';
import '../../../theme.dart';
import '../../my_image.dart';

class OnlineVideoCard extends StatelessWidget {
  const OnlineVideoCard({super.key, required this.data});

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
            Positioned(
                top: 5.w,
                left: 5.w,
                right: 5.w,
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 5.w, top: 0.5.w),
                      padding: EdgeInsets.only(top: 1.w, left: 16.w, right: 6.w),
                      height: 18.w,
                      decoration: BoxDecoration(
                        color: MyTheme.blackColor25505,
                        borderRadius: BorderRadius.all(Radius.circular(9.w)),
                      ),
                      child: Text('27.3W观看', style: MyTheme.white11),
                    ),
                    MyImage.asset(
                      MyImagePaths.appHots,
                      height: 19.w,
                      width: 19.w,
                    )
                  ],
                )),
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
                        data.title,
                        style: MyTheme.white13medium,
                        maxLines: 1,
                      ),
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
