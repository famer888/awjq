import '../../../../domain/model/banner_model.dart';
import '../../../../domain/model/bit_nav_model.dart';
import '../../../../domain/model/live_model.dart';
import '../../../../domain/model/navigator_model.dart';
import '../../../../domain/model/post_model.dart';
import '../../../../domain/remote_domain/domains/live.dart';
import '../../../../domain/remote_domain/domains/monitor.dart';
import '../../../../domain/remote_domain/domains/seed.dart';
import '../../../../domain/type_def.dart';
import '../../../notifiers/home_config_notifier.dart';
import '../../common_widgets/feed/card/online_video_card.dart';
import '../../common_widgets/feed/card/video_card.dart';
import '../../common_widgets/feed/feed_card.dart';
import '../../common_widgets/general_banner.dart';
import '../../common_widgets/marquee_widget.dart';
import '../../common_widgets/my_image.dart';
import '../../common_widgets/my_list_view.dart';
import '../../common_widgets/my_tab_bar.dart';
import '../../common_widgets/post/card/card.dart';
import '../../image_paths.dart';
import '../../theme.dart';
import '../../../utils/my_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class OnlineVideoView extends StatefulWidget {
  const OnlineVideoView({super.key, required this.nav});
  final BitNavModel nav;
  @override
  State<OnlineVideoView> createState() => _OnlineVideoViewState();
}

class _OnlineVideoViewState extends State<OnlineVideoView> {
  late final _domain = context.read<LiveDomain>();
  final ValueNotifier<List<BannerModel>> _bannersNotifier = ValueNotifier([]);
  final ValueNotifier<List<TipModel>> _tipsNotifier = ValueNotifier([]);

  bool isInit = false;

  Future<List<LiveModel>?> _getData(
      {required int page, required int pageSize}) async {
    final result = await _domain.getLiveIndex(
      id: widget.nav.id,
      page: page,
      limit: pageSize,
    );
    if (!isInit) {
      setState(() {
        isInit = true;
      });
    }

    if (result.status == 1) {
      if (result.data?.banners case final data?
      when data.isNotEmpty && _bannersNotifier.value.isEmpty) {
        _bannersNotifier.value = data;
      }
      if (result.data?.tips case final data?
      when data.isNotEmpty && _tipsNotifier.value.isEmpty) {
        _tipsNotifier.value = data;
      }

      return result.data?.lives;
    } else {
      MyToast.showText(text: result.msg ?? '');
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MyListView.grid(
      childAspectRatio: FeedCard.videoRatio,
      header: _Header(bannersNotifier: _bannersNotifier, tipsNotifier: _tipsNotifier),
      contentPadding: 15.w,
      padding: EdgeInsets.symmetric(vertical: MyTheme.pagePadding, horizontal: MyTheme.pagePadding),
      itemBuilder: (context, item, index) => OnlineVideoCard(data: item),
      onFetchingMore: (currentPage, pageSize) => _getData(
          page: currentPage, pageSize: pageSize),
    );
  }
}

/// 跑马灯通知
Widget _buildNotifyWidget(String marquee) {
  if (marquee.isEmpty) return const SizedBox();
  return Container(
    margin: EdgeInsets.fromLTRB(12.w, 10.w, 12.w, 0),
    height: 24.w,
    child: Row(children: [
      SizedBox(width: 5.w),
      MyImage.asset(
        MyImagePaths.appBroadcast,
        height: 30.w,
        width: 30.w,
      ),
      SizedBox(width: 5.w),
      Expanded(
        child: MarqueeWidget(
          child: Text(
            marquee,
            style: MyTheme.white12,
          ),
        ),
      ),
    ]),
  );
}

class _Header extends StatelessWidget {
  const _Header({required this.bannersNotifier, required this.tipsNotifier});
  final ValueNotifier<List<BannerModel>> bannersNotifier;
  final ValueNotifier<List<TipModel>> tipsNotifier;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 6.w),
        ValueListenableBuilder(
          valueListenable: bannersNotifier,
          builder: (context, banners, child) {
            if (banners.isEmpty) return const SizedBox.shrink();
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: MyTheme.pagePadding),
              child: GeneralBanner(data: banners),
            );
          },
        ),
        SizedBox(height: 4.w),
        ValueListenableBuilder(
          valueListenable: tipsNotifier,
          builder: (context, tips, child) {
            if (tips.isEmpty) return const SizedBox.shrink();
            return _buildNotifyWidget(tips.first.title ?? '');
          },
        ),
      ],
    );
  }
}
