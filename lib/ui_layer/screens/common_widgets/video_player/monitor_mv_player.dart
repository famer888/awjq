import 'package:easy_localization/easy_localization.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:universal_html/html.dart' as html;
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../../domain/api_validator.dart';
import '../../../../domain/model/member_model.dart';
import '../../../../domain/model/monitor_model.dart';
import '../../../../domain/remote_domain/domains/monitor.dart';
import '../../../notifiers/home_config_notifier.dart';
import '../../../notifiers/user_notifier.dart';
import '../../../router/routes.dart';
import '../../../utils/my_toast.dart';
import '../../image_paths.dart';
import '../../theme.dart';
import '../current_timer.dart';
import '../dialog/my_dialog.dart';
import '../dialog/widgets/png_dialog.dart';
import '../dialog/widgets/regular_dialog.dart';
import '../my_image.dart';
import 'utils/nvideourl_minxin.dart';

//判断hls.length > 0 直接播放
//hls.length = 0 则判断type值
//type = 1 显示pay_tip 按钮跳转VIP购买
//type = 2 显示pay_tip 按钮金币购买 金币数conis

class MonitorMvPlayer extends StatefulWidget {
  const MonitorMvPlayer({
    super.key,
    required this.info,
    this.isLocal = false,
    this.noBack = false,
    this.needCheckAspectRatio = false,
  });
  final MonitorModel info;
  final bool isLocal;
  final bool noBack;

  /// 显示全屏按钮是否判断视频长宽比
  final bool needCheckAspectRatio;

  @override
  State<MonitorMvPlayer> createState() => _MonitorMvPlayerState();
}

class _MonitorMvPlayerState extends State<MonitorMvPlayer> with NVideoURLMinxin {
  FlickManager? flickManager;

  @override
  void initState() {
    super.initState();
    initURL();
  }

  initURL() async {
    VideoPlayerController? cr = await initController(source240: widget.info.hls ?? '', isLocal: widget.isLocal);
    flickManager = FlickManager(
        videoPlayerController: cr!,
        autoPlay: !kIsWeb,
        onVideoEnd: () {
          flickManager?.flickControlManager?.replay();
          if (mounted) setState(() {});
        });
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    flickManager?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
      flickManager == null
        ? Container()
        : VisibilityDetector(
      key: ObjectKey(flickManager),
      onVisibilityChanged: (visibility) {
        if (visibility.visibleFraction == 0 && mounted) {
          flickManager?.flickControlManager?.autoPause();
        } else if (visibility.visibleFraction == 1) {
          flickManager?.flickControlManager?.autoResume();
        }
      },
      child: FlickVideoPlayer(
        flickManager: flickManager!,
        flickVideoWithControls: FlickVideoWithControls(
          videoFit: BoxFit.contain,
          playerErrorFallback: Container(),
          playerLoadingFallback: Stack(
            children: [
              Positioned.fill(
                child: MyImage.network(
                  widget.info.cover ?? '',
                ),
              ),
              Container(color: Colors.black87),
            ],
          ),
          controls: _SinkPortraitLandWidget(
            isBack: true,
            info: widget.info,
            noBack: widget.noBack,
            needCheckAspectRatio: widget.needCheckAspectRatio,
            shareVp: () {
              const MineWelfareRoute(index: 1).push(context);
            },
            nowToVp: () {
              const VipCenterRoute().push(context);
            },
            nowByKb: () {
              showAlertVp(goby: true);
            },
          ),
        ),
        flickVideoWithControlsFullscreen: FlickVideoWithControls(
          playerErrorFallback: Container(),
          videoFit: BoxFit.contain,
          controls: _SinkPortraitLandWidget(
            info: widget.info,
            noBack: false,
          ),
        ),
      ),
    );
  }

  showAlertVp({bool goby = false}) {
    Member member = context.read<UserNotifier>().member;
    bool isInsufficient = member.money < (widget.info.coins!);
    if (goby && !isInsufficient) {
      byVideoRes(member.money - widget.info.coins!); //直接购买
      return;
    }
    if (widget.info.type == 2) {
      MyDialog.showDialog(
          context: context,
          child: RegularDialog(
            title: tr('ts'),
            cancelText: isInsufficient ? tr('qwcz') : tr('gmgk'),//前往充值 - 立即购买
            buttonText: tr('fxdv'),//做任务得VIP
            confirmOnTap: () {
              const MineWelfareRoute(index: 1).push(context);
            },
            cancelOnTap: () {
              if (isInsufficient) {
                const CoinRechargeRoute().push(context);
              } else {
                byVideoRes(member.money - widget.info.coins!);
              }
            },
            content: DefaultTextStyle(
              style: MyTheme.gray203_13,
              child: Column(
                children: [
                  Text(tr('gmspkwz'), style: MyTheme.gray203_13, maxLines: 3),//金币购买本视频解锁精彩完整版！
                  SizedBox(height: 15.w),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${widget.info.coins}${tr('jb')}',//金币
                          style: MyTheme.blue80_13_M),
                    ],
                  ),
                  SizedBox(height: 15.w),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${tr('kyje')}：${member.money}${tr('jb')}",//可用金币
                          style: MyTheme.gray203_13),
                    ],
                  ),
                ],
              ),
            ),
          ));
    } else {
      MyDialog.showDialog(
          context: context,
          child: PNGDialog(
            title: tr('ts'),//提示
            cancelText: tr('cv'),//充值VI
            buttonText: tr('fxdv'),//做任务得VIP
            cancelOnTap: () {
              const VipCenterRoute().push(context);
            },
            confirmOnTap: () {
              const MineWelfareRoute(index: 1).push(context);
            },
            content: DefaultTextStyle(
              style: MyTheme.gray203_13,
              child: Column(
                children: [
                  Text(tr('gmvkwz'), style: MyTheme.gray203_13),//购买VIP或做任务获取VIP解锁精彩完整版！
                  SizedBox(height: 15.w),
                  Text(
                    context.read<HomeConfigNotifier>().config.tipsShareText ??
                        '',
                    style: MyTheme.gray203_13,
                    maxLines: 3,
                  ),
                ],
              ),
            ),
          ));
    }
  }

  Future byVideoRes(int money) async {
    MyToast.showLoading(text: tr('gmzz'));
    final userNotifier = context.read<UserNotifier>();
    final monitorDomain = context.read<MonitorDomain>();
    final res = await monitorDomain.getMonitorBuy(id: widget.info.id ?? 0);
    MyToast.closeAllLoading();
    if (res.isValid) {
      userNotifier.setMoney(money: money);
      widget.info.hls = res.data['hls'];
      initURL();
    } else {
      MyToast.showText(text: res.msg ?? '');
    }
  }
}

//横屏
class _SinkPortraitLandWidget extends StatefulWidget {
  const _SinkPortraitLandWidget({
    this.isBack = false,
    this.info,
    this.shareVp,
    this.nowToVp,
    this.nowByKb,
    this.needCheckAspectRatio = false,
    required this.noBack,
  });
  final bool isBack;
  final MonitorModel? info;
  final Function? shareVp; //分享得VIP
  final Function? nowToVp; //立即开通
  final Function? nowByKb; //钻石购买
  final bool noBack;

  /// 显示全屏按钮是否判断视频长宽比
  final bool needCheckAspectRatio;
  @override
  State<_SinkPortraitLandWidget> createState() => _SinkPortraitLandWidgetState();
}

class _SinkPortraitLandWidgetState extends State<_SinkPortraitLandWidget> {

  Widget _noConditionWidget(context) {
    FlickVideoManager flickVideoManager =
    Provider.of<FlickVideoManager>(context);
    FlickControlManager controlManager =
    Provider.of<FlickControlManager>(context);
    FlickDisplayManager flickDisplayManager =
    Provider.of<FlickDisplayManager>(context);

    bool flag = (flickVideoManager.videoPlayerValue!.isBuffering &&
        flickVideoManager.videoPlayerValue!.isPlaying) ||
        !flickVideoManager.videoPlayerValue!.isInitialized;

    double rate = flickVideoManager.videoPlayerValue?.aspectRatio ?? 0.0;
    // 获取屏幕方向
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Stack(
      children: [
        Positioned.fill(
          child: FlickShowControlsAction(
            child: FlickSeekVideoAction(
              duration: const Duration(seconds: 60),
              child: Center(
                child: flag && (widget.info?.hls?.length ?? 0) > 0
                    ? Center(
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.grey[400],
                      strokeWidth: 1.5,
                    ),
                  ),
                ) : Container()
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: FlickAutoHideChild(
            child: IgnorePointer(
              child: Container(
                height: 55,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(0, 0, 0, 0.0),
                      Color.fromRGBO(0, 0, 0, 0.1),
                      Color.fromRGBO(0, 0, 0, 0.3),
                      Color.fromRGBO(0, 0, 0, 0.9),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: isPortrait ? 0 : 5.w,
          left: 2.w,
          child: Builder(builder: (context) {
            if (widget.noBack) {
              return const SizedBox.shrink();
            }
            return FlickAutoHideChild(
              child: Row(
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.1),
                            offset: Offset(0, 0),
                            spreadRadius: 5,
                            blurRadius: 5,
                          )
                        ],
                      ),
                      alignment: Alignment.center,
                      child: const MyImage.asset(
                        MyImagePaths.appNavBackWN,
                        width: 18,
                        height: 18,
                        fit: BoxFit.contain,
                      ),
                    ),
                    onTap: () {
                      if (widget.isBack) {
                        context.pop();
                      } else {
                        controlManager.toggleFullscreen();
                      }
                    },
                  ),
                  Text(isPortrait ? '' : (widget.info?.title ?? ''), style: MyTheme.white20medium),
                ],
              ),
            );
          }),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: FlickAutoHideChild(
            child: Row(
              children: [
                SizedBox(width: 105, child: ChinaTimeWidget(textStyle: MyTheme.white11)),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: controlManager.isMute ? const MyImage.asset(
                    MyImagePaths.appIsMute,
                    width: 25,
                    height: 25,
                    fit: BoxFit.contain) : const MyImage.asset(
                      MyImagePaths.appMute,
                      width: 25,
                      height: 25,
                      fit: BoxFit.contain,
                    ),
                  onTap: () {
                    if (controlManager.isMute) {
                      controlManager.unmute();
                    } else {
                      controlManager.mute();
                    }
                    if (mounted) setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: FlickAutoHideChild(
            child: Column(
              children: [
                // GestureDetector(
                //   behavior: HitTestBehavior.translucent,
                //   child: widget.info?.isFavorite == 1 ? const MyImage.asset(
                //       MyImagePaths.appzanSlect,
                //       width: 25,
                //       height: 25,
                //       fit: BoxFit.contain) : const MyImage.asset(
                //     MyImagePaths.appZanNormal,
                //     width: 25,
                //     height: 25,
                //     fit: BoxFit.contain,
                //   ),
                //   onTap: () {
                //     if (widget.info?.isFavorite == 1) {
                //       widget.info?.isFavorite == 0;
                //     } else {
                //       widget.info?.isFavorite == 1;
                //     }
                //     if (mounted) setState(() {});
                //   },
                // ),
                // SizedBox(height: 35.w),
                FlickFullScreenToggle(
                  enterFullScreenChild: const MyImage.asset(
                    MyImagePaths.appFullScreen,
                    width: 25,
                    height: 25,
                    fit: BoxFit.contain,
                  ),
                  exitFullScreenChild: const MyImage.asset(
                    MyImagePaths.appFullScreen,
                    width: 25,
                    height: 25,
                    fit: BoxFit.contain,
                  ),
                  toggleFullscreen: () {
                    if (kIsWeb) {
                      List<html.VideoElement> elements = html
                          .document.querySelectorAll('video');
                      if (elements.isEmpty) return;

                      html.VideoElement video = elements.last;
                      video.muted = false;
                      video.volume = 1;
                      video.setAttribute('playsinline', 'true');
                      video.setAttribute('autoplay', 'true');
                      if (html.document.fullscreenElement ==
                          null) {
                        video.enterFullscreen();
                      } else {
                        html.document.exitFullscreen();
                      }
                    } else {
                      controlManager.toggleFullscreen();
                    }
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

//   Future zanVideoRes(int money) async {
//     final monitorDomain = context.read<MonitorDomain>();
//     final res = await monitorDomain.getMonitorLikeComment(id: widget.info.id ?? 0);
//     if (res.isValid) {
//
//     } else {
//       MyToast.showText(text: res.msg ?? '');
//     }
//   }
// }

  Widget _conditionWidget(BuildContext context) {
    Widget dgt = Container();
    var vflag = false;
    Member user = context.read<UserNotifier>().member;
    if (user.vipLevel < 1 && widget.info?.type == 1) {
      //需要VIP
      dgt = Text(tr('kvbw'), style: MyTheme.white255_14_M, maxLines: 2);//开通VIP或做任务获取VIP解锁精彩完整版！
      vflag = false;
    } else if (widget.info?.type == 2) {
      dgt = DefaultTextStyle(
        style: MyTheme.white255_14_N,
        child: Text.rich(
          TextSpan(children: [
            TextSpan(
                text: '${widget.info?.coins ?? 0}', style: MyTheme.blue80_14_M),
            TextSpan(text: '${tr('jbjsw')}，'),//金币解锁完整版
            TextSpan(text: '${tr('ktvpzk')}${user.money}')//剩余可用金币
          ]),
        ),
      );
      vflag = true;
    }
    return Container(
      color: Colors.black87,
      child: Column(children: [
        Padding(
          padding: EdgeInsets.all(8.w),
          child: Container(
            alignment: Alignment.centerLeft,
            height: 22,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 22,
                  height: 22,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.2),
                          offset: Offset(0, 0),
                          blurRadius: 11)
                    ],
                  ),
                  alignment: Alignment.center,
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    child: const MyImage.asset(
                      MyImagePaths.appNavBackWN,
                      width: 18,
                      height: 18,
                      fit: BoxFit.contain,
                    ),
                    onTap: () {
                      context.pop();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 50,
            right: 50,
          ),
          child: Column(
            children: [
              // Text(widget.info?.payTip ?? '', style: MyTheme.white255_14_M),
              const SizedBox(height: 15),
              dgt,
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  if (vflag) {
                    widget.nowByKb?.call();
                  } else {
                    widget.nowToVp?.call();
                  }
                },
                child: Container(
                  height: 32.w,
                  width: 110.w,
                  decoration: const BoxDecoration(
                    gradient: MyTheme.gradient_90_114,
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                  ),
                  child: Center(
                    child: Text(vflag ? tr('gmgk') : tr('ljkv'),//立即购买 - 立即开通VIP
                        style: MyTheme.white13),
                  ),
                ),
              ),
              const SizedBox(width: 37),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  widget.shareVp?.call();
                },
                child: Container(
                  height: 32,
                  width: 110,
                  decoration: const BoxDecoration(
                    gradient: MyTheme.gradient_90_114,
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                  ),
                  child: Center(
                    child: Text(tr('fxdv'), style: MyTheme.white13),// 做任务得VIP
                  ),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return (widget.info?.hls?.length ?? 0) > 0 ?
    _noConditionWidget(context) : _conditionWidget(context);
  }
}
