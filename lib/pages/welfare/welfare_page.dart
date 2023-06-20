import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
import 'package:awjq/base/baseWidget.dart';
import 'package:awjq/model/homedata.dart';
import 'package:awjq/page/yyq_diamond_nav.dart';
import 'package:awjq/pages/mine/app_center.dart';
import 'package:awjq/pages/welfare/welfare_agent_page.dart';
import 'package:awjq/pages/welfare/welfare_task_page.dart';
import 'package:awjq/routers.dart';
import 'package:awjq/store/homeConfig.dart';
import 'package:awjq/theme/default.dart';
import 'package:awjq/utils/common.dart';
import 'package:awjq/utils/pageviewmixin.dart';
import 'package:awjq/utils/extensionlibrary.dart';
import 'package:provider/provider.dart';

class WelfarePage extends BaseWidget {
  WelfarePage({Key key, this.isShow}) : super(key: key);
  final bool isShow;

  @override
  BaseWidgetState<WelfarePage> cState() {
    return WelfarePageState();
  }
}

class WelfarePageState extends BaseWidgetState<WelfarePage> {
  int _selectedIndex = 0;
  final GlobalKey<YyqDiamondNavState> _gennavKey =
      new GlobalKey<YyqDiamondNavState>();

  @override
  void onCreate() {}

  @override
  void onDestroy() {
    // TODO: implement onDestroy
  }

  @override
  Widget appbar() {
    return Container();
  }

  void changeIndex(int index) {
    _gennavKey.currentState.onTabPageChange(index, isOnTab: true);
  }

  // @override
  // Widget backGroundView() {
  //   // TODO: implement backGroundView
  //   return _selectedIndex == 0
  //       ? LImage(
  //           'dl_vip_bg',
  //           width: ScreenUtil().screenWidth,
  //           height: ScreenUtil().screenWidth / 377 * 250,
  //         )
  //       : LImage(
  //           'dl_vip_bg_two',
  //           width: ScreenUtil().screenWidth,
  //           height: ScreenUtil().screenWidth / 376 * 346,
  //         );
  // }

  @override
  Widget pageBody(BuildContext context) {
    Config config = Provider.of<HomeConfig>(context, listen: false).config;
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).padding.top),
        Expanded(
          child: Stack(
            children: [
              YyqDiamondNav(
                key: _gennavKey,
                inedxFunc: (p0) {
                  _selectedIndex = p0;
                  setState(() {});
                },
                titles: config.show_app == 1
                    ? [
                        CommonUtils.txt('dlzq'),
                        CommonUtils.txt('flrw'),
                        CommonUtils.txt('yytj'),
                      ]
                    : [
                        CommonUtils.txt('dlzq'),
                        CommonUtils.txt('flrw'),
                      ],
                pages: config.show_app == 1
                    ? [
                        PageViewMixin(
                          child: WelfareAgentPage(),
                        ),
                        PageViewMixin(
                          child: WelfareTaskPage(
                            isShow: widget.isShow,
                          ),
                        ),
                        PageViewMixin(
                          child: AppCenter(),
                        ),
                      ]
                    : [
                        PageViewMixin(
                          child: WelfareAgentPage(),
                        ),
                        PageViewMixin(
                          child: WelfareTaskPage(
                            isShow: widget.isShow,
                          ),
                        ),
                      ],
                defaultStyle: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: ScreenUtil().setSp(16),
                    overflow: TextOverflow.visible,
                    decoration: TextDecoration.none),
                selectStyle: TextStyle(
                    color: GQStyle.jellyCyanColor103224185,
                    fontSize: ScreenUtil().setSp(16),
                    // fontWeight: FontWeight.w500,
                    overflow: TextOverflow.visible,
                    decoration: TextDecoration.none),
                isCenter: true,
                type: YyqDiamondNavEnum.line,
                navColor: Colors.transparent,
              ),
              Positioned(
                  left: GQStyle.pagePadding,
                  top: 0,
                  child: GestureDetector(
                    child: SizedBox(
                      height: 44.w,
                      child: LImage(
                        "nav_back_n",
                        width: ScreenUtil().setWidth(20),
                        height: ScreenUtil().setWidth(20),
                      ),
                    ),
                    onTap: () {
                      finish();
                    },
                  )),
            ],
          ),
        )
      ],
    );
  }
}
