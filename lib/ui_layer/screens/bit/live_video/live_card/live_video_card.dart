
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../domain/model/live_model.dart';
import '../../../../router/routes.dart';
import '../../../../utils/common_utils.dart';
import '../../../common_widgets/my_image.dart';
import '../../../image_paths.dart';
import '../../../theme.dart';

class LiveVideoCard extends StatelessWidget {
  const LiveVideoCard({super.key, required this.data});

  final LiveModel data;

  String get imageUrl => CommonUtils.getThumb(data.toJson());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        LiveVideoDetailRoute('${data.id}').push(context);
      },
      child: SizedBox(
        height: 170.w,
        child: Stack(
          children: [
            Positioned.fill(
              child: MyImage.network(
                imageUrl,
                borderRadius: 5,
                backgroundColor: MyTheme.imageBgColor,
              ),
            ),
            Positioned(
                top: 5.w,
                left: 5.w,
                right: 5.w,
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 0.w, top: 0.5.w),
                      padding: EdgeInsets.only(top: 1.7.w, left: 18.w, right: 6.w),
                      height: 18.w,
                      decoration: BoxDecoration(
                        color: MyTheme.blackColor25505,
                        borderRadius: BorderRadius.all(Radius.circular(9.w)),
                      ),
                      child: Text('${CommonUtils.renderEnFixedNumber(data.viewFct ?? 0)}${'gk'.tr()}', style: MyTheme.white09_10),
                    ),
                    MyImage.asset(
                      MyImagePaths.appHots,
                      height: 19.w,
                      width: 19.w,
                    )
                  ],
                )),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: MyImage.asset(
                MyImagePaths.appCardBottomBg,
                height: 53.w,
                fit: BoxFit.cover,
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
                        data.username ?? '',
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
