
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../domain/model/live_model.dart';
import '../../../../router/routes.dart';
import '../../../../utils/common_utils.dart';
import '../../../common_widgets/my_image.dart';
import '../../../image_paths.dart';
import '../../../theme.dart';
import 'live_video_card.dart';

class RecLiveVideoCard extends StatelessWidget {
  const RecLiveVideoCard({super.key, required this.model, required this.moreClickCallBack});

  final ThemesModel model;

  final Function moreClickCallBack;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  model.name ?? '',
                  style: MyTheme.white15semibold,
                  maxLines: 1,
                ),
              ),
              InkWell(
                onTap: () {
                  moreClickCallBack.call();
                },
                child: Container(
                    alignment: Alignment.centerRight,
                    width: 60.w,
                    height: 22.w,
                    child: Text('更多',
                      style: MyTheme.white08_12,
                      textAlign: TextAlign.right,
                    )
                  ),
              )
        ]),
        GridView.builder(
          padding: EdgeInsets.only(top: 10.w, bottom: 10.w),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 每行的网格数
            crossAxisSpacing: 8.w, // 网格之间的水平间距
            mainAxisSpacing: 8.w, // 网格之间的垂直间距
          ),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: model.lives?.length, // 网格项目的数量
          itemBuilder: (context, index) {
            return LiveVideoCard(data: model.lives![index]);
          },
        ),
      ]
    );
  }
}
