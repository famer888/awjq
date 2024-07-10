import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../domain/model/ai_model.dart';
import '../../../../domain/model/banner_model.dart';
import '../../../../domain/model/bit_nav_model.dart';
import '../../../../domain/remote_domain/domains/ai.dart';
import '../../../const.dart';
import '../../../notifiers/home_config_notifier.dart';
import '../../../utils/my_toast.dart';
import '../../common_widgets/Live/live_video_card.dart';
import '../../common_widgets/general_banner.dart';
import '../../common_widgets/my_list_view.dart';
import '../../common_widgets/my_tab_bar.dart';
import '../../theme.dart';
import '../card/material_card.dart';

class FaceSwapScreen extends StatefulWidget {
  const FaceSwapScreen({super.key});

  @override
  State<FaceSwapScreen> createState() => _FaceSwapScreenState();
}

class _FaceSwapScreenState extends State<FaceSwapScreen> {

  late final _aimain = context.read<AIDomain>();
  final ValueNotifier<List<BannerModel>> _bannersNotifier = ValueNotifier([]);
  late final homeConfigNotifier = context.read<HomeConfigNotifier>();
  List<BitNavModel> navs = [];
  List<String> titles = [];


  @override
  void initState() {
    super.initState();
    navs = homeConfigNotifier.config.faceTopNav;
    _getData();
  }

  Future<List<AIModel>?> _getData() async {
    final result = await _aimain.aIListFaceMaterial(
      id: homeConfigNotifier.config.faceTopNav.first.id,
      sort: 'asc',
      type: homeConfigNotifier.config.faceSortNav.first.value ?? '',
      page: 1,
      limit: 0,//只为拿banners数据此参数设置为0节约流量
    );
    if (mounted) {
      setState(() {
      });
    }

    if (result.status == 1) {
      if (result.data?.banners case final data?
      when data.isNotEmpty && _bannersNotifier.value.isEmpty) {
        _bannersNotifier.value = data;
        titles = navs.map((model) => model.name).toList();
      }
      return result.data?.materials;
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
          child: _Header(bannersNotifier: _bannersNotifier),
        ),
      ],
      body: TabBarWithView.fillColor(
        tabBarPadding: EdgeInsets.symmetric(
            vertical: 6.w, horizontal: MyTheme.pagePadding),
        tabBarHeight: 32.w,
        isScrollable: true,
        labelStyle: MyTheme.white15,
        unselectedLabelStyle: MyTheme.whiteOpacity615w400,
        titles: titles,
        views: [
          for (final BitNavModel nav in navs)
            Container()
        ],
      ),
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
        SizedBox(height: 10.w),
      ],
    );
  }
}