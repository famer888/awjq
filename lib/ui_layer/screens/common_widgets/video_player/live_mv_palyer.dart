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
import '../../../../domain/domain.dart';
import '../../../../domain/model/live_model.dart';
import '../../../../domain/model/member_model.dart';
import '../../../../domain/remote_domain/domains/live.dart';
import '../../../notifiers/home_config_notifier.dart';
import '../../../notifiers/user_notifier.dart';
import '../../../router/routes.dart';
import '../../../utils/common_utils.dart';
import '../../../utils/my_toast.dart';
import '../../image_paths.dart';
import '../../theme.dart';
import '../dialog/my_dialog.dart';
import '../dialog/widgets/png_dialog.dart';
import '../dialog/widgets/regular_dialog.dart';
import '../my_image.dart';
import '../player_barrage_widget.dart';
import 'utils/nvideourl_minxin.dart';

//先判断show的值 != “public” 直接显示已下线
//判断hls.length > 0 直接播放
//hls.length = 0 则判断type值
//type = 1 显示pay_tip 按钮跳转VIP购买
//type = 2 显示pay_tip 按钮金币购买 金币数conis

class LiveMvPlayer extends StatefulWidget {
  const LiveMvPlayer({
    super.key,
    required this.info,
    this.isLocal = false,
    this.noBack = false,
    this.needCheckAspectRatio = false,
  });

  final LiveModel info;
  final bool isLocal;
  final bool noBack;

  /// 显示全屏按钮是否判断视频长宽比
  final bool needCheckAspectRatio;

  @override
  State<LiveMvPlayer> createState() => _LiveMvPlayerState();
}

class _LiveMvPlayerState extends State<LiveMvPlayer> with NVideoURLMinxin {
  FlickManager? flickManager;
  String playerStr = '';

  @override
  void initState() {
    super.initState();
    initURL();
  }

  initURL() async {
    if (widget.info.show != 'public') {
      //show的值 != “public” 直接显示已下线
      widget.info.hls = []; //防止以下线用户存有播放链接导致继续播放
    }

    //筛选出高分辨率播放链接播放
    if (widget.info.hls?.isNotEmpty ?? false) {
      // 遍历视频列表，将每个视频信息按优先级存入 Map
      for (HlsModel hls in widget.info.hls!) {
        String label = hls.label;
        if (label.contains('720')) {
          widget.info.hls = [hls];
          break;
        } else if (label.contains('480')) {
          widget.info.hls = [hls];
          break;
        } else if (label.contains('240')) {
          widget.info.hls = [hls];
          break;
        }
      }
      playerStr = widget.info.hls?.first.url ?? '';
    }

    VideoPlayerController? cr =
        await initController(source240: playerStr, isLocal: widget.isLocal);
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
    return flickManager == null
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
            cancelText: isInsufficient ? tr('qwcz') : tr('gmgk'),
            //前往充值 - 立即购买
            buttonText: tr('fxdv'),
            //做任务得VIP
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
                  Text(tr('gmspkwz'), style: MyTheme.gray203_13, maxLines: 3),
                  //金币购买本视频解锁精彩完整版！
                  SizedBox(height: 15.w),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${widget.info.coins}${tr('jb')}', //金币
                          style: MyTheme.blue80_13_M),
                    ],
                  ),
                  SizedBox(height: 15.w),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${tr('kyje')}：${member.money}${tr('jb')}", //可用金币
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
            title: tr('ts'),
            //提示
            cancelText: tr('cv'),
            //充值VI
            buttonText: tr('fxdv'),
            //做任务得VIP
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
                  Text(tr('gmvkwz'), style: MyTheme.gray203_13),
                  //购买VIP或做任务获取VIP解锁精彩完整版！
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
    final liverDomain = context.read<LiveDomain>();
    final res = await liverDomain.getLiveBuy(id: widget.info.id ?? 0);
    MyToast.closeAllLoading();
    if (res.isValid) {
      userNotifier.setMoney(money: money);
      List<HlsModel> hls = res.data['hls'];
      if (hls.isNotEmpty) {
        widget.info.hls = hls;
      }
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
  final LiveModel? info;
  final Function? shareVp; //分享得VIP
  final Function? nowToVp; //立即开通
  final Function? nowByKb; //钻石购买
  final bool noBack;

  /// 显示全屏按钮是否判断视频长宽比
  final bool needCheckAspectRatio;

  @override
  State<_SinkPortraitLandWidget> createState() =>
      _SinkPortraitLandWidgetState();
}

class _SinkPortraitLandWidgetState extends State<_SinkPortraitLandWidget> {
  final TextEditingController _textFieldController = TextEditingController();

  final FocusNode _focusNode = FocusNode();

  void _hideKeyboard(BuildContext context) {
    _textFieldController.text = '';
    _focusNode.unfocus();
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

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
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

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
                        )
                      : Container()),
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
            top: MediaQuery.of(context).padding.top + 11.w,
            right: 10.w,
            child: FlickAutoHideChild(
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 7, top: 0.5),
                    padding: const EdgeInsets.only(top: 2.5, left: 16, right: 6),
                    height: 18,
                    decoration: const BoxDecoration(
                      color: MyTheme.blackColor25505,
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                    ),
                    child: Text(
                        '${CommonUtils.renderEnFixedNumber(widget.info?.viewFct ?? 0)}${'gk'.tr()}',
                        style: MyTheme.white09_10),
                  ),
                  const MyImage.asset(
                    MyImagePaths.appHots,
                    height: 19,
                    width: 19,
                  )
                ],
              ),
            )),
        Positioned(
          top: 0,
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
                      _hideKeyboard(context);
                      if (widget.isBack) {
                        context.pop();
                      } else {
                        controlManager.toggleFullscreen();
                      }
                    },
                  ),
                  Text(isPortrait ? '' : (widget.info?.username ?? ''),
                      style: MyTheme.white20medium),
                ],
              ),
            );
          }),
        ),
        Positioned(
          bottom: 10.w,
          left: 13.w,
          child: FlickAutoHideChild(child: _danMuWidget(context)),
        ),
        Positioned(
          bottom: 10.w,
          right: 10.w,
          child: FlickAutoHideChild(
            child: Row(
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: const MyImage.asset(MyImagePaths.appDaSan,
                      width: 60, height: 25, fit: BoxFit.contain),
                  onTap: () {
                    _hideKeyboard(context);
                    if (widget.isBack) {
                      showDaSanDialog();
                    } else {
                      MyToast.showText(text: '回详情页操作');
                    }
                  },
                ),
                SizedBox(width: 10.w),
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
                    _hideKeyboard(context);
                    if (kIsWeb) {
                      List<html.VideoElement> elements =
                          html.document.querySelectorAll('video');
                      if (elements.isEmpty) return;

                      html.VideoElement video = elements.last;
                      video.muted = false;
                      video.volume = 1;
                      video.setAttribute('playsinline', 'true');
                      video.setAttribute('autoplay', 'true');
                      if (html.document.fullscreenElement == null) {
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
        ),
        Positioned.fill(
            child: FlickAutoHideChild(
              child: FutureBuilder<bool>(
                future: getIsbarrage(),
                builder: (context, snapshot) {
                  bool isBarrage = snapshot.data ?? false;
                  return isBarrage ? PlayerBarrageWidget(
                    dataList: [
                      CommentItemModel(comment: '牛逼'),
                      CommentItemModel(comment: '厉害'),
                      CommentItemModel(comment: '超级你比'),
                      CommentItemModel(comment: '好好好'),
                    ],
                    isOpen: true,
                  ) : Container();
                },
              ),
            ))
      ],
    );
  }

  //打赏
  showDaSanDialog({bool goby = false}) {
    Member member = context.read<UserNotifier>().member;
    bool isInsufficient = member.money < (widget.info?.coins ?? 0);

    MyDialog.showDialog(
        context: context,
        child: RegularDialog(
          title: tr('ts'),
          cancelText: isInsufficient ? tr('qwcz') : tr('gmgk'),
          //前往充值 - 立即购买
          buttonText: tr('fxdv'),
          //做任务得VIP
          confirmOnTap: () {
            const MineWelfareRoute(index: 1).push(context);
          },
          cancelOnTap: () {
            // if (isInsufficient) {
            //   const CoinRechargeRoute().push(context);
            // } else {
            //   byVideoRes(member.money - widget.info.coins!);
            // }
          },
          content: DefaultTextStyle(
            style: MyTheme.gray203_13,
            child: Column(
              children: [
                Text(tr('gmspkwz'), style: MyTheme.gray203_13, maxLines: 3),
                //金币购买本视频解锁精彩完整版！
                SizedBox(height: 15.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${widget.info?.coins}${tr('jb')}', //金币
                        style: MyTheme.blue80_13_M),
                  ],
                ),
                SizedBox(height: 15.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${tr('kyje')}：${member.money}${tr('jb')}", //可用金币
                        style: MyTheme.gray203_13),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  //获取弹幕开关状态
  Future<bool> getIsbarrage() async {
    final cacheDomain = context.read<CacheDomain>();
    try {
      bool isBarrage = await cacheDomain.readIsBarrage();
      return isBarrage;
    } catch (e) {
      return false; // 返回默认值
    }
  }

  //弹幕相关
  Widget _danMuWidget(BuildContext context) {
    return FutureBuilder<bool>(
        future: getIsbarrage(), // 获取弹幕开关状态的 Future
        builder: (context, snapshot) {
          bool isBarrage = snapshot.data ?? false;
          return Row(children: [
            Container(
              height: 28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: MyTheme.white02Color,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const MyImage.asset(MyImagePaths.appCommentWhite,
                      width: 25, height: 25),
                  Container(
                    alignment: Alignment.center,
                    width: 60,
                    height: 28,
                    child: TextField(
                      style: const TextStyle(
                          color: MyTheme.white08Color,
                          fontSize: 12,
                          overflow: TextOverflow.ellipsis,
                          decoration: TextDecoration.none),
                      controller: _textFieldController,
                      focusNode: _focusNode,
                      decoration: InputDecoration(
                        isCollapsed: true,
                        hintText: tr('ftdm'),
                        hintStyle: const TextStyle(
                            color: MyTheme.white08Color,
                            fontSize: 12,
                            overflow: TextOverflow.ellipsis,
                            decoration: TextDecoration.none),
                        contentPadding: EdgeInsets.zero,
                        // 确保内容填充足够
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0, right: 5),
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      child: Container(
                        alignment: Alignment.center,
                        height: 18,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          gradient: MyTheme.gradient_90_114,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(tr('fas'), style: MyTheme.white08_12),
                        ),
                      ),
                      onTap: () {
                        //发送弹幕
                        _hideKeyboard(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              child: isBarrage ? const MyImage.asset(MyImagePaths.appOnDanmu,
                  width: 25, height: 25, fit: BoxFit.contain) : const MyImage.asset(MyImagePaths.appOffDanmu,
                  width: 25, height: 25, fit: BoxFit.contain),
              onTap: () {
                //弹幕开关
                final cacheDomain = context.read<CacheDomain>();
                if (isBarrage) {
                  cacheDomain.upsertIsBarrage(false);
                } else {
                  cacheDomain.upsertIsBarrage(true);
                }
                if (mounted) setState(() {});
              },
            ),
            const SizedBox(width: 3),
            Text(tr('dmkg'), style: MyTheme.white12),
          ]);
        });

  }

  Widget _conditionWidget(BuildContext context) {
    Widget dgt = Container();
    var vflag = false;
    Member user = context.read<UserNotifier>().member;
    if (widget.info?.show != 'public') {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Center(child: Text(tr('yhyxx'), style: MyTheme.white255_14_M)),
      );
    } else if (user.vipLevel < 1 && widget.info?.type == 1) {
      //需要VIP
      dgt = Text(tr('kvbw'),
          style: MyTheme.white255_14_M, maxLines: 2); //开通VIP或做任务获取VIP解锁精彩完整版！
      vflag = false;
    } else if (widget.info?.type == 2) {
      dgt = DefaultTextStyle(
        style: MyTheme.white255_14_N,
        child: Text.rich(
          TextSpan(children: [
            TextSpan(
                text: '${widget.info?.coins ?? 0}', style: MyTheme.blue80_14_M),
            TextSpan(text: '${tr('jbjsw')}，'), //金币解锁完整版
            TextSpan(text: '${tr('ktvpzk')}${user.money}') //剩余可用金币
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
                    child:
                        Text(vflag ? tr('gmgk') : tr('ljkv'), //立即购买 - 立即开通VIP
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
                    child: Text(tr('fxdv'), style: MyTheme.white13), // 做任务得VIP
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
    return (widget.info?.hls?.isNotEmpty ?? false)
        ? _noConditionWidget(context)
        : _conditionWidget(context);
  }
}
