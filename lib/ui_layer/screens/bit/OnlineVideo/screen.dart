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
import '../../common_widgets/general_banner.dart';
import '../../common_widgets/my_list_view.dart';
import '../../common_widgets/my_tab_bar.dart';
import '../../common_widgets/post/card/card.dart';
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
      return result.data?.lives;
    } else {
      MyToast.showText(text: result.msg ?? '');
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MyListView.list(
      header: _Header(bannersNotifier: _bannersNotifier),
      contentPadding: 15.w,
      padding: EdgeInsets.symmetric(vertical: MyTheme.pagePadding, horizontal: MyTheme.pagePadding),
      itemBuilder: (context, item, index) => Container(),
      onFetchingMore: (currentPage, pageSize) => _getData(
          page: currentPage, pageSize: pageSize),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.bannersNotifier});
  final ValueNotifier<List<BannerModel>> bannersNotifier;

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
      ],
    );
  }
}
