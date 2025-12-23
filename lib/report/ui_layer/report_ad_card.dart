import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../domain/model/feed/feed_model.dart';

import '../../../../../report/ui_layer/report_gesture_detector.dart';

import '../../../../../report/ui_layer/report_general_banner.dart';
import '../../ui_layer/screens/common_widgets/my_image.dart';
import '../../ui_layer/screens/theme.dart';
import '../../ui_layer/utils/common_utils.dart';
import '../event_tracking.dart';
import 'report_timing_observer.dart';

class ReportAdCard extends StatelessWidget {
  const ReportAdCard({super.key, required this.ad});
  final FeedAdModel ad;
  String get description => ad.description ?? ad.subTitle ?? '4567890-';
  String get imgUrl => CommonUtils.getThumb(ad.toJson());

  //上传广告行为
  void postActionReport(FeedAdModel tp, String action) {
    // final pageName = context.parentTitle;
    // final widgetType = context.parentWidgetType.toString();

    EventTracking().reportSingle({
      "event": "advertising",
      "event_type": action,
      "advertising_key": tp.advertiseLocationCode,
      "advertising_name": tp.adSlotName,
      "advertising_id": tp.advertiseCode,
    });
  }

  //点击广告上报
  void postClickReport(FeedAdModel tp) {
    postActionReport(tp, "click");

    // final pageName = context.parentTitle;
    // final widgetType = context.parentWidgetType.toString();
    EventTracking().reportSingle({
      "event": "ad_click",
      "page_key": RouteStore.currentPageKey,
      "page_name": RouteStore.currentPageName,
      "ad_slot_key": tp.advertiseLocationCode,
      "ad_slot_name": tp.adSlotName,
      "ad_id": tp.advertiseCode,
      "creative_id": "",
      "ad_type": tp.adType,
    }).then((value) {
      // CommonUtils.log(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ReportGestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        postClickReport(ad);
        CommonUtils.openRoute(context, ad.toJson());
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 94.w,
            child: Stack(
              fit: StackFit.expand,
              children: [
                MyImage.network(
                  imgUrl,
                  borderRadius: 3.w,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 38.w,
                    height: 20.w,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(252, 231, 80, 1),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(3.w),
                          bottomRight: Radius.circular(3.w)),
                    ),
                    child: Center(
                        child: Text(
                      'gg'.tr(),
                      style: MyTheme.black12_M,
                    )),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 4.w),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ad.title,
                style: MyTheme.white13,
                maxLines: 1,
              ),
              Text(
                description,
                style: MyTheme.graya3a2a2_11,
                maxLines: 1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
