import 'package:awjq/ui_layer/screens/ai/face_swap/screen.dart';
import 'package:awjq/ui_layer/screens/ai/strip_off/screen.dart';
import 'package:awjq/ui_layer/screens/common_widgets/my_app_bar.dart';
import 'package:awjq/ui_layer/screens/common_widgets/screen_background.dart';
import 'package:awjq/ui_layer/screens/image_paths.dart';
import 'package:awjq/ui_layer/screens/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../router/routes.dart';
import '../../ai/ai_art/screen.dart';
import '../../ai/ai_magic/screen.dart';
import '../../common_widgets/my_image.dart';

import '../../../../report/ui_layer/report_gesture_detector.dart';

import '../../../../report/ui_layer/report_general_banner.dart';

class HomeAiScreen extends StatefulWidget {
  const HomeAiScreen({super.key});

  @override
  State<HomeAiScreen> createState() => _HomeAiScreenState();
}

class _HomeAiScreenState extends State<HomeAiScreen>
    with TickerProviderStateMixin {
  late final navList = [
    'aimf'.tr(),
    'aity'.tr(),
    'aihl'.tr(),
    'aihh'.tr(),
  ];
  late final tabController = TabController(length: navList.length, vsync: this);
  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
      child: Scaffold(
        appBar: _AppBar(
          tabController: tabController,
          titles: navList,
        ),
        body: TabBarView(
          controller: tabController,
          children: navList.map((e) {
            if (e == 'aity'.tr()) {
              return const StripOffScreen();
            } else if (e == 'aihl'.tr()) {
              return const FaceSwapScreen();
            } else if (e == 'aimf'.tr()) {
              return const AIMagic();
            } else if (e == 'aihh'.tr()) {
              return const AIArtScreen();
            }

            return SizedBox();
          }).toList(),
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar({required this.tabController, required this.titles});

  final TabController tabController;
  final List<String> titles;

  @override
  final Size preferredSize = const Size.fromHeight(44);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: ReportGestureDetector(
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: MyImage.asset(
            MyImagePaths.appBackIcon,
            width: 20.w,
            height: 20.w,
          ),
        ),
        onTap: () {
          context.pop();
        },
      ),
      actions: [
        TextButton(
          onPressed: () {
            const MineAIRecordRoute().push(context);
          },
          child: const Center(
            child: Text(
              '记录',
              style: TextStyle(color: Colors.white60),
            ),
          ),
        ),
      ],
      // centerTitle: true,
      backgroundColor: Colors.transparent,
      title: SizedBox(
        height: preferredSize.height,
        child: TabBar(
          padding: EdgeInsets.zero,
          controller: tabController,
          labelPadding: const EdgeInsets.symmetric(horizontal: 10),
          tabAlignment: TabAlignment.center,
          isScrollable: true,
          labelStyle: MyTheme.white255_16_M,
          unselectedLabelStyle: MyTheme.white244_16,
          overlayColor: WidgetStateProperty.resolveWith<Color>(
            (_) => Colors.transparent,
          ),
          indicatorColor: Colors.transparent,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(30.w),
          ),
          dividerColor: Colors.transparent,
          dividerHeight: 0,
          tabs: titles.map((t) => Tab(text: t)).toList(),
        ),
      ),
    );

    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      leadingWidth: 40.w,
      leading: ReportGestureDetector(
        onTap: () {
          context.pop();
        },
        child: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Image.asset(
            MyImagePaths.appBackIcon,
            width: 20.w,
            height: 20.w,
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            const MineAIRecordRoute().push(context);
          },
          child: const Center(
            child: Text(
              '记录',
              style: TextStyle(color: Colors.white60),
            ),
          ),
        ),
      ],
      title: SizedBox(
        height: 30.w,
        child: TabBar(
          padding: EdgeInsets.zero,
          controller: tabController,
          labelPadding: const EdgeInsets.symmetric(horizontal: 10),
          tabAlignment: TabAlignment.center,
          isScrollable: true,
          labelStyle: MyTheme.white255_15,
          unselectedLabelStyle: MyTheme.white06_15,
          overlayColor: WidgetStateProperty.resolveWith<Color>(
            (_) => Colors.transparent,
          ),
          indicatorColor: Colors.transparent,
          indicator: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(30.w),
          ),
          dividerColor: Colors.transparent,
          dividerHeight: 0,
          tabs: titles.map((e) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.w),
              child: Tab(
                iconMargin: EdgeInsets.zero,
                height: MyTheme.navbarHegiht,
                child: Center(
                  child: Text(e),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
