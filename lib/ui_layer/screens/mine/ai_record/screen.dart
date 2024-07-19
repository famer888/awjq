import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../common_widgets/keep_alive_wrapper.dart';
import '../../common_widgets/my_image.dart';
import '../../common_widgets/screen_background.dart';
import '../../image_paths.dart';
import '../../theme.dart';
import 'face_swap_record/screen.dart';
import 'strip_off_record/screen.dart';

class MineAIRecordScreen extends StatefulWidget {
  const MineAIRecordScreen({super.key});

  @override
  State<MineAIRecordScreen> createState() => _MineAIRecordScreenState();
}

class _MineAIRecordScreenState extends State<MineAIRecordScreen> with TickerProviderStateMixin {

  List<String> navList = [tr('aity'), tr('aihl')];
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
          children: const [
            KeepAliveWrapper(
              child: MineStrpOffRecordScreen(),
            ),
            KeepAliveWrapper(
              child: MineFaceSwapRecordScreen(),
            )
          ],
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
      leading: GestureDetector(
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
      centerTitle: true,
      backgroundColor: Colors.transparent,
      title: SizedBox(
        height: 30.w,
        child: TabBar(
          padding: EdgeInsets.zero,
          controller: tabController,
          labelPadding: const EdgeInsets.symmetric(horizontal: 10),
          tabAlignment: TabAlignment.center,
          isScrollable: true,
          labelStyle: MyTheme.white255_18_M,
          unselectedLabelStyle: MyTheme.white06_18,
          overlayColor: WidgetStateProperty.resolveWith<Color>(
                (_) => Colors.transparent,
          ),
          indicatorColor: Colors.transparent,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(30.w),
          ),
          dividerColor: Colors.transparent,
          dividerHeight: 0,
          tabs: titles.map((e) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
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