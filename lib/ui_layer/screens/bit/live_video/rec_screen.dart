import '../../../../domain/model/banner_model.dart';
import '../../../../domain/model/bit_nav_model.dart';
import '../../../../domain/model/live_model.dart';
import '../../../../domain/remote_domain/domains/live.dart';
import '../../../const.dart';
import '../../common_widgets/general_banner.dart';
import '../../common_widgets/marquee_widget.dart';
import '../../common_widgets/my_image.dart';
import '../../common_widgets/my_list_view.dart';
import '../../image_paths.dart';
import '../../theme.dart';
import '../../../utils/my_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'live_card/live_video_card.dart';
import 'live_card/rec_live_video_card.dart';

class RecLiveVideoView extends StatefulWidget {
  const RecLiveVideoView({super.key, required this.nav, required this.moreClickCallBack});

  final BitNavModel nav;
  final Function(String title) moreClickCallBack;

  @override
  State<RecLiveVideoView> createState() => _RecLiveVideoViewState();
}

class _RecLiveVideoViewState extends State<RecLiveVideoView> {
  late final _domain = context.read<LiveDomain>();
  final ValueNotifier<List<BannerModel>> _bannersNotifier = ValueNotifier([]);
  final ValueNotifier<List<TipModel>> _tipsNotifier = ValueNotifier([]);

  Future<List<ThemesModel>?> _getData(
      {required int page, required int pageSize}) async {
    final result = await _domain.getLiveRecListComment(
      page: page,
      limit: pageSize,
    );
    if (mounted) {
      setState(() {});
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

      return result.data?.themes;
    } else {
      MyToast.showText(text: result.msg ?? '');
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MyListView.list(
      header: _Header(
          bannersNotifier: _bannersNotifier, tipsNotifier: _tipsNotifier),
      contentPadding: 5.w,
      padding: EdgeInsets.symmetric(
          vertical: MyTheme.pagePadding, horizontal: MyTheme.pagePadding),
      itemBuilder: (context, item, index) =>
          RecLiveVideoCard(model: item, moreClickCallBack: () {
            widget.moreClickCallBack.call(item.name ?? '');
          }),
      onFetchingMore: (currentPage, pageSize) =>
          _getData(page: currentPage, pageSize: pageSize),
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
