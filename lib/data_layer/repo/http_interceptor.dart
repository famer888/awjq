import 'dart:convert';

import 'package:awjq/ui_layer/utils/common_utils.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart' as fd;
import 'package:flutter/material.dart';
import '../../app_global.dart';
import '../../crypto.dart';
import '../../ui_layer/screens/common_widgets/dialog/widgets/regular_dialog.dart';
import '../../ui_layer/screens/theme.dart';

class AutoEncryptAndDecryptInterceptor extends Interceptor {
  const AutoEncryptAndDecryptInterceptor(this._appInfo);

  final Map _appInfo;
  static bool _warnJump = false;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final Map data = {..._appInfo};
    if (options.data != null) {
      data.addAll(options.data);
    }
    if (AppGlobal.reportTraceId.isNotEmpty) {
      data['trace_id'] = AppGlobal.reportTraceId;
    }
    if (AppGlobal.affXCode.isNotEmpty) {
      data['aff_x_code'] = AppGlobal.affXCode;
    }
    CommonUtils.log('url: ${options.uri.path} --- $data');
    // options.data = await fd.compute(PlatformAwareCrypto.encryptReqParams, data);
    options.data = PlatformAwareCrypto.encryptReqParams(data);
    return super.onRequest(options, handler);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.data case final Map data when data['data'] != null) {
      Map<dynamic, dynamic> result = Map.from(response.data);
      String sign = result.remove("sign").toString();
      if (PlatformAwareCrypto.makeSign(result, appKey) != sign && !_warnJump) {
        _warnJump = true;
        String officeSite = AppGlobal.officeSite;
        //弹出告警提示
        BotToast.showWidget(
            toastBuilder: (cancelFunc) => Stack(
                  children: [
                    AbsorbPointer(),
                    RegularDialog(
                      title: '',
                      content: Text('sjjysb'.tr(), style: MyTheme.gray153_14),
                      buttonText: 'qr'.tr(),
                      confirmOnTap: () {
                        CommonUtils.launchUrl(officeSite);
                      },
                    ),
                  ],
                ));
      }

      response.data =
          await fd.compute(PlatformAwareCrypto.decryptResData, response.data);
      // response.data = await PlatformAwareCrypto.decryptResData(response.data);
    }

    if (fd.kDebugMode) CommonUtils.log(jsonEncode(response.data));
    return super.onResponse(response, handler);
  }
}
