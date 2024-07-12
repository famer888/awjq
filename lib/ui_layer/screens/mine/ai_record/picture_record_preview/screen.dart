import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/common_utils.dart';
import '../../../../utils/my_toast.dart';
import '../../../common_widgets/my_image.dart';
import '../../../theme.dart';
import 'dart:ui' as ui;

class PictureRecordPreviewScreen extends StatefulWidget {
  const PictureRecordPreviewScreen({super.key, required this.url});

  final String url;

  @override
  State<PictureRecordPreviewScreen> createState() =>
      _PictureRecordPreviewScreenState();
}

class _PictureRecordPreviewScreenState
    extends State<PictureRecordPreviewScreen> {

  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final sheetHeight = ScreenUtil().screenHeight * 0.8;

    return Container(
        padding: EdgeInsets.only(left: MyTheme.pagePadding, top: MyTheme.pagePadding, right: MyTheme.pagePadding, bottom: 116.w),
        color: MyTheme.bgColor,
        height: sheetHeight,
        child: Column(children: [
          Expanded(child: Center(child: RepaintBoundary(
            key: _globalKey,
              child: MyImage.network(widget.url, borderRadius: 14.w)))),
          SizedBox(height: 30.w),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              _saveImage(context);
            },
            child: Container(
              height: 45.w,
              decoration: BoxDecoration(
                  gradient: MyTheme.gradient_90_114,
                  borderRadius: BorderRadius.circular(5.w)),
              child: Center(
                child: Text(
                  tr('bc'),
                  style: MyTheme.white16medium,
                ),
              ),
            ),
          )
        ]));
  }

  Future<void> _saveImage(BuildContext context) async {
    try {
      RenderRepaintBoundary boundary = _globalKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      if (await image.toByteData(format: ui.ImageByteFormat.png)
      case final byteData?) {
        final imageBytes = byteData.buffer.asUint8List();
        CommonUtils.localStorageImage(context, imageBytes);
      } else {
        MyToast.showText(text: tr('tpbcsb'));
      }
    } catch (e) {
      MyToast.showText(text: tr('tpbcsb'));
    }
  }

}
