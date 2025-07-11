import '../../../../domain/model/ai_model.dart';
import '../../../../domain/model/bit_nav_model.dart';
import '../../../../domain/remote_domain/domains/ai.dart';
import '../../../const.dart';
import '../../../notifiers/home_config_notifier.dart';
import '../../common_widgets/my_list_view.dart';
import '../../theme.dart';
import '../../../utils/my_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../widgets/card/material_card.dart';

class FaceSwapView extends StatefulWidget {
  const FaceSwapView({super.key, required this.faceTopNav});
  final BitNavModel faceTopNav;
  @override
  State<FaceSwapView> createState() => _FaceSwapViewState();
}

class _FaceSwapViewState extends State<FaceSwapView> {
  late final _aImain = context.read<AIDomain>();
  late final homeConfigNotifier = context.read<HomeConfigNotifier>();

  Future<List<AIModel>?> _getData(
      {required int page, required int pageSize}) async {
    final result = await _aImain.aIListFaceMaterial(
      id: widget.faceTopNav.id,
      page: page,
      limit: pageSize,
    );
    if (mounted) {
      setState(() {
      });
    }

    if (result.status == 1) {
      return result.data?.materials;
    } else {
      MyToast.showText(text: result.msg ?? '');
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MyListView.grid(
      childAspectRatio: UILayerConst.aIRatio,
      contentPadding: 15.w,
      padding: EdgeInsets.only(top: 8.w, left: MyTheme.pagePadding, right: MyTheme.pagePadding, bottom: MyTheme.pagePadding),
      itemBuilder: (context, item, index) => MaterialCard(data: item),
      onFetchingMore: (currentPage, pageSize) => _getData(
          page: currentPage, pageSize: pageSize),
    );
  }
}