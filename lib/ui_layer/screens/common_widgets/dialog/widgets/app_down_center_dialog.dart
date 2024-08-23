import 'package:awjq/ui_layer/notifiers/home_config_notifier.dart';
import 'package:awjq/ui_layer/screens/common_widgets/my_image.dart';
import 'package:awjq/ui_layer/screens/image_paths.dart';
import 'package:awjq/ui_layer/screens/theme.dart';
import 'package:awjq/ui_layer/utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../domain/model/home_data_model.dart';

class AppDownCenterDialog extends StatelessWidget {
  const AppDownCenterDialog(
      {super.key,
      required this.cancel,
      });
  final VoidCallback cancel;

  @override
  Widget build(BuildContext context) {

    late final homeConfigNotifier = context.read<HomeConfigNotifier>();
    final apps = homeConfigNotifier.homeData.noticeApps;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      // onTap: () => cancel.call(),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              MyImage.asset(
                MyImagePaths.appDownCenter,
                height: 107.w,
                fit: BoxFit.fill,
              ),
              Container(
                  height: 257.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.w),
                        bottomRight: Radius.circular(10.w)),
                  ),
                child: GridView.builder(
                      shrinkWrap: true,
                      addRepaintBoundaries: false,
                      addAutomaticKeepAlives: false,
                      physics: const BouncingScrollPhysics(),
                      itemCount: apps?.length,
                      padding:
                      EdgeInsets.all(MyTheme.pagePadding),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 49 / 56,
                        mainAxisSpacing: 10.w,
                        crossAxisSpacing: 10.w,
                      ),
                      itemBuilder: (context, index) {
                        Notice? model = apps?[index];
                        return GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            final json = model?.toJson() ?? {};
                            CommonUtils.openRoute(context, json);
                          },
                          child: Column(
                            children: [
                              SizedBox(
                                height: 49.w,
                                width: 49.w,
                                child: MyImage.network(
                                  model?.imgUrl ?? '',
                                  fit: BoxFit.fill,
                                  borderRadius: 10.w,
                                ),
                              ),
                              SizedBox(height: 5.w),
                              Center(
                                child: Text(
                                  model?.title ?? '',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      overflow: TextOverflow.ellipsis,
                                      decoration: TextDecoration.none,
                                      fontSize: 11),
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
              ),
              SizedBox(height: 20.w),
              GestureDetector(
                onTap: () => cancel.call(),
                child: SizedBox(
                  child: MyImage.asset(
                    MyImagePaths.appCancelWithCircle,
                    fit: BoxFit.cover,
                    width: 33.w,
                    height: 33.w,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
