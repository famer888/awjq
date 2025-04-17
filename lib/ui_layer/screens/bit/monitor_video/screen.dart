import 'package:awjq/ui_layer/utils/common_utils.dart';

import '../../../../domain/model/banner_model.dart';
import '../../../../domain/model/bit_nav_model.dart';
import '../../../../domain/model/live_model.dart';
import '../../../../domain/model/monitor_model.dart';
import '../../../../domain/remote_domain/domains/monitor.dart';
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

import 'monitor_card/monitor_card.dart';

class MonitorVideoView extends StatefulWidget {
  const MonitorVideoView({super.key, required this.nav});
  final BitNavModel nav;
  @override
  State<MonitorVideoView> createState() => _MonitorVideoViewState();
}

class _MonitorVideoViewState extends State<MonitorVideoView> {
  late final _domain = context.read<MonitorDomain>();
  final ValueNotifier<List<BannerModel>> _bannersNotifier = ValueNotifier([]);
  final ValueNotifier<List<TipModel>> _tipsNotifier = ValueNotifier([]);

  Future<List<MonitorModel>?> _getData(
      {required int page, required int pageSize}) async {
    final result = await _domain.getMonitorIndex(
      id: widget.nav.id,
      page: page,
      limit: pageSize,
    );
    if (mounted) {
      setState(() {
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

      return result.data?.monitors;
    } else {
      MyToast.showText(text: result.msg ?? '');
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MyListView.grid(
      childAspectRatio: UILayerConst.videoRatio2,
      header: _Header(bannersNotifier: _bannersNotifier, tipsNotifier: _tipsNotifier),
      contentPadding: 15.w,
      padding: EdgeInsets.symmetric(vertical: MyTheme.pagePadding, horizontal: MyTheme.pagePadding),
      itemBuilder: (context, item, index) {
        return MonitorCard(data: item);
      },
      onFetchingMore: (currentPage, pageSize) => _getData(
          page: currentPage, pageSize: pageSize),
    );
  }
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
              child: GeneralAppsListVidget(data: banners),
            );
          },
        ),
        SizedBox(height: 4.w),
        ValueListenableBuilder(
          valueListenable: tipsNotifier,
          builder: (context, tips, child) {
            if (tips.isEmpty) return const SizedBox.shrink();
            return CommonUtils.buildNotifyWidget(tips);
          },
        ),
      ],
    );
  }
}
