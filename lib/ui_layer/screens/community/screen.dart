import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../domain/domain.dart';
import '../../notifiers/home_config_notifier.dart';
import '../../notifiers/user_notifier.dart';
import '../../router/routes.dart';
import '../image_paths.dart';

import '../../../domain/async_value.dart';
import '../../../domain/model/community_nav_model.dart';
import '../../router/router.dart';
import '../common_widgets/my_image.dart';
import '../common_widgets/my_tab_bar.dart';
import '../common_widgets/screen_background.dart';
import '../common_widgets/search_app_bar.dart';
import '../common_widgets/status/loading.dart';
import '../common_widgets/status/network_error.dart';
import '../theme.dart';
import 'content.dart';
import 'issue/screen.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key, required this.isFish});

  /// 咸鱼
  final bool isFish;

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  Future<void> _showIssueAlert() {
    final issues = [
      (
        title: 'tp'.tr(context: context),
        iconName: MyImagePaths.appFabuPicture,
        type: CommunityIssueType.image,
      ),
      (
        title: 'spingzb'.tr(context: context),
        iconName: MyImagePaths.appFabuVideo,
        type: CommunityIssueType.video,
      ),
      (
        title: 'twen'.tr(context: context),
        iconName: MyImagePaths.appFabuText,
        type: CommunityIssueType.imageAndText,
      ),
    ];
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: AppRouter.rootNavigatorKey.currentContext ?? context,
      builder: (context) => DecoratedBox(
        decoration: BoxDecoration(
          color: const Color(0xFF23262f),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.w),
            topRight: Radius.circular(10.w),
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 13.w),
                width: double.infinity,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox.shrink(),
                    Text(
                      'xzfblx'.tr(),
                      style: MyTheme.white16bold,
                    ),
                    GestureDetector(
                      onTap: () => context.pop(),
                      child: MyImage.asset(
                        MyImagePaths.appIssueClose,
                        width: 11.w,
                        height: 11.w,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (final issue in issues)
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        context.pop();
                        CommunityIssueRoute(issue.type).push(context);
                      },
                      child: Column(
                        children: [
                          MyImage.asset(
                            issue.iconName,
                            width: 50.w,
                            height: 52.7.w,
                          ),
                          SizedBox(height: 4.w),
                          Text(
                            issue.title,
                            style: MyTheme.white16medium,
                          )
                        ],
                      ),
                    )
                ],
              ),
              SizedBox(height: 42.5.w)
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
      child: Scaffold(
        appBar: const SearchAppBar(),
        body: _Body(isFish: widget.isFish),
        floatingActionButton: GestureDetector(
          onTap: widget.isFish
              ? () => const XianYuIssueRoute().push(context)
              : _showIssueAlert,
          behavior: HitTestBehavior.translucent,
          child: MyImage.asset(
            MyImagePaths.appIssueIcon,
            width: 60.w,
            height: 60.w,
          ),
        ),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({required this.isFish});

  /// 咸鱼
  final bool isFish;
  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  late final _appDomain = context.read<CommunityDomain>();
  late final _config = context.read<HomeConfigNotifier>().config;
  AsyncValue<List<CommunityNavModel>> _asyncValue = const AsyncInit();

  @override
  void initState() {
    _init();
    super.initState();
  }

  Future<void> _init() async {
    if (_asyncValue.isLoading) return;
    setState(() {
      _asyncValue = const AsyncLoading();
    });

    final result =
        await _appDomain.reqGetPostNav(type: widget.isFish ? 'fish' : '');

    setState(() {
      if (result.data case final data?) {
        _asyncValue = AsyncData(data);
      } else {
        _asyncValue = const AsyncError();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _asyncValue.maybeWhen(
      data: (data) => TabBarWithView.line(
        titles: data.map((e) => e.title).toList(),
        views: data.map((e) {
          if (e.mask == 1) {
            return Stack(
              fit: StackFit.expand,
              children: [
                CommunityContentView(id: e.id, isFish: widget.isFish),
                const _BlurView(),
              ],
            );
          }
          return CommunityContentView(id: e.id, isFish: widget.isFish);
        }).toList(),
      ),
      error: (_, __) => NetworkErrorView(onTap: _init),
      orElse: () => const LoadingView(),
    );
  }
}

class _BlurView extends StatelessWidget {
  const _BlurView();

  @override
  Widget build(BuildContext context) {
    return Selector<UserNotifier, String>(
      selector: (_, userNotifier) => userNotifier.member.vipStr,
      builder: (context, vipStr, child) {
        final config = context.read<HomeConfigNotifier>().config;
        if (config.vipLevelAwqStr.contains(vipStr)) {
          return const SizedBox.shrink();
        }

        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            const VipCenterRoute().push(context);
          },
          child: ClipRect(
            child: ColoredBox(
              color: Colors.black.withOpacity(0.3),
              child: Center(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 12.w, sigmaY: 12.w),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (final name in config.vipNameAwqStr.split('#'))
                          name.contains('卡')
                              ? Text(name, style: MyTheme.blue80_15)
                              : Text(name, style: MyTheme.white15)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
