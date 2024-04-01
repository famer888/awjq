import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:awjq/acg_page/home/home_comic_info_page.dart';
import 'package:awjq/components/page_status.dart';
import 'package:awjq/model/homedata.dart';
import 'package:awjq/page/flj_slider_nav.dart';
import 'package:awjq/page/yyq_diamond_nav.dart';
import 'package:awjq/pages/community/community_bit_new.dart';
import 'package:awjq/store/homeConfig.dart';
import 'package:awjq/theme/default.dart';
import 'package:awjq/utils/api.dart';
import 'package:awjq/utils/common.dart';
import 'package:awjq/utils/extensionlibrary.dart';
import 'package:awjq/views/general_banner.dart';
import 'package:awjq/views/yyq/search_element_widget.dart';
import 'package:provider/provider.dart';

class HomeBitCommunity extends StatefulWidget {
  HomeBitCommunity({Key key, this.isShow}) : super(key: key);
  final bool isShow;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeBitCommunityState();
  }
}

class _HomeBitCommunityState extends State<HomeBitCommunity>
    with SingleTickerProviderStateMixin {
  bool _isHud = true;
  bool _netError = false;
  List<dynamic> navs = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didUpdateWidget(covariant HomeBitCommunity oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (widget.isShow && _isHud) {
      navs =
          Provider.of<HomeConfig>(context, listen: false).config.seed_top_nav;
      _isHud = false;
      if (mounted) setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: GQStyle.bgColor,
      child: Column(
        children: [
          SizedBox(
              height: kIsWeb
                  ? ScreenUtil().setWidth(15)
                  : MediaQuery.of(context).padding.top),
          // const SearchElementWidget(),
          Expanded(
            child: _isHud
                ? Container()
                : _isHud
                    ? PageStatus.loading(mounted)
                    : YyqDiamondNav(
                        isCenter: true,
                        titles:
                            navs.map<String>((e) => e["title"] ?? "").toList(),
                        pages: navs.map<Widget>((e) {
                          return HomeBitChildCommunity(type: e["value"]);
                        }).toList(),
                        navColor: Colors.transparent,
                        type: YyqDiamondNavEnum.cover,
                        defaultStyle: GQStyle.white14Medium,
                        selectStyle: GQStyle.white14,
                      ),
          )
        ],
      ),
    );
  }
}

class HomeBitChildCommunity extends StatefulWidget {
  HomeBitChildCommunity({Key key, this.type}) : super(key: key);
  final int type;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeBitChildCommunityState();
  }
}

class _HomeBitChildCommunityState extends State<HomeBitChildCommunity>
    with SingleTickerProviderStateMixin {
  bool _isHud = true;
  bool _netError = false;
  List<dynamic> navs = [];

  _getData() {
    reqGetPostBit(type: widget.type).then((value) {
      if (value.status == 1) {
        navs = List.from(value?.data ?? []);
        _isHud = false;
      } else {
        _netError = true;
      }
      if (mounted) setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return _netError
        ? PageStatus.noNetWork(onTap: () {
            _netError = false;
            _getData();
          })
        : _isHud
            ? PageStatus.loading(mounted)
            : YyqDiamondNav(
                titles: navs.map<String>((e) => e["name"] ?? "").toList(),
                pages: navs.map<Widget>((e) {
                  return CommunityChildPage(
                    id: e["id"],
                    mask: e["mask"],
                    post: e["post_ct"],
                  );
                }).toList(),
                navColor: Colors.transparent,
                type: YyqDiamondNavEnum.line,
                defaultStyle: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: ScreenUtil().setSp(18),
                    overflow: TextOverflow.visible,
                    decoration: TextDecoration.none),
                selectStyle: TextStyle(
                    color: GQStyle.jellyCyanColor103224185,
                    fontSize: ScreenUtil().setSp(18),
                    // fontWeight: FontWeight.w500,
                    overflow: TextOverflow.visible,
                    decoration: TextDecoration.none),
              );
  }
}

class CommunityChildPage extends StatefulWidget {
  CommunityChildPage({Key key, this.id = 0, this.mask, this.post = 0})
      : super(key: key);
  final int id;
  final int mask;
  final int post;

  @override
  State<CommunityChildPage> createState() => _CommunityChildPageState();
}

class _CommunityChildPageState extends State<CommunityChildPage> {
  PageController _pageController = PageController();
  ScrollController _scrollController = ScrollController();
  List<dynamic> banners = [];

  @override
  Widget build(BuildContext context) {
    List tps =
        Provider.of<HomeConfig>(context, listen: false).config.seed_sort_nav;
    return Stack(
      children: [
        NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Container(
                  child: Column(
                    children: [
                      banners != null && banners.length > 0
                          ? Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: GQStyle.pagePadding),
                              child: GeneralBanner(
                                data: banners,
                                height: 150,
                                pad: 0,
                                bottom: 0,
                                radius: 5,
                              ),
                            )
                          : const SizedBox.shrink(),
                      SizedBox(height: 5.w)
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
                      selectStyle: GQStyle.green85_15,
                      defaultStyle: GQStyle.gray232_15,
                      pageController: _pageController,
                      titles: tps.map<String>((e) => e["title"] ?? "").toList(),
                    ),
                  ),
                  minHeight: GQStyle.navbarHegiht,
                  maxHeight: GQStyle.navbarHegiht,
                ),
              )
            ];
          },
          body: PageView(
            controller: _pageController,
            children: tps
                .map<Widget>(
                  (e) => CommunityBitNew(
                    id: widget.id,
                    sort: e["type"],
                    call: (data) {
                      banners = List.from(data["banners"] ?? []);
                      if (mounted) setState(() {});
                    },
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
