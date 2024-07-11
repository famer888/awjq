import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../../domain/model/ai_model.dart';
import '../../../../notifiers/home_config_notifier.dart';
import '../../../../notifiers/user_notifier.dart';
import '../../../../utils/common_utils.dart';
import '../../../../utils/my_toast.dart';
import '../../../common_widgets/my_image.dart';
import '../../../image_paths.dart';
import '../../../theme.dart';
import 'dart:developer' as developer;

class FaceSwapSheetView extends StatefulWidget {
  const FaceSwapSheetView({super.key, required this.data});

  final AIModel data;

  @override
  State<FaceSwapSheetView> createState() => _FaceSwapSheetViewState();
}

class _FaceSwapSheetViewState extends State<FaceSwapSheetView> {
  String _aiRule = ''; //换脸规则

  Map imgMap = {};

  final ImagePicker _picker = ImagePicker();
  late final homeConfigNotifier = context.read<HomeConfigNotifier>();
  late final userNotifier = context.read<UserNotifier>();

  @override
  void initState() {
    super.initState();

    _aiRule = tr('airuledesc');
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sheetHeight = ScreenUtil().screenHeight * 0.7;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: MyTheme.pagePadding),
      color: MyTheme.bgColor,
      height: sheetHeight,
      child: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 13.w),
                Center(
                  child: Text(
                    widget.data.title ?? '',
                    style: MyTheme.white20medium,
                    maxLines: 1,
                  ),
                ),
                SizedBox(height: 13.w),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              // _isChooseFaceImage = false;
                              // _showImagePicker();
                            },
                            child: Container(
                              width: double.infinity,
                              height: 200.w,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.05),
                                  borderRadius: BorderRadius.circular(7.w)),
                              child: MyImage.network(
                                widget.data.thumb ?? '',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Expanded(
                      child: Column(
                        children: [
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              // _isChooseFaceImage = true;//todo:
                              // showImagePicker();
                            },
                            child: Container(
                              width: double.infinity,
                              height: 200.w,
                              decoration: imgMap.isEmpty
                                  ? DottedDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(7.w)),
                                  shape: Shape.box,
                                  color: MyTheme.cyanColor00edfd,
                                  strokeWidth: 1.w)
                                  : null,
                              alignment: Alignment.center,
                              child: imgMap.isNotEmpty
                                  ? MyImage.network(imgMap['url'])
                                  : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyImage.asset(
                                    MyImagePaths.appUploadImg,
                                    width: 35.w,
                                    height: 35.w,
                                  ),
                                  SizedBox(height: 5.w),
                                  Text(
                                    tr('sclbtp'), //上传脸部图片
                                    style: MyTheme.white08_12,
                                  ),
                                  SizedBox(height: 5.w),
                                  Text(
                                    tr('tpdxbcg2mb'), //图片大小不超过2MB
                                    style: MyTheme.white06_10,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 13.w),
                Text(
                  tr('aizysx'), //注意事项
                  style: MyTheme.white15semibold,
                ),
                SizedBox(height: 10.w),
                Text(
                  _aiRule,
                  style: MyTheme.white06_12,
                  maxLines: 100,
                ),
                SizedBox(height: 25.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        MyImage.asset(
                          MyImagePaths.appAIFaceSampleCorrect,
                          width: 55.w,
                          height: 55.w,
                        ),
                        SizedBox(height: 8.w),
                        Text(
                          tr('zmwzd'),
                          style: MyTheme.white14,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        MyImage.asset(
                          MyImagePaths.appAIFaceSampleGlasses,
                          width: 55.w,
                          height: 55.w,
                        ),
                        SizedBox(height: 8.w),
                        Text(
                          tr('bzdmb'),
                          style: MyTheme.white14,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        MyImage.asset(
                          MyImagePaths.appAIFaceSampleMask,
                          width: 55.w,
                          height: 55.w,
                        ),
                        SizedBox(height: 8.w),
                        Text(
                          tr('bzdyj'),
                          style: MyTheme.white14,
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30.w),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  // onTap: _postSwapFace,//todo:
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: MyTheme.pagePadding),
                    height: 50.w,
                    decoration: BoxDecoration(
                      // color: StyleTheme.red220Color,
                        gradient: MyTheme.gradient_90_114,
                        borderRadius: BorderRadius.circular(25.w)),
                    child: Center(
                      child: Builder(builder: (context) {
                        String text = tr('tjdd');
                        //todo:
                        return Text(
                          text,
                          style: MyTheme.white16medium,
                        );
                      }),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(//关闭按钮
              top: 13.w,
              right: 0.w,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                child: MyImage.asset(
                  MyImagePaths.appCircleSlose,
                  width: 25.w,
                  height: 25.w,
                  fit: BoxFit.contain,
                ),
                onTap: () {
                  context.pop();
                },
              )),
        ],
      ),
    );
  }

  Future<void> _imagePickerAssets() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      bool flag = await CommonUtils.pngLimit2MSize(file);
      if (flag) return;
      uploadFileImg(file);
    }
  }

  //选择图片成功先生成服务器
  void uploadFileImg(XFile xFile) async {
    MyToast.showLoading(text: 'scz'.tr());
    final result = await homeConfigNotifier.uploadImage(xFile);

    developer.log('AI-换脸：图片上传返回数据：$result');

    if (result != null && result['code'] == 1) {
      final url = "${result['msg']}";

      final image = await decodeImageFromList(await xFile.readAsBytes());

      imgMap = {
        'url': url,
        'thumb_width': image.width,
        'thumb_height': image.height,
      };

      if (mounted) {
        setState(() {});
      }
    } else {
      MyToast.showText(text: result?['msg'] ?? 'failed');
    }
    MyToast.closeAllLoading();
  }
}
