import 'package:awjq/domain/model/part_nav_model.dart';
import 'package:awjq/ui_layer/screens/common_widgets/my_image.dart';
import 'package:awjq/ui_layer/screens/image_paths.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../router/routes.dart';
import '../../utils/common_utils.dart';
import '../theme.dart';

import '../../../domain/type_def.dart';
import '../../../domain/domain.dart';
import '../../../domain/model/banner_model.dart';
import '../../../domain/model/feed/feed_model.dart';
import '../../../domain/model/link_model.dart';
import '../../../domain/model/nav_model.dart';
import '../../../domain/model/navigator_model.dart';
import '../../notifiers/home_config_notifier.dart';
import '../../utils/my_toast.dart';
import 'feed/feed_card.dart';
import 'general_banner.dart';
import 'my_list_view.dart';
import 'my_tab_bar.dart';

class ApiLinkView extends StatefulWidget {
  const ApiLinkView(
      {super.key, required this.linkModel, required this.onLinkNavTap});
  final LinkModel linkModel;
  final ValueChanged<String> onLinkNavTap;
  @override
  State<ApiLinkView> createState() => _ApiLinkViewState();
}

class _ApiLinkViewState extends State<ApiLinkView> {
  late final _appDomain = context.read<AppDomain>();
  late final _homeConfig = context.read<HomeConfigNotifier>();
  final ValueNotifier<List<BannerModel>> bannersNotifier = ValueNotifier([]);
  final ValueNotifier<List<NavModel>> topicsNotifier = ValueNotifier([]);
  final ValueNotifier<List<PartModel>> partNotifier = ValueNotifier([]);
  late final List<NavigatorModel> titles = _homeConfig.config.sortNav ?? [];

  bool isInit = false;

  Future<List<FeedModel>?> _getData({
    required int page,
    required int pageSize,
    required String type,
  }) async {
    final param = Map.from(widget.linkModel.params)
      ..['page'] = page
      ..['limit'] = pageSize
      ..['sort'] = type;

    final result = await _appDomain.getConstructByApiLink(
      apiLink: widget.linkModel.api,
      params: param,
    );

    if (!isInit) {
      setState(() {
        isInit = true;
      });
    }

    if (result.status == 1) {
      if (result.data['banner'] case final List data
          when data.isNotEmpty && bannersNotifier.value.isEmpty) {
        final banner = data.map((x) => BannerModel.fromJson(x)).toList();
        bannersNotifier.value = banner;
      }
      if (result.data['nav'] case final List data
          when data.isNotEmpty && topicsNotifier.value.isEmpty) {
        final nav = data.map((x) => NavModel.fromJson(x)).toList();
        topicsNotifier.value = nav;
      }
      if (result.data['part'] case final List data
      when data.isNotEmpty && partNotifier.value.isEmpty) {
        final part = data.map((x) => PartModel.fromJson(x)).toList();
        partNotifier.value = part;
      }
      return result.data['list']
          ?.map<FeedModel>((x) => FeedModel.fromJson(x))
          .toList();
    } else {
      MyToast.showText(text: result.msg ?? '');
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (_, __) => [
        SliverToBoxAdapter(
          child: _Header(
            bannersNotifier: bannersNotifier,
            topicsNotifier: topicsNotifier,
            partNotifier: partNotifier,
            onLinkNavTap: widget.onLinkNavTap,
          ),
        ),
      ],
      body: TabBarWithView.fillColor(
        tabBarPadding: EdgeInsets.symmetric(
            vertical: 6.w, horizontal: MyTheme.pagePadding),
        tabBarHeight: 32.w,
        labelStyle: MyTheme.white12,
        unselectedLabelStyle: MyTheme.whiteOpacity612w400,
        titles: isInit ? [for (final title in titles) title.title] : [],
        views: [
          for (final NavigatorModel nav in titles)
            MyListView.grid(
              padding: EdgeInsets.symmetric(horizontal: MyTheme.pagePadding),
              childAspectRatio: FeedCard.aspectRatio,
              crossAxisSpacing: 8.w,
              itemBuilder: (context, item, index) => FeedCard(feed: item),
              onFetchingMore: (currentPage, pageSize) => _getData(
                page: currentPage,
                pageSize: pageSize,
                type: nav.type,
              ),
            )
        ],
      ),
    );
  }
}

class _Header extends StatefulWidget {

  const _Header({
    required this.bannersNotifier,
    required this.topicsNotifier,
    required this.partNotifier,
    required this.onLinkNavTap,
  });

  final ValueNotifier<List<BannerModel>> bannersNotifier;
  final ValueNotifier<List<NavModel>> topicsNotifier;
  final ValueNotifier<List<PartModel>> partNotifier;
  final ValueChanged<String> onLinkNavTap;

  @override
  State<_Header> createState() => _HeaderState();
}

class _HeaderState extends State<_Header> {

  List<NavModel> contentTopics = [];
  bool isShowAllTopics = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 6.w),
        ValueListenableBuilder(
          valueListenable: widget.bannersNotifier,
          builder: (context, banners, child) {
            if (banners.isEmpty) return const SizedBox.shrink();
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: MyTheme.pagePadding),
              child: GeneralBanner(data: banners),
            );
          },
        ),
        SizedBox(height: 10.w),
        ValueListenableBuilder(
          valueListenable: widget.partNotifier,
          builder: (context, parts, child) {
            if (parts.isEmpty) return const SizedBox.shrink();
            return Padding(
              padding: EdgeInsets.only(bottom: 5.w),
              child: GridView.builder(
                  shrinkWrap: true,
                  addRepaintBoundaries: false,
                  addAutomaticKeepAlives: false,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: parts.length,
                  padding:
                  EdgeInsets.symmetric(horizontal: MyTheme.pagePadding),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 80.w / 70.w,
                    mainAxisSpacing: 10.w,
                    crossAxisSpacing: 10.w,
                  ),
                  itemBuilder: (context, index) {
                    final partsItem = parts[index];
                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        final linkUrl = partsItem.urlStr;
                        final redirectType = partsItem.redirectType;
                        if (linkUrl.isEmpty) {
                          return;
                        }
                        if (redirectType < 3) {
                          // if (partsItem.router == 'asmr' || partsItem.router == 'torrentDownload') {
                          //   eventBus.fire(MyEvent(partsItem.router));
                          //   return;
                          // } else if (partsItem.router == 'rankList') {
                          //   const RankRoute().push(context);
                          //   return;
                          // }
                          // CommonUtils.openRoute(context, partsItem.toJson());
                        } else {
                          if (partsItem.type == '0') {
                            widget.onLinkNavTap(linkUrl);
                          } else if (partsItem.type == '1') {
                            MoreVideoRoute(name: partsItem.title, id: linkUrl)
                                .push(context);
                          }
                        }
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height: 45.w,
                            child: MyImage.network(
                              partsItem.icon,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Center(
                            child: Text(
                              partsItem.title,
                              style: MyTheme.white13,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            );
          },
        ),
        SizedBox(height: 10.w),
        ValueListenableBuilder(
          valueListenable: widget.topicsNotifier,
          builder: (context, topics, child) {
            if (topics.isEmpty) return const SizedBox.shrink();
            if (topics.length > 8 && !isShowAllTopics) {
              contentTopics = topics.sublist(0, 8);
            } else {
              contentTopics = topics;
            }
            return Padding(
              padding: EdgeInsets.only(bottom: 5.w),
              child: GridView.builder(
                  shrinkWrap: true,
                  addRepaintBoundaries: false,
                  addAutomaticKeepAlives: false,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: contentTopics.length,
                  padding:
                  EdgeInsets.symmetric(horizontal: MyTheme.pagePadding),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 80.w / 35.w,
                    mainAxisSpacing: 10.w,
                    crossAxisSpacing: 10.w,
                  ),
                  itemBuilder: (context, index) {
                    final topic = topics[index];
                    return DecoratedBox(
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.w),
                        ),
                        color: const Color(0xff262631),
                      ),
                      child: Center(
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            final linkUrl = topic.linkUrl;
                            final redirectType = topic.redirectType;
                            if (linkUrl.isEmpty) {
                              return;
                            }
                            if (redirectType < 3) {
                              CommonUtils.openRoute(context, topic.toJson());
                            } else {
                              if (topic.openType == 0) {
                                widget.onLinkNavTap(topic.linkUrl);
                              } else if (topic.openType == 1) {
                                MoreVideoRoute(
                                    name: topic.name, id: topic.linkUrl)
                                    .push(context);
                              }
                            }
                          },
                          child: Text(
                            topic.name ?? '',
                            style: MyTheme.white13,
                          ),
                        ),
                      ),
                    );
                  }),
            );
          },
        ),
        SizedBox(height: 5.w),
        Offstage(
          offstage: widget.topicsNotifier.value.length <= 8,
          child: InkWell(
                onTap: (){
                  isShowAllTopics = !isShowAllTopics;
                  if (mounted) {setState(() {});}
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(isShowAllTopics ? 'ycgd'.tr(context: context) : 'zkckgd'.tr(context: context), style: MyTheme.white08_12),
                      SizedBox(width: 3.w),
                      MyImage.asset( isShowAllTopics ? MyImagePaths.appGrayUp : MyImagePaths.appGrayDown, width: 10.w, height: 10.w)
                    ],),
                ),
              ),
        ),
        // Divider(
        //   color: Colors.white.withOpacity(0.04),
        //   height: 10,
        //   indent: MyTheme.pagePadding,
        //   endIndent: MyTheme.pagePadding,
        // ),
      ],
    );
  }
}
