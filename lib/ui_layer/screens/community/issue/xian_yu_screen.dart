import 'dart:convert';
import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../domain/domain.dart';
import '../../../../domain/type_def.dart';

import '../../../notifiers/home_config_notifier.dart';
import '../../common_widgets/screen_background.dart';
import '../../../utils/common_utils.dart';

import '../../../../domain/model/topic_model.dart';
import '../../../notifiers/user_notifier.dart';
import '../../../utils/my_toast.dart';
import '../../common_widgets/dialog/widgets/regular_dialog.dart';
import '../../common_widgets/my_app_bar.dart';
import '../../theme.dart';
import 'widgets/image_picker_grid.dart';
import 'widgets/input_field.dart';
import 'widgets/post_button.dart';
import 'widgets/toggle_is_open_field.dart';
import 'widgets/topic_field.dart';
import 'widgets/upload_hint_text.dart';
import 'widgets/video_picker_grid.dart';

class XianYuIssueScreen extends StatefulWidget {
  const XianYuIssueScreen({super.key});

  @override
  State<XianYuIssueScreen> createState() => _XianYuIssueScreenState();
}

class _XianYuIssueScreenState extends State<XianYuIssueScreen> {
  late final config = context.read<HomeConfigNotifier>().config;
  late final userNotifier = context.read<UserNotifier>();
  late final domain = context.read<CommunityDomain>();

  final video = {};

  /// 上传图片数量
  final List<Map> upList = [];

  /// 图片最大上传数
  final picLimit = 9;

  /// 是否公开
  final isOpenNotifier = ValueNotifier(true);

  /// 是否直播
  bool isLive = true;

  final topicNotifier = ValueNotifier<TopicModel?>(null);

  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final coinController = TextEditingController();
  final contactController = TextEditingController();

  Widget _buildMtxqView() => ValueListenableBuilder(
        valueListenable: topicNotifier,
        builder: (_, topic, __) {
          if (topic?.isAi == 1) {
            return Padding(
              padding: EdgeInsets.only(bottom: 20.w),
              child: Text(
                'mtxq'.tr(namedArgs: {
                  'name': topic?.name ?? '',
                  'amount': '${config.payAi}'
                }),
                style: MyTheme.red14,
                maxLines: 3,
              ),
            );
          }
          return const SizedBox.shrink();
        },
      );

  Widget _buildContent() => ValueListenableBuilder(
        valueListenable: topicNotifier,
        builder: (_, topic, __) {
          return Column(
            children: [
              InputField(
                controller: contentController,
                height: 150.w,
                hintText: 'rucpjs'.tr(),
              ),
              SizedBox(height: 20.w),
              ...topic?.isAi == 1
                  ? [ToggleIsOpenField(isOpenNotifier: isOpenNotifier)]
                  : [
                      InputField(
                        controller: contactController,
                        height: 42.w,
                        hintText: 'srlxfs'.tr(context: context),
                      ),
                      SizedBox(height: 20.w),
                      InputField(
                        controller: coinController,
                        height: 42.w,
                        hintText: topic?.type == 1
                            ? 'szjsjg'.tr(context: context)
                            : 'szspjg'.tr(context: context),
                        inputFormatter: [
                          FilteringTextInputFormatter(
                            RegExp('[0-9]'),
                            allow: true,
                          ),
                          LengthLimitingTextInputFormatter(3),
                        ],
                      ),
                    ],
              SizedBox(height: 20.w),
              UploadHintText(
                title: 'sctp'.tr(context: context),
                subTitle: '',
                text: 'zdjz'.tr(context: context),
              ),
              SizedBox(height: 10.w),
              ImagePickerGrid(
                upList: upList,
                picLimit: picLimit,
              ),
              SizedBox(height: 20.w),
              Column(
                children: [
                  UploadHintText(
                    title: tr('scsp'),
                    text: tr('zdybmxt'),
                  ),
                  SizedBox(height: 10.w),
                  VideoPickerGrid(upList: upList, video: video)
                ],
              ),
              SizedBox(height: 30.w),
            ],
          );
        },
      );

  /// 发布
  Future<void> _send() async {
    final topic = topicNotifier.value;
    if (topic == null) {
      MyToast.showText(
          text: 'q'.tr(context: context) + 'xzht'.tr(context: context));
      return;
    }
    if (titleController.text.isEmpty) {
      MyToast.showText(text: 'qsbtxx'.tr(context: context));
      return;
    }
    if (contentController.text.isEmpty) {
      MyToast.showText(text: 'qsnrxx'.tr(context: context));
      return;
    }

    String contact = contactController.text;

    if (topic.isAi == 1) {
      contact = '111111';
    }

    if (contact.isEmpty) {
      MyToast.showText(text: 'srlxfs'.tr(context: context));
      return;
    }

    List<Map> p = List.from(upList);
    //视频数据添加到尾部 不是必填字段
    final index = upList.indexWhere((el) => el['type'] == 1);
    if (index == -1 && video.isNotEmpty) {
      p.add(video);
    }

    MyToast.showLoading();
    try {
      final money = userNotifier.member.money - config.payAi;

      final result = await domain.communityPost(
        topicId: '${topic.id}',
        title: titleController.text,
        content: contentController.text,
        contact: contactController.text,
        type: 'fish',
        coins: coinController.text.isEmpty ? '0' : coinController.text,
        medias: jsonEncode(p),
        isPublic: isOpenNotifier.value ? 1 : 0,
      );
      BotToast.closeAllLoading();
      if (result.status == 1) {
        if (money > 0) {
          userNotifier.setMoney(money: money);
        }

        if (mounted) {
          CommonUtils.showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => RegularDialog(
              title: 'fbcg'.tr(context: context),
              buttonText: 'qd'.tr(context: context),
              confirmOnTap: () {
                context.pop();
                context.pop();
              },
              content: DefaultTextStyle(
                style: MyTheme.gray203_13,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'fbcgdsh'.tr(context: context),
                      style: MyTheme.gray203_13,
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      } else {
        MyToast.showText(text: result.msg ?? '');
      }
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
      child: Scaffold(
        appBar: MyAppBar(
          title: 'fbcp'.tr(context: context),
          rightWidget: PostButton(
            onTap: _send,
          ),
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MyTheme.pagePadding,
                vertical: 16.w,
              ),
              child: Column(
                children: [
                  _buildMtxqView(),
                  FishTopicField(topicNotifier: topicNotifier),
                  SizedBox(height: 30.w),
                  InputField(
                    controller: titleController,
                    height: 42.w,
                    hintText: 'tbtxx'.tr(context: context),
                  ),
                  SizedBox(height: 20.w),
                  _buildContent(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
