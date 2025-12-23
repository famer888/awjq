import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../domain/model/ai/ai_magic_record_model.dart';
import '../../../../../domain/remote_domain/domains/aimagic.dart';
import '../../../../../ui_layer/screens/common_widgets/keep_alive_wrapper.dart';
import '../../../../../ui_layer/screens/common_widgets/my_list_view.dart';
import '../../../../../ui_layer/screens/common_widgets/my_tab_bar.dart';
import '../../../../../ui_layer/screens/mine/ai_record/card/magic_record_card.dart';
import '../../../../../ui_layer/screens/theme.dart';
import 'package:provider/provider.dart';


class SomeScreen extends StatefulWidget {
  const SomeScreen({super.key, this.status});

  final int? status; //  0-待处理 1-处理中 2-切片中 3-已成功 4-已失败

  @override
  State<SomeScreen> createState() => _SomeScreenState();
}

class _SomeScreenState extends State<SomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
