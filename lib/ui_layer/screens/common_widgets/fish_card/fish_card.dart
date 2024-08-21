import 'package:awjq/domain/model/media_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/model/post_model.dart';
import '../../../router/routes.dart';
import '../../../utils/common_utils.dart';
import '../../image_paths.dart';
import '../../theme.dart';
import '../my_image.dart';

class FishCard extends StatelessWidget {
  const FishCard({super.key, required this.data});

  final PostModel data;

  String get imageUrl {
    var thumb = '';
    if (data.medias?.isNotEmpty ?? false) {
      MediaModel model= data.medias!.first;
      thumb = model.cover;
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
                      placeHolder: MyImagePaths.appDefualBg,
                    ),
                    (data.unlockNum ?? 0) > 0 && (data.unlockCoins ?? 0) > 0
                        ? Positioned(
                            top: 11.w,
                            left: 0.w,
                            right: 11.w,
                            child: Stack(
                              children: [
                                Container(
                                  padding:
                                      EdgeInsets.only(left: 5.w, right: 10.w),
                                  height: 22.w,
                                  decoration: BoxDecoration(
                                    color: MyTheme.blackColor25505,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(11.w),
                                        topRight: Radius.circular(11.w)),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 2.w),
                                    child: Text(
                                      (data.unlockNum ?? 0) < 1000
                                          ? '${data.unlockNum}人解锁'
                                          : '1000+人解锁',
                                      style: MyTheme.orange247_13,
                                    ),
                                  ),
                                ),
                              ],
                            ))
                        : Container(),
                  ],
                ),
              ),
              SizedBox(height: 7.w),
              Text(data.title, style: MyTheme.white244_15_M, maxLines: 1),
              SizedBox(height: 7.w),
              Row(
                children: [
                  MyImage.network(data.user?.thumb ?? '',
                      fit: BoxFit.cover,
                      borderRadius: 12.5.w,
                      width: 25.w,
                      height: 25.w),
                  SizedBox(width: 5.w),
                  Expanded(
                      child: Row(
                    children: [
                      Text(data.user?.nickname ?? '',
                          style: MyTheme.white06_12, maxLines: 1),
                      SizedBox(width: 5.w),
                      if (data.user?.agent == 1)
                        Icon(Icons.verified_sharp,
                          size: 14.w,
                          color: const Color.fromRGBO(247, 208, 93, 1))
                    ],
                  ))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

}
