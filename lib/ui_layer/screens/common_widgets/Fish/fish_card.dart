import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/model/post_model.dart';
import '../../../router/routes.dart';
import '../../../utils/common_utils.dart';
import '../../theme.dart';
import '../my_image.dart';


class FishCard extends StatelessWidget {
  const FishCard({super.key, required this.data});
  final PostModel data;

  String get imageUrl {
    var thumb = '';
    if (data.medias?.isNotEmpty ?? false) {
      thumb = CommonUtils.getThumb(data.medias!.first.toJson());
    }
    return thumb;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        CommunityPostDetailRoute('${data.id}').push(context);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 170 / 225,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    MyImage.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      borderRadius: 4,
                      backgroundColor: MyTheme.imageBgColor,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${data.unlockNum}+人解锁',
                              style: MyTheme.orange247_13,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4.w),
              Text(
                data.title,
                style: MyTheme.white244_14,
                maxLines: 2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
