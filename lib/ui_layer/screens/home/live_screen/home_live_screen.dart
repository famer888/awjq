import 'package:awjq/ui_layer/screens/bit/screen.dart';
import 'package:awjq/ui_layer/screens/common_widgets/my_app_bar.dart';
import 'package:awjq/ui_layer/screens/common_widgets/screen_background.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


class HomeLiveScreen extends StatefulWidget {
  const HomeLiveScreen({super.key});

  @override
  State<HomeLiveScreen> createState() => _HomeLiveScreenState();
}

class _HomeLiveScreenState extends State<HomeLiveScreen>{
  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
      child: Scaffold(
        appBar: MyAppBar(title: 'zhibo'.tr(context: context)),
        body: const LiveVideoContentView(),
      ),
    );
  }
}
