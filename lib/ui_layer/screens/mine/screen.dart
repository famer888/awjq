import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../domain/type_def.dart';
import '../../../domain/enum.dart';
import '../../../domain/model/member_model.dart';
import '../../notifiers/home_config_notifier.dart';
import '../../notifiers/user_notifier.dart';
import '../../router/routes.dart';
import '../common_widgets/member_vip.dart';
import '../common_widgets/my_avatar.dart';
import '../common_widgets/my_image.dart';
import '../common_widgets/my_list_view.dart';
import '../common_widgets/screen_background.dart';
import '../image_paths.dart';
import '../theme.dart';
import 'ai_record/screen.dart';

class MineScreen extends StatefulWidget {
  const MineScreen({super.key});

  @override
  State<MineScreen> createState() => _MineScreenState();
}

class _MineScreenState extends State<MineScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
        child: Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: 1.sw * 228 / 380,
              child: const MyImage.asset(
                MyImagePaths.appWdTopbgN,
                fit: BoxFit.fill,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
            Column(
              children: [
                const _FixedTopArea(),
                Expanded(
                  child: CustomScrollView(
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    slivers: [
                      MyIndicator(onRefresh: () async {
                        await context.read<UserNotifier>().init();
                      }),
                      const SliverToBoxAdapter(
                        child: _Body(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}

class _FixedTopArea extends StatelessWidget {
  const _FixedTopArea();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 13, bottom: 11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const _SystemNoticeIcon(),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: () => const MineSetupRoute().push(context),
            child: const MyImage.asset(
              MyImagePaths.appMineSetting,
              width: 25,
              fit: BoxFit.fitWidth,
            ),
          )
        ],
      ),
    );
  }
}

class _SystemNoticeIcon extends StatelessWidget {
  const _SystemNoticeIcon();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        const MessageCenterRoute().push(context);
      },
      child: Selector<UserNotifier, bool>(
          selector: (_, notifier) => (notifier.systemNotice != null &&
              (notifier.systemNotice?.systemNoticeCount != 0 ||
                  notifier.systemNotice?.feedCount != 0)),
          builder: (context, value, _) {
            return value
                ? const MyImage.asset(
                    MyImagePaths.appMineMessageHighlight,
                    width: 25,
                    fit: BoxFit.fitWidth,
                  )
                : const MyImage.asset(
                    MyImagePaths.appMineMessage,
                    width: 25,
                    fit: BoxFit.fitWidth,
                  );
          }),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _HeaderInfo(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 13),
          child: const Column(
            children: [
              SizedBox(height: 20),
              _VIPCenter(),
              SizedBox(height: 15),
              _FirstMenu(),
              SizedBox(height: 15),
              _SecondMenu(),
              SizedBox(height: 15),
              _ThirdMenu(),
              SizedBox(height: 15),
            ],
          ),
        ),
      ],
    );
  }
}

class _HeaderInfo extends StatelessWidget {
  const _HeaderInfo();

  @override
  Widget build(BuildContext context) {
    return Selector<UserNotifier, Member>(
      selector: (_, config) => config.member,
      builder: (context, member, child) => Padding(
        padding: EdgeInsets.only(left: 13),
        child: Row(
          children: [
            MyAvatar(
              thumb: member.thumb,
              margin: 2,
              size: 56,
            ),
            const SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      member.nickname,
                      style: MyTheme.white18bold,
                    ),
                    const SizedBox(width: 3),
                    if (member.agent == 1)
                      const Icon(
                        Icons.verified_sharp,
                        size: 17,
                        color: Color.fromRGBO(247, 208, 93, 1),
                      ),
                  ],
                ),
                const SizedBox(height: 9.5),
                Row(
                  children: [
                    if (member.vipLevel.isVip())
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: MemberVipWidget(
                          showText: member.vipStr,
                        ),
                      ),
                    Text(
                      'ID: ${member.aff ?? '0000000'}',
                      style: MyTheme.gray95_12,
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Selector<UserNotifier, MyTokenStatus?>(
              selector: (_, userNotifier) => userNotifier.tokenStatus,
              builder: (context, tokenStatus, child) => tokenStatus ==
                      MyTokenStatus.valid
                  ? const SizedBox.shrink()
                  : GestureDetector(
                      onTap: () => const LoginRoute().push(context),
                      child: Container(
                        width: 70,
                        height: 32,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(35, 38, 46, 1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            bottomLeft: Radius.circular(16),
                          ),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                tr('dl'),
                                style: const TextStyle(
                                  color: Color.fromRGBO(200, 198, 248, 1),
                                  fontSize: 14,
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 14,
                                color: const Color.fromRGBO(200, 198, 248, 1),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}

class _VIPCenter extends StatefulWidget {
  const _VIPCenter();

  @override
  State<_VIPCenter> createState() => _VIPCenterState();
}

class _VIPCenterState extends State<_VIPCenter> {
  late final config = context.read<HomeConfigNotifier>().config;

  /// 当前日期
  String time = DateFormat('yyyy-MM-dd').format(DateTime.now());

  /// 取得副标题
  String getSubTitle({String? expiredAt, required bool isVIP}) {
    if (isVIP) {
      String expiredDate = expiredAt?.split(' ')[0] ?? '';
      if (expiredDate.isEmpty) {
        return tr('fhy');
      } else {
        return (expiredDate == time) ? tr('fhy') : expiredDate + tr('dq');
      }
    } else {
      return tr('fhy');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => const VipCenterRoute().push(context),
        child: Stack(
          children: [
            const Positioned.fill(
              child: MyImage.asset(
                MyImagePaths.appVipBannerBackground,
                fit: BoxFit.fill,
              ),
            ),
            Positioned.fill(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 13),
                child: Selector<UserNotifier, Member>(
                  selector: (_, userNotifier) => userNotifier.member,
                  builder: (context, member, child) {
                    final subTitle = getSubTitle(
                        expiredAt: member.expiredAt,
                        isVIP: member.vipLevel.isVip());

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          config.tipsShareText ??
                              'cgyqsqt'.tr(context: context),
                          style: const TextStyle(
                            color: Color.fromRGBO(200, 198, 248, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              member.vipStr,
                              style: const TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1.0),
                                fontSize: 12,
                              ),
                              maxLines: 1,
                            ),
                            Text(
                              subTitle,
                              style: const TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1.0),
                                fontSize: 12,
                              ),
                              maxLines: 1,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "${'syxzcs'.tr(context: context)}${member.videoDownloadValue}",
                              style: const TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1.0),
                                fontSize: 12,
                              ),
                              maxLines: 1,
                            ),
                          ],
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FirstMenu extends StatelessWidget {
  const _FirstMenu();

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      addAutomaticKeepAlives: false,
      addRepaintBoundaries: false,
      children: [
        Selector<UserNotifier, int>(
            selector: (_, config) => config.member.money,
            builder: (context, money, child) {
              return _FirstMenuCard(
                backgroundImg: MyImagePaths.appMineCoinChargeBackground,
                title: 'jbcz'.tr(context: context),
                subTitle: "${'dqye'.tr(context: context)} $money",
                onTap: () => const CoinRechargeRoute().push(context),
              );
            }),
        _FirstMenuCard(
          backgroundImg: MyImagePaths.appMineShareBackground,
          title: 'fxyqlhb'.tr(context: context),
          subTitle: 'yqhydvp'.tr(context: context),
          onTap: () => const MineShareToUserRoute().push(context),
        ),
        _FirstMenuCard(
          backgroundImg: MyImagePaths.appMineWelfareBackground,
          title: 'jbgm'.tr(context: context),
          subTitle: 'ye'.tr(context: context),
          onTap: () => const MineWelfareRoute().push(context),
        ),
      ],
    );
  }
}

class _FirstMenuCard extends StatelessWidget {
  const _FirstMenuCard({
    required this.onTap,
    required this.title,
    required this.subTitle,
    required this.backgroundImg,
  });
  final VoidCallback onTap;
  final String title;
  final String subTitle;
  final String backgroundImg;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Stack(
        children: [
          MyImage.asset(
            backgroundImg,
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color.fromRGBO(200, 198, 248, 1),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subTitle,
                  style: const TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1.0),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _SecondMenu extends StatelessWidget {
  const _SecondMenu();

  @override
  Widget build(BuildContext context) {
    final menu = [
      (
        title: 'wdtz'.tr(context: context),
        iconName: MyImagePaths.appMinePost,
        onTap: () => const MinePostRoute().push(context),
      ),
      (
        title: 'wdsc'.tr(context: context),
        iconName: MyImagePaths.appMineCollect,
        onTap: () => const MineCollectionRoute().push(context),
      ),
      (
        title: 'wdgz'.tr(context: context),
        iconName: MyImagePaths.appMineFansFollow,
        onTap: () => const MineFollowingRoute().push(context),
      ),
      (
        title: 'ycrz'.tr(context: context),
        iconName: MyImagePaths.appMineOriginalEnter,
        onTap: () => const OriginalEnterRoute().push(context),
      ),
    ];

    return Container(
        height: 72,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 0.03),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        padding: EdgeInsets.symmetric(horizontal: 13),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (final data in menu)
              GestureDetector(
                onTap: data.onTap,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MyImage.asset(
                      data.iconName,
                      width: 30,
                      height: 26,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      data.title,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(255, 255, 255, 1.0),
                      ),
                    )
                  ],
                ),
              )
          ],
        ));
  }
}

class _ThirdMenu extends StatelessWidget {
  const _ThirdMenu();

  @override
  Widget build(BuildContext context) {
    final menu = [
      (
      title: 'tyhl'.tr(context: context),
      iconName: MyImagePaths.appMineAI,
      onTap: () => const MineAIRecordRoute().push(context),
      ),
      (
        title: 'wdgm'.tr(context: context),
        iconName: MyImagePaths.appMineBuy,
        onTap: () => const MineBuyRoute().push(context),
      ),
      (
        title: 'zxhc'.tr(context: context),
        iconName: MyImagePaths.appMineDownload,
        onTap: () => const MineDownloadRoute().push(context),
      ),
      (
        title: 'txyqm'.tr(context: context),
        iconName: MyImagePaths.appMineInvitedCode,
        onTap: () =>
            MineFillCodeRoute('yqm'.tr(context: context)).push(context),
      ),
      (
        title: 'txdhm'.tr(context: context),
        iconName: MyImagePaths.appMineRedeemCode,
        onTap: () =>
            MineFillCodeRoute('dhm'.tr(context: context)).push(context),
      ),
      (
        title: 'cjwt'.tr(context: context),
        iconName: MyImagePaths.appMineHelp,
        onTap: () => const MineHelpRoute().push(context),
      ),
      (
        title: 'gfjlq'.tr(context: context),
        iconName: MyImagePaths.appMineGroup,
        onTap: () => const MineOfficialGroupRoute().push(context),
      ),
    ];
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 27.5, vertical: 10),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(21, 21, 42, 1),
              Color.fromRGBO(11, 11, 33, 1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          addAutomaticKeepAlives: false,
          addRepaintBoundaries: false,
          children: [
            for (final data in menu)
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: data.onTap,
                child: SizedBox(
                  height: 44,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MyImage.asset(
                            data.iconName,
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(width: 9.5),
                          Text(
                            data.title,
                            overflow: TextOverflow.ellipsis,
                            style: MyTheme.white14w400,
                          ),
                        ],
                      ),
                      const MyImage.asset(
                        MyImagePaths.appMineRightArrow,
                        width: 10,
                        height: 10,
                      )
                    ],
                  ),
                ),
              )
          ],
        ));
  }
}
