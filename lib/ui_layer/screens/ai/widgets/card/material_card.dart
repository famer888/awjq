import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../domain/model/ai_model.dart';
import '../../../../router/routes.dart';
import '../../../../utils/common_utils.dart';
import '../../../common_widgets/my_image.dart';
import '../../../theme.dart';
import '../../face_swap/face_swap_sheet/screent.dart';

import '../../../../../report/ui_layer/report_gesture_detector.dart';

import '../../../../../report/ui_layer/report_general_banner.dart';

class MaterialCard extends StatelessWidget {
  const MaterialCard({super.key, required this.data});

  final AIModel data;

  String get imageUrl {
    return CommonUtils.getThumb(data.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return ReportGestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        _showSheetView(context, data);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 170 / 200,
                child: MyImage.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  borderRadius: 4,
                  backgroundColor: MyTheme.imageBgColor,
                ),
              ),
              SizedBox(height: 7.w),
              Text(data.title ?? '', style: MyTheme.white244_15_M, maxLines: 1),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _showSheetView(BuildContext context, AIModel data) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) => FaceSwapSheetView(data: data),
    );
  }
}
