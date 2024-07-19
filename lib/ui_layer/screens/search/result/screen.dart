
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../const.dart';
import '../../../../domain/domain.dart';
import '../../../../domain/model/feed/feed_model.dart';
import '../../../../domain/model/live_model.dart';
import '../../../../domain/model/monitor_model.dart';
import '../../../../domain/model/post_model.dart';
import '../../../../domain/remote_domain/domains/live.dart';
import '../../../../domain/remote_domain/domains/monitor.dart';
import '../../../notifiers/home_config_notifier.dart';
import '../../bit/live_video/live_card/live_video_card.dart';
import '../../bit/monitor_video/monitor_card/monitor_card.dart';
import '../../common_widgets/feed/feed_card.dart';
import '../../common_widgets/keep_alive_wrapper.dart';
import '../../common_widgets/my_app_bar.dart';
import '../../common_widgets/my_list_view.dart';
import '../../common_widgets/my_tab_bar.dart';
import '../../common_widgets/post/card/card.dart';
import '../../common_widgets/screen_background.dart';
import '../../common_widgets/feed/card/video_card.dart';
import '../../theme.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({super.key, required this.title});
  final String title;
  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {

  late final homeConfigNotifier = context.read<HomeConfigNotifier>();

  @override
  Widget build(BuildContext context) {

    final openLive = homeConfigNotifier.config.openLive == 1 ? true : false;

    return ScreenBackground(
      child: Scaffold(
        appBar: MyAppBar(
          title: 'ssjg'.tr(context: context),
        ),
        body: TabBarWithView.fillColor(
          tabBarPadding: EdgeInsets.symmetric(
            vertical: 6.w,
            horizontal: MyTheme.pagePadding,
          ),
          tabBarHeight: 32.w,
          titles: openLive ? [
            'sping'.tr(context: context),
            'zhibo'.tr(context: context),
            'jiankong'.tr(context: context),
            'tiezt'.tr(context: context),
          ] : [
            'sping'.tr(context: context),
            'jiankong'.tr(context: context),
            'tiezt'.tr(context: context),
          ],
          views: openLive ?  [
            KeepAliveWrapper(
              child: _VideoView(word: widget.title),
            ),
            KeepAliveWrapper(
              child: _LiveVideoView(word: widget.title),
            ),
            KeepAliveWrapper(
              child: _MonitorVideoView(word: widget.title),
            ),
            KeepAliveWrapper(
              child: _TieztView(word: widget.title),
            ),
          ] : [
            KeepAliveWrapper(
              child: _VideoView(word: widget.title),
            ),
            KeepAliveWrapper(
              child: _MonitorVideoView(word: widget.title),
            ),
            KeepAliveWrapper(
              child: _TieztView(word: widget.title),
            ),
          ],
        ),
      ),
    );
  }
}

class _VideoView extends StatefulWidget {
  const _VideoView({required this.word});
  final String word;
  @override
  State<_VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<_VideoView> {
  late final mvDomain = context.read<MvDomain>();

  Future<List<FeedVideoModel>> _getData({
    required int page,
    required int pageSize,
  }) async {
    final result = await mvDomain.videoSearch(
        page: page, limit: pageSize, word: widget.word);

    return result.data!;
  }

  @override
  Widget build(BuildContext context) {
    return MyListView.grid(
      padding: EdgeInsets.symmetric(horizontal: MyTheme.pagePadding),
      childAspectRatio: FeedCard.aspectRatio,
      crossAxisSpacing: 8.w,
      itemBuilder: (_, item, __) => VideoCard(data: item),
      onFetchingMore: (currentPage, pageSize) => _getData(
        page: currentPage,
        pageSize: pageSize,
      ),
    );
  }
}

class _LiveVideoView extends StatefulWidget {
  const _LiveVideoView({required this.word});
  final String word;
  @override
  State<_LiveVideoView> createState() => _LiveVideoViewState();
}

class _LiveVideoViewState extends State<_LiveVideoView> {
  late final _domain = context.read<LiveDomain>();

  Future<List<LiveModel>?> _getData({
    required int page,
    required int pageSize,
  }) async {
    final result = await _domain.getLiveSearch(
        page: page, limit: pageSize, word: widget.word);
    return result.data;
  }

  @override
  Widget build(BuildContext context) {
    return MyListView.grid(
      padding: EdgeInsets.symmetric(horizontal: MyTheme.pagePadding),
      childAspectRatio: UILayerConst.videoRatio,
      crossAxisSpacing: 8.w,
      itemBuilder: (_, item, __) => LiveVideoCard(data: item),
      onFetchingMore: (currentPage, pageSize) => _getData(
        page: currentPage,
        pageSize: pageSize,
      ),
    );
  }
}

class _MonitorVideoView extends StatefulWidget {
  const _MonitorVideoView({required this.word});
  final String word;
  @override
  State<_MonitorVideoView> createState() => _MonitorVideoViewState();
}

class _MonitorVideoViewState extends State<_MonitorVideoView> {
  late final _domain = context.read<MonitorDomain>();

  Future<List<MonitorModel>?> _getData({
    required int page,
    required int pageSize,
  }) async {
    final result = await _domain.getMonitorSearch(
        page: page, limit: pageSize, word: widget.word);

    return result.data!;
  }

  @override
  Widget build(BuildContext context) {
    return MyListView.grid(
      padding: EdgeInsets.symmetric(horizontal: MyTheme.pagePadding),
      childAspectRatio: UILayerConst.videoRatio2,
      crossAxisSpacing: 8.w,
      itemBuilder: (_, item, __) => MonitorCard(data: item),
      onFetchingMore: (currentPage, pageSize) => _getData(
        page: currentPage,
        pageSize: pageSize,
      ),
    );
  }
}

class _TieztView extends StatefulWidget {
  const _TieztView({required this.word});
  final String word;

  @override
  State<_TieztView> createState() => _TieztViewState();
}

class _TieztViewState extends State<_TieztView> {
  late final communityDomain = context.read<CommunityDomain>();

  Future<List<PostModel>> _getData({
    required int page,
    required int pageSize,
  }) async {
    final result = await communityDomain.searchCommunity(
      page: page,
      limit: pageSize,
      word: widget.word,
    );

    return result.data!;
  }

  @override
  Widget build(BuildContext context) {
    return MyListView.list(
      contentPadding: 15.w,
      itemBuilder: (context, item, index) => PostCard.community(data: item),
      onFetchingMore: (currentPage, pageSize) => _getData(
        page: currentPage,
        pageSize: pageSize,
      ),
    );
  }
}

class _ZhozView extends StatefulWidget {
  const _ZhozView({required this.word});
  final String word;

  @override
  State<_ZhozView> createState() => _ZhozViewState();
}

class _ZhozViewState extends State<_ZhozView> {
  late final seedDomain = context.read<SeedDomain>();

  Future<List<PostModel>> _getData({
    required int page,
    required int pageSize,
  }) async {
    final result = await seedDomain.searchBit(
      page: page,
      limit: pageSize,
      word: widget.word,
    );

    return result.data!;
  }

  @override
  Widget build(BuildContext context) {
    return MyListView.list(
      contentPadding: 15.w,
      itemBuilder: (context, item, index) => PostCard.bit(data: item),
      onFetchingMore: (currentPage, pageSize) => _getData(
        page: currentPage,
        pageSize: pageSize,
      ),
    );
  }
}
