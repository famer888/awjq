import 'package:bot_toast/bot_toast.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:awjq/base/baseWidget.dart';
import 'package:awjq/components/common/pullrefreshlist.dart';
import 'package:awjq/components/page_status.dart';
import 'package:awjq/components/yy_dialog.dart';
import 'package:awjq/global.dart';
import 'package:awjq/pages/community/community_bit_post_review.dart';
import 'package:awjq/routers.dart';
import 'package:awjq/store/homeConfig.dart';
import 'package:awjq/theme/default.dart';
import 'package:awjq/utils/api.dart';
import 'package:awjq/utils/common.dart';
import 'package:awjq/utils/extensionlibrary.dart';
import 'package:awjq/utils/input_box_comment.dart';
import 'package:awjq/utils/networkImage.dart';

class CommunityBitPostDetail extends BaseWidget {
  CommunityBitPostDetail({Key key, this.id}) : super(key: key);
  final String id;

  @override
  State<StatefulWidget> cState() {
    // TODO: implement cState
    return _CommunityBitPostDetailState();
  }
}

class _CommunityBitPostDetailState
    extends BaseWidgetState<CommunityBitPostDetail> {
  int page = 1;
  bool noMore = false;
  bool networkErr = false;
  bool isHud = true;
  List<dynamic> reviewData = [];
  dynamic detailData;
  double ch = 130;
  final txtcontroller = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final FocusNode xcfocusNode = FocusNode();
  String tip = CommonUtils.txt("wyddxf");
  String postid = "0";
  String commid = "0";
  bool isReplay = false;

  ImageSourceMatcher classAndIdMatcher() =>
      (attributes, element) => attributes["src"] != null;

  ImageRender classAndIdRender() => (context, attributes, element) {
        double width = ScreenUtil().screenWidth - GQStyle.pagePadding * 2;
        double w = double.parse(attributes["width"] ?? "${width}");
        double h = double.parse(attributes["height"] ?? "${width / 2}");
        return Container(
          height: width / w * h,
          width: w > width ? width : w,
          child: PlatformAwareNetworkImage(url: attributes["src"] ?? ""),
        );
      };

  _resetXcfocusNode() {
    isReplay = false;
    tip = CommonUtils.txt("wyddxf");
    xcfocusNode.unfocus();
  }

  //加载详情
  _getData() {
    bitTopicDetail(id: widget.id).then((res) {
      if (res.data == null) {
        networkErr = true;
        setState(() {});
        return;
      }
      if (res.status == 1) {
        detailData = res.data;
        _getReviewData();
      } else {
        CommonUtils.showText(res.msg);
        context.pop();
      }
    });
  }

  //加载评论
  _getReviewData({bool isShow = false}) {
    bitPostComments(id: widget.id, page: page).then((res) {
      if (isShow) BotToast.closeAllLoading();
      if (res.data == null) {
        CommonUtils.showText(res.msg);
        return;
      }
      List st = res.data;
      if (page == 1) {
        noMore = false;
        reviewData = st;
      } else if (st.length > 0) {
        reviewData.addAll(st);
      } else {
        noMore = true;
      }
      isHud = false;
      setState(() {});
    });
  }

  @override
  void onCreate() {
    // TODO: implement onCreate
    setAppTitle(title: CommonUtils.txt("zyxq"));
    _getData();
  }

  @override
  void didUpdateWidget(covariant CommunityBitPostDetail oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (MediaQuery.of(context).viewInsets.bottom == 0) {
        _resetXcfocusNode();
      } else {}
    });
  }

  @override
  void onDestroy() {
    // TODO: implement onDestroy
    _countCollect.dispose();
    _countFocus.dispose();
    _countLike.dispose();
  }

  @override
  Widget pageBody(BuildContext context) {
    // TODO: implement pageBody
    return isHud
        ? PageStatus.loading(mounted)
        : InputCommentBox(
            focusNode: xcfocusNode,
            onEditingCompleteText: (value) {
              if (isReplay) {
                _inputTxt(postid, commid, value);
                isReplay = false;
                tip = CommonUtils.txt("wyddxf");
              } else {
                _inputTxt(detailData["id"].toString(), "0", value);
              }
            },
            labelText: tip,
            child: PullRefreshList(
              isAll: noMore,
              onRefresh: () {
                page = 1;
                _getData();
              },
              onLoading: () {
                page++;
                _getReviewData();
              },
              child: SingleChildScrollView(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    _resetXcfocusNode();
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15.w),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: GQStyle.pagePadding),
                        child: Text(
                          CommonUtils.convertEmojiAndHtml(
                              detailData["title"] ?? ""),
                          style: GQStyle.white18semibold,
                          maxLines: AppGlobal.maxLines,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 10.w),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: GQStyle.pagePadding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                "${CommonUtils.renderFixedNumber(detailData["fake_view_ct"] ?? 0)}${CommonUtils.txt("llan")}",
                                style: TextStyle(
                                    color: Colors.white54, fontSize: 12.sp)),
                            Text(
                                "发布时间：${RelativeDateFormat.format(DateTime.parse(detailData["created_at"] ?? ""))}",
                                style: TextStyle(
                                    color: Colors.white54, fontSize: 12.sp))
                          ],
                        ),
                      ),
                      SizedBox(height: 10.w),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: GQStyle.pagePadding),
                        height: ScreenUtil().setWidth(0.5),
                        color: Color.fromRGBO(218, 218, 218, 0.05),
                      ),
                      Builder(builder: (cx) {
                        List tps = List.from(detailData['medias']);
                        return tps.isEmpty
                            ? Container()
                            : ListView.builder(
                                padding: EdgeInsets.symmetric(
                                    horizontal: GQStyle.pagePadding,
                                    vertical: 10.w),
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: tps.length,
                                itemBuilder: (ctx, index) {
                                  dynamic e = tps[index];
                                  if (e['type'] == 2) {
                                    e["unlock_coins"] =
                                        detailData["unlock_coins"];
                                  }
                                  CommonUtils.debugPrint(e);
                                  double width = ScreenUtil().screenWidth -
                                      GQStyle.pagePadding * 2;
                                  double w = (e["thumb_width"] == 0 ||
                                              e["thumb_width"] == null
                                          ? width
                                          : e["thumb_width"])
                                      .toDouble();
                                  double h = (e["thumb_height"] == 0 ||
                                              e["thumb_height"] == null
                                          ? width / 2
                                          : e["thumb_height"])
                                      .toDouble();
                                  width = w > width ? width : w;
                                  return e['type'] == 1
                                      ? Container(
                                          alignment: Alignment.center,
                                          child: SizedBox(
                                            width: width,
                                            height: width / w * h,
                                            child: GestureDetector(
                                              behavior:
                                                  HitTestBehavior.translucent,
                                              onTap: () {
                                                AppGlobal.picMap = {
                                                  'resources': tps,
                                                  'index': index
                                                };
                                                context.push('/picview');
                                              },
                                              child: PlatformAwareNetworkImage(
                                                  background:
                                                      Colors.transparent,
                                                  fit: BoxFit.contain,
                                                  noVisibilityDetector: true,
                                                  url: CommonUtils.getThumb(
                                                      tps[index])),
                                            ),
                                          ),
                                        )
                                      : Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 10.w),
                                            RichText(
                                                text: TextSpan(children: [
                                              (detailData['unlock_coins'] ??
                                                          0) >
                                                      0
                                                  ? TextSpan(
                                                      text:
                                                          "${detailData['unlock_coins']}${CommonUtils.txt('jbjsgk')}:",
                                                      style: TextStyle(
                                                          color: GQStyle
                                                              .blueColor81_151_241,
                                                          fontSize: 14.sp))
                                                  : TextSpan(
                                                      text: CommonUtils.txt(
                                                              'shp') +
                                                          ":",
                                                      style: TextStyle(
                                                          color: Colors.white70,
                                                          fontSize: 14.sp))
                                            ])),
                                            SizedBox(height: 5.w),
                                            SizedBox(
                                              width: ScreenUtil().screenWidth -
                                                  GQStyle.pagePadding * 2,
                                              height: (ScreenUtil()
                                                          .screenWidth -
                                                      GQStyle.pagePadding * 2) /
                                                  16 *
                                                  9,
                                              child: GestureDetector(
                                                behavior:
                                                    HitTestBehavior.translucent,
                                                onTap: () {
                                                  AppGlobal.picMap = {
                                                    'resources': tps,
                                                    'index': index
                                                  };
                                                  context.push('/picview');
                                                },
                                                child: Stack(
                                                  children: [
                                                    PlatformAwareNetworkImage(
                                                      background:
                                                          Colors.transparent,
                                                      url: e["cover"],
                                                      fit: BoxFit.cover,
                                                    ),
                                                    Center(
                                                        child: LImage(
                                                            'v_play_n',
                                                            width: 40,
                                                            height: 40))
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        );
                                });
                      }),
                      Padding(
                        padding: EdgeInsets.only(
                            left: GQStyle.pagePadding,
                            right: GQStyle.pagePadding,
                            top: 10.w),
                        child: (detailData["content"] ?? "").isEmpty
                            ? Container()
                            : RichText(
                                text: TextSpan(
                                  text: detailData["content"] ?? "",
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 14.sp),
                                ),
                              ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: GQStyle.pagePadding,
                            right: GQStyle.pagePadding,
                            top: 10.w),
                        child: _limitWidget(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: GQStyle.pagePadding,
                          right: GQStyle.pagePadding,
                          top: 30.w,
                          bottom: 10.w,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                _resetXcfocusNode();
                                bitTopicLike(id: detailData["id"].toString())
                                    .then((res) {
                                  if (res.status == 1) {
                                    detailData["is_like"] =
                                        detailData["is_like"] == 1 ? 0 : 1;
                                    _countLike.value = detailData["is_like"];
                                  } else {
                                    CommonUtils.showText(res.msg);
                                  }
                                });
                              },
                              child: ValueListenableBuilder<int>(
                                builder: _buildWithLike,
                                valueListenable: _countLike,
                              ),
                            ),
                            SizedBox(width: 20.w),
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                _resetXcfocusNode();
                                bitTopicFavorite(
                                        id: detailData["id"].toString())
                                    .then((res) {
                                  if (res.status == 1) {
                                    detailData["is_favorite"] =
                                        detailData["is_favorite"] == 1 ? 0 : 1;
                                    _countCollect.value =
                                        detailData["is_favorite"];
                                  } else {
                                    CommonUtils.showText(res.msg);
                                  }
                                });
                              },
                              child: ValueListenableBuilder<int>(
                                builder: _buildWithCollect,
                                valueListenable: _countCollect,
                              ),
                            ),
                            SizedBox(width: 20.w),
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                _resetXcfocusNode();
                                context.push(CommonUtils.getRealHash(
                                    'kwantsharetousers'));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  LImage(
                                    "comic_share_c",
                                    width: ScreenUtil().setWidth(18),
                                    height: ScreenUtil().setWidth(18),
                                  ),
                                  SizedBox(width: ScreenUtil().setWidth(2)),
                                  Text(
                                    CommonUtils.txt("fx"),
                                    style: GQStyle.gray190_12,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: GQStyle.pagePadding),
                        height: ScreenUtil().setWidth(0.5),
                        color: Color.fromRGBO(218, 218, 218, 0.05),
                      ),
                      SizedBox(height: 20.w),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: GQStyle.pagePadding),
                        child: Row(
                          children: [
                            Text(CommonUtils.txt("pl"),
                                style: GQStyle.white255_18_M),
                            Text(
                                "（${detailData["comment_num"] ?? 0}${CommonUtils.txt("taoi")}）",
                                style: GQStyle.white255_13),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: GQStyle.pagePadding),
                        child: reviewData.length == 0
                            ? PageStatus.noData()
                            : ListView.builder(
                                padding: EdgeInsets.symmetric(
                                  vertical: ScreenUtil().setWidth(5),
                                ),
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: reviewData.length,
                                itemBuilder: (context, index) {
                                  return CommunityBitPostReview(
                                    data: reviewData[index],
                                    replyCall: (dp, pid, cmid) {
                                      isReplay = true;
                                      tip = dp;
                                      postid = pid;
                                      commid = cmid;
                                      xcfocusNode.requestFocus();
                                      setState(() {});
                                    },
                                    resetCall: () {
                                      _resetXcfocusNode();
                                    },
                                  );
                                }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  _inputTxt(
    String post_id,
    String comment_id,
    String value,
  ) {
    if (AppGlobal.vipLevel > 0 || true) {
      if (value == null) return;
      if (value.length == 0) {
        CommonUtils.showText(CommonUtils.txt("qsrnr"));
        return;
      }
      initLoadGIF(tip: CommonUtils.txt("fbioz"));
      bitPostComment(post_id: post_id, comment_id: comment_id, content: value)
          .then((res) {
        BotToast.closeAllLoading();
        if (res.status == 1) {
          CommonUtils.showText(res.msg);
        } else {
          CommonUtils.showText(res.msg);
        }
      });
    } else {
      YyShowDialog.showdialog(
        context,
        title: CommonUtils.txt("ts"),
        content: (setDialogState) {
          return Text(
            CommonUtils.txt("ktvpfpl"),
            style: GQStyle.gray203_13,
          );
        },
        cancelText: CommonUtils.txt("qx"),
        btnText: CommonUtils.txt("ljkt"),
        callBack: () {
          context.push('/${Routes.vip}');
        },
      );
    }
  }

  //处理局部刷新
  final ValueNotifier<int> _countLike = ValueNotifier<int>(0);
  Widget _buildWithLike(BuildContext context, int value, Widget child) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LImage(
          detailData["is_like"] == 1 ? "comic_thunbup_s" : "comic_thunbup_n",
          width: ScreenUtil().setWidth(18),
          height: ScreenUtil().setWidth(18),
        ),
        SizedBox(width: ScreenUtil().setWidth(2)),
        Text(
          detailData["is_like"] == 1
              ? CommonUtils.txt("ydz")
              : CommonUtils.txt("dz"),
          style: GQStyle.gray190_12,
        ),
        SizedBox(width: ScreenUtil().setWidth(15)),
      ],
    );
  }

  final ValueNotifier<int> _countCollect = ValueNotifier<int>(0);
  Widget _buildWithCollect(BuildContext context, int value, Widget child) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LImage(
          detailData["is_favorite"] == 1
              ? "comic_collect_s"
              : "comic_collect_n",
          width: ScreenUtil().setWidth(18.7),
          height: ScreenUtil().setWidth(18.7),
        ),
        SizedBox(width: ScreenUtil().setWidth(2)),
        Text(
          detailData["is_favorite"] == 1
              ? CommonUtils.txt("ysc")
              : CommonUtils.txt("sc"),
          style: GQStyle.gray190_12,
        ),
        SizedBox(width: ScreenUtil().setWidth(15)),
      ],
    );
  }

  final ValueNotifier<int> _countFocus = ValueNotifier<int>(0);
  Widget _buildWithFocus(BuildContext context, int value, Widget child) {
    return Container(
      height: 28.w,
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: ShapeDecoration(
        color: detailData["user"]["is_follow"] == 1
            ? Colors.white.withOpacity(0.04)
            : Color(0x19EBAE36),
        shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 1,
              color: detailData["user"]["is_follow"] == 1
                  ? Colors.transparent
                  : Color(0x99EBAE36)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Center(
        child: Row(
          children: [
            detailData["user"]["is_follow"] == 1
                ? const SizedBox.shrink()
                : Row(
                    children: [
                      LImage(
                        "2024_sq_gz",
                        width: 16.w,
                        height: 16.w,
                      ),
                      SizedBox(
                        width: 2.w,
                      )
                    ],
                  ),
            Text(
              detailData["user"]["is_follow"] == 1
                  ? CommonUtils.txt("ygz")
                  : CommonUtils.txt("gz"),
              style: detailData["user"]["is_follow"] == 1
                  ? GQStyle.white11
                  : GQStyle.blue80_11,
            )
          ],
        ),
      ),
    );
  }

  _limitWidget() {
    if (detailData["link"].isEmpty && detailData["type"] == 1) {
      String seed_vip_tip =
          Provider.of<HomeConfig>(context, listen: false).config.seed_vip_tip;
      return Column(
        children: [
          Container(
            height: 75.w,
            decoration: DottedDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4.w)),
                shape: Shape.box,
                color: GQStyle.cyanColor00edfd,
                strokeWidth: 1.w),
            alignment: Alignment.center,
            child:
                Text(CommonUtils.txt('nrycjsck'), style: GQStyle.blue80_14_M),
          ),
          SizedBox(height: 10.w),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              context.push("/vip");
            },
            child: Container(
              height: 40.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  gradient: GQStyle.gradient_90_114,
                  borderRadius: BorderRadius.all(Radius.circular(4.w))),
              child: Text(seed_vip_tip, style: GQStyle.white14Medium),
            ),
          ),
        ],
      );
    }
    if (detailData["link"].isEmpty && detailData["type"] == 2) {
      int money = Provider.of<HomeConfig>(context, listen: false).member.money;
      String seed_coins_tip =
          Provider.of<HomeConfig>(context, listen: false).config.seed_coins_tip;
      return Column(children: [
        Container(
          height: 75.w,
          decoration: DottedDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4.w)),
              shape: Shape.box,
              color: GQStyle.cyanColor00edfd,
              strokeWidth: 1.w),
          alignment: Alignment.center,
          child: Text(CommonUtils.txt("nrycjsck"), style: GQStyle.blue80_14_M),
        ),
        SizedBox(height: 10.w),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            CommonUtils.startLoadGIF(tip: CommonUtils.txt("dhz"));
            buyBit(
                    id: detailData["id"],
                    coins: money - detailData["coins"],
                    context: context)
                .then((res) {
              //关闭加载动画
              BotToast.closeAllLoading();
              if (res.status != 0) {
                detailData["link"] = res.data;
                setState(() {});
              } else {
                CommonUtils.showText(res.msg);
              }
            });
          },
          child: Container(
            height: 40.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                gradient: GQStyle.gradient_90_114,
                borderRadius: BorderRadius.all(Radius.circular(4.w))),
            child: Text(
                seed_coins_tip.replaceAll("#", "${detailData["coins"] ?? 0}"),
                style: GQStyle.white14Medium),
          ),
        )
      ]);
    }
    return detailData["topic"]["type"] == 0
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  if (detailData['secret'].isEmpty) return;
                  Clipboard.setData(
                      ClipboardData(text: "${detailData['secret']}"));
                  CommonUtils.showText(CommonUtils.txt('fzcg'));
                },
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: CommonUtils.txt("jymm"),
                          style: TextStyle(
                              color: Colors.white70, fontSize: 14.sp)),
                      TextSpan(
                          text: detailData['secret'].isEmpty
                              ? CommonUtils.txt("ptjc")
                              : "${detailData['secret']}",
                          style: TextStyle(
                              color: GQStyle.cyanColor00edfd, fontSize: 14.sp)),
                      detailData['secret'].isEmpty
                          ? TextSpan()
                          : TextSpan(
                              text: " [${CommonUtils.txt("dwfz")}]",
                              style: TextStyle(
                                  color: Colors.red, fontSize: 14.sp)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.w),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Clipboard.setData(
                      ClipboardData(text: "${detailData['link']}"));
                  CommonUtils.showText(CommonUtils.txt('fzcg'));
                },
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: CommonUtils.txt("xzlj"),
                          style: TextStyle(
                              color: Colors.white70, fontSize: 14.sp)),
                      TextSpan(
                          text: "${detailData['link']}".replaceAll(",", "\n"),
                          style: TextStyle(
                              color: GQStyle.cyanColor00edfd, fontSize: 14.sp)),
                      TextSpan(
                          text: " [${CommonUtils.txt("dwfz")}]",
                          style: TextStyle(color: Colors.red, fontSize: 14.sp)),
                    ],
                  ),
                ),
              )
            ],
          )
        : GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Clipboard.setData(ClipboardData(text: "${detailData['link']}"));
              CommonUtils.showText(CommonUtils.txt('fzcg'));
            },
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: CommonUtils.txt("wzwz"),
                      style: TextStyle(color: Colors.white70, fontSize: 14.sp)),
                  TextSpan(
                      text: "${detailData['link']}".replaceAll(",", "\n"),
                      style: TextStyle(
                          color: GQStyle.cyanColor00edfd, fontSize: 14.sp)),
                  TextSpan(
                      text: " [${CommonUtils.txt("dwfz")}]",
                      style: TextStyle(color: Colors.red, fontSize: 14.sp)),
                ],
              ),
            ),
          );
  }
}
