import 'package:awjq/ui_layer/screens/common_widgets/my_app_bar.dart';
import 'package:awjq/ui_layer/screens/common_widgets/screen_background.dart';
import 'package:awjq/ui_layer/screens/image_paths.dart';
import 'package:awjq/ui_layer/screens/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomeAiScreen extends StatefulWidget {
  const HomeAiScreen({super.key});

  @override
  State<HomeAiScreen> createState() => _HomeAiScreenState();
}

class _HomeAiScreenState extends State<HomeAiScreen> with TickerProviderStateMixin {
  late final navList = ['AI脱衣', 'AI换脸'];
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
            if (e == 'AI脱衣') {
              return Container();
            } else {
              return Container();
            }
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
      centerTitle: true,
      backgroundColor: Colors.transparent,
      leadingWidth: 40.w,
      leading:GestureDetector(
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
      title: SizedBox(
        height: 30.w,
        child: TabBar(
          padding: EdgeInsets.zero,
          controller: tabController,
          labelPadding: const EdgeInsets.symmetric(horizontal: 10),
          tabAlignment: TabAlignment.center,
          isScrollable: true,
          labelStyle: MyTheme.white255_18,
          unselectedLabelStyle: MyTheme.white06_18,
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
