import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:awjq/base/baseWidget.dart';
import 'package:awjq/components/page_status.dart';
import 'package:awjq/model/element.dart';
import 'package:awjq/model/homedata.dart';
import 'package:awjq/page/kthe_module_layout.dart';
import 'package:awjq/page/yyq_diamond_nav.dart';
import 'package:awjq/store/homeConfig.dart';
import 'package:awjq/theme/default.dart';
import 'package:awjq/utils/api.dart';

class CartoonDiscover extends BaseWidget {
  CartoonDiscover({Key key}) : super(key: key);

  @override
  State<StatefulWidget> cState() {
    // TODO: implement cState
    return _CartoonDiscoverState();
  }
}

class _CartoonDiscoverState extends BaseWidgetState<CartoonDiscover> {
  List<String> navitems = [];
  List<Widget> pages = [];
  bool netWorkErr = false;

  void getPageData() async {
    Config c = Provider.of<HomeConfig>(context, listen: false).config;
    if (c == null) {
      netWorkErr = true;
      setState(() {});
      return;
    }
    ElementModel data = await getFisrtTopNavConfig(nav_id: c.dm_navid);
    if (data == null) {
      netWorkErr = true;
      setState(() {});
      return;
    }

    setState(() {
      navitems = data.value.asMap().keys.map<String>((x) {
        return data.value[x]["name"];
      }).toList();
      pages = data.value.asMap().keys.map((e) {
        LinkModel _link = LinkModel.fromJson(data.value[e]);
        return KTheModuleLayout(
          id: int.parse(_link.linkUrl),
          index: e,
          linkModel: _link,
        )..forCartoonDiscover = true;
      }).toList();
    });
  }

  @override
  Widget pageBody(BuildContext context) {
    return Container(
      color: GQStyle.bgColor,
      child: netWorkErr
          ? PageStatus.noNetWork(onTap: () {
              netWorkErr = false;
              getPageData();
            })
          : navitems.length == 0
              ? Container()
              : Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).padding.top +
                          GQStyle.navbarHegiht +
                          ScreenUtil().setWidth(10),
                    ),
                    Expanded(
                      child: YyqDiamondNav(
                        titles: navitems,
                        pages: pages,
                        // navColor: GQStyle.naviColor,
                        defaultStyle: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: ScreenUtil().setSp(18),
                            overflow: TextOverflow.visible,
                            decoration: TextDecoration.none),
                        selectStyle: TextStyle(
                            color: Color.fromRGBO(0, 237, 253, 1),
                            fontSize: ScreenUtil().setSp(18),
                            overflow: TextOverflow.visible,
                            decoration: TextDecoration.none),
                      ),
                    )
                  ],
                ),
    );
  }

  @override
  Widget appbar() {
    // TODO: implement appbar
    return Container();
  }

  @override
  void onCreate() {
    // TODO: implement onCreate
    getPageData();
  }

  @override
  void onDestroy() {
    // TODO: implement onDestroy
  }
}
