import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:awjq/acg_page/home/home_comic_info_page.dart';
import 'package:awjq/base/baseWidget.dart';
import 'package:awjq/page/flj_slider_nav.dart';
import 'package:awjq/pages/mine/mine_user_center_post.dart';
import 'package:awjq/utils/extensionlibrary.dart';
import 'package:provider/provider.dart';
import 'package:awjq/components/page_status.dart';
import 'package:awjq/model/homedata.dart';
import 'package:awjq/store/homeConfig.dart';
import 'package:awjq/theme/default.dart';
import 'package:awjq/utils/api.dart';
import 'package:awjq/utils/common.dart';
import 'package:awjq/utils/index.dart';
import 'package:awjq/utils/networkImage.dart';
import 'package:awjq/utils/pageviewmixin.dart';

/// 我的-个人中心
class MineUserCenter extends BaseWidget {
  MineUserCenter({Key key, this.aff}) : super(key: key);
  final String aff;

  @override
  State<StatefulWidget> cState() {
    // TODO: implement cState
    return _MineUserCenterState();
  }
}

class _MineUserCenterState extends BaseWidgetState<MineUserCenter> {
  bool isHud = true;
  dynamic memberInfo;
  List<String> selTags;
  PageController _pageController = PageController();
  ScrollController _controller = ScrollController();
  Member member;
  String _aff;

  _getData() async {
    peerCenterInfo(aff: _aff).then((res) {
      if (res.status == 1) {
        memberInfo = res.data;
        selTags = List.from(memberInfo["tag_list"]);
        isHud = false;
        if (mounted) setState(() {});
      } else {
        CommonUtils.showText(res.msg, call: () {
          context.pop();
        });
      }
    });
  }

  @override
  void onCreate() {
    // TODO: implement onCreate
    setAppTitle(navColor: Colors.transparent);
    _aff = widget.aff;
    _getData();
    EventBus().on('need-update-login-state', (args) {
      //退出登录需要更新当前用户信息并重新拉取数据
      if (args == 'quit') {
        isHud = true;
        getUserInfo(context).then((res) {
          _aff = res.aff.toString();
          _getData();
        });
      }
    });
  }

  @override
  void onDestroy() {
    // TODO: implement onDestroy
    _pageController.dispose();
    _controller.dispose();
  }

  @override
  Widget pageBody(BuildContext context) {
    // TODO: implement pageBodys
    member = Provider.of<HomeConfig>(context, listen: true).member;
    return isHud
        ? PageStatus.loading(mounted)
        : NestedScrollView(
            headerSliverBuilder: (context, res) {
              return [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: GQStyle.pagePadding, vertical: 10.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: ClipRRect(
                            clipBehavior: Clip.hardEdge,
                            borderRadius: BorderRadius.circular(
                                ScreenUtil().setWidth(33.5)),
                            child: Container(
                              height: ScreenUtil().setWidth(67),
                              width: ScreenUtil().setWidth(67),
                              decoration: BoxDecoration(
                                gradient: GQStyle.gradient_90_114,
                              ),
                              child: Center(
                                child: ClipRRect(
                                  clipBehavior: Clip.hardEdge,
                                  borderRadius: BorderRadius.circular(
                                      ScreenUtil().setWidth(31.5)),
                                  child: Container(
                                    width: ScreenUtil().setWidth(63),
                                    height: ScreenUtil().setWidth(63),
                                    child: _aff == member.aff.toString()
                                        ? UserAvatar()
                                        : PlatformAwareNetworkImage(
                                            imageName: "flj_logo_icon",
                                            url: memberInfo['thumb'],
                                          ),
                                    // child: UserAvatar(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    memberInfo["nickname"] ??
                                        CommonUtils.txt('kkyh'),
                                    style: GQStyle.white16bold),
                                SizedBox(width: 5.w),
                                CommonUtils.memberVip(memberInfo["vip_str"])
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                      text: CommonUtils.renderFixedNumber(
                                          memberInfo['follow_count']),
                                      style: GQStyle.gray102_15),
                                  TextSpan(
                                      text: CommonUtils.txt('fans') + "  ",
                                      style: GQStyle.gray102_15)
                                ])),
                                memberInfo["agent"] == 1
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(CommonUtils.txt('kkyhrz'),
                                              style: GQStyle.gray102_15),
                                          SizedBox(width: 2.w),
                                          Icon(Icons.verified_sharp,
                                              size: 14.w,
                                              color: Color.fromRGBO(
                                                  247, 208, 93, 1)),
                                        ],
                                      )
                                    : Container(),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SliverPersistentHeader(
                    pinned: true,
                    delegate: CustomHeaderDelegate(
                      Container(
                        color: GQStyle.bgColor,
                        child: FljSliderBar(
                          selectStyle: GQStyle.white255_13_B,
                          defaultStyle: GQStyle.white255_13,
                          pageController: _pageController,
                          titles: [
                            CommonUtils.txt("tiezt") +
                                "（${memberInfo["post_count"] ?? 0}）"
                          ],
                        ),
                      ),
                      minHeight: GQStyle.navbarHegiht,
                      maxHeight: GQStyle.navbarHegiht,
                    ))
              ];
            },
            body: PageView(
              controller: _pageController,
              children: [
                PageViewMixin(
                  child: MineUserCenterPost(aff: _aff),
                )
              ],
            ),
            controller: _controller,
          );
  }
}

class UserAvatar extends StatefulWidget {
  const UserAvatar({Key key}) : super(key: key);

  @override
  State<UserAvatar> createState() => _UserAvatarState();
}

class _UserAvatarState extends State<UserAvatar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeConfig>(builder: (ctx, state, child) {
      return PlatformAwareNetworkImage(
        imageName: 'flj_logo_icon',
        fit: BoxFit.cover,
        url: '${state.member.thumb ?? ""}',
      );
    });
  }
}

class UserCenterMyPost extends StatefulWidget {
  UserCenterMyPost({Key key}) : super(key: key);

  @override
  State<UserCenterMyPost> createState() => _UserCenterMyPostState();
}

class _UserCenterMyPostState extends State<UserCenterMyPost> {
  List<dynamic> dataList = [];
  var page = 1;
  bool isHud = true;
  bool networkErr = false;
  bool noMore = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  _getData() {
    userMyPosts(page: page).then((res) {
      if (res.data == null) {
        networkErr = true;
        setState(() {});
        return;
      }
      List st = res.data;
      if (page == 1) {
        noMore = false;
        dataList = st;
      } else if (st.length > 0) {
        dataList.addAll(st);
      } else {
        noMore = true;
      }
      isHud = false;
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: networkErr
            ? PageStatus.noNetWork(onTap: () {
                networkErr = false;
                _getData();
              })
            : isHud
                ? PageStatus.loading(mounted)
                : dataList.length == 0
                    ? PageStatus.noData()
                    : ListView.builder(
                        padding: EdgeInsets.symmetric(
                            vertical: ScreenUtil().setWidth(10)),
                        itemCount: 1, //帖子
                        itemBuilder: (context, index) {
                          return Column(
                            children: dataList.map((e) {
                              List medias = e["medias"] ?? [];
                              List tmp = medias.length > 3
                                  ? medias.sublist(0, 3)
                                  : medias;

                              return Container(
                                margin: EdgeInsets.only(
                                    bottom: ScreenUtil().setWidth(15),
                                    left: ScreenUtil().setWidth(24),
                                    right: ScreenUtil().setWidth(22)),
                                child: GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    context.push(
                                        "/communitypostdetail/${e["id"]}");
                                  },
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                ScreenUtil().setWidth(10)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // SizedBox(
                                            //   height: ScreenUtil().setWidth(50),
                                            //   child: Row(
                                            //     children: [
                                            //       SizedBox(
                                            //         width: ScreenUtil().setWidth(45),
                                            //         height: ScreenUtil().setWidth(45),
                                            //         child: GestureDetector(
                                            //           behavior: HitTestBehavior.translucent,
                                            //           onTap: () {},
                                            //           child: PlatformAwareNetworkImage(
                                            //             url: e["user"]["thumb"] ?? "",
                                            //             borderRadius: BorderRadius.all(
                                            //                 Radius.circular(
                                            //                     ScreenUtil().setWidth(45 / 2))),
                                            //           ),
                                            //         ),
                                            //       ),
                                            //       SizedBox(width: ScreenUtil().setWidth(9.5)),
                                            //       Expanded(
                                            //         child: Column(
                                            //           crossAxisAlignment:
                                            //               CrossAxisAlignment.start,
                                            //           children: [
                                            //             Text(
                                            //               RelativeDateFormat.format(
                                            //                   DateTime.parse(
                                            //                       e["created_at"] ?? "")),
                                            //               style: GQStyle.gray163_11,
                                            //             ),
                                            //           ],
                                            //         ),
                                            //       ),
                                            //     ],
                                            //   ),
                                            // ),
                                            Text(
                                              RelativeDateFormat.format(
                                                  DateTime.parse(
                                                      e["created_at"] ?? "")),
                                              style: GQStyle.gray163_11,
                                            ),
                                            SizedBox(
                                                height:
                                                    ScreenUtil().setWidth(15)),
                                            Text.rich(TextSpan(children: [
                                              e["is_best"] == 1
                                                  ? WidgetSpan(
                                                      alignment:
                                                          PlaceholderAlignment
                                                              .middle,
                                                      child: Padding(
                                                        padding: EdgeInsets.only(
                                                            right: GQStyle
                                                                .pagePadding),
                                                        child: LImage(
                                                          "comm_txtjh_n",
                                                          width: ScreenUtil()
                                                              .setWidth(32),
                                                          height: ScreenUtil()
                                                              .setWidth(15),
                                                        ),
                                                      ))
                                                  : TextSpan(),
                                              TextSpan(
                                                  text: e["title"] ?? "",
                                                  style: GQStyle.white255_15)
                                            ])),
                                            tmp.length > 0
                                                ? GridView.count(
                                                    padding: EdgeInsets.only(
                                                        top: ScreenUtil()
                                                            .setWidth(12)),
                                                    shrinkWrap: true,
                                                    crossAxisCount: 3,
                                                    mainAxisSpacing:
                                                        ScreenUtil()
                                                            .setWidth(7),
                                                    crossAxisSpacing:
                                                        ScreenUtil()
                                                            .setWidth(7),
                                                    childAspectRatio: 1.0,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    children: tmp
                                                        .asMap()
                                                        .keys
                                                        .map((x) => Stack(
                                                              children: [
                                                                PlatformAwareNetworkImage(
                                                                  url: tmp[x]["type"] ==
                                                                          2
                                                                      ? tmp[x][
                                                                              "cover"] ??
                                                                          ""
                                                                      : tmp[x][
                                                                              "media_url"] ??
                                                                          "",
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              ScreenUtil().setWidth(5))),
                                                                ),
                                                                tmp[x]["type"] ==
                                                                        2
                                                                    ? Center(
                                                                        child: LImage(
                                                                            "v_play_n",
                                                                            width:
                                                                                ScreenUtil().setWidth(30),
                                                                            height: ScreenUtil().setWidth(30)),
                                                                      )
                                                                    : Container(),
                                                                //大于3张图并且最后一图显示剩余多少张
                                                                x == 2 &&
                                                                        medias.length >
                                                                            3
                                                                    ? Positioned(
                                                                        right: ScreenUtil()
                                                                            .setWidth(
                                                                                6),
                                                                        bottom: ScreenUtil()
                                                                            .setWidth(
                                                                                6),
                                                                        child:
                                                                            Container(
                                                                          padding:
                                                                              EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(5)),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color: Color.fromRGBO(
                                                                                0,
                                                                                0,
                                                                                0,
                                                                                0.5),
                                                                            borderRadius:
                                                                                BorderRadius.all(Radius.circular(ScreenUtil().setWidth(2))),
                                                                          ),
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Text(
                                                                              "+${medias.length - 3}",
                                                                              style: GQStyle.white255_12,
                                                                            ),
                                                                          ),
                                                                        ))
                                                                    : Container()
                                                              ],
                                                            ))
                                                        .toList(),
                                                  )
                                                : Container(),
                                            SizedBox(
                                                height:
                                                    ScreenUtil().setWidth(15)),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  GestureDetector(
                                                    behavior: HitTestBehavior
                                                        .translucent,
                                                    onTap: () {
                                                      context.push(
                                                          "/communitytagdetail/${e["topic"]["id"]}/sc");
                                                    },
                                                    child: Text(
                                                      "#${e["topic"]["name"] ?? ""}",
                                                      style:
                                                          GQStyle.blue96_13_M,
                                                    ),
                                                  ),
                                                  Text(
                                                    "${CommonUtils.renderFixedNumber(e["comment_num"] ?? 0)}${CommonUtils.txt("tpl")} ｜ ${CommonUtils.renderFixedNumber(e["view_num"] ?? 0)}${CommonUtils.txt("llan")} ｜ ${CommonUtils.renderFixedNumber(e["like_num"] ?? 0)}${CommonUtils.txt("dz")}",
                                                    style: GQStyle.gray163_11,
                                                  )
                                                ]),
                                            SizedBox(
                                                height:
                                                    ScreenUtil().setWidth(14)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          );
                        }),
      ),
    );
  }
}
