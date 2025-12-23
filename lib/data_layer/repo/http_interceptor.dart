import 'dart:convert';

import 'package:awjq/ui_layer/utils/common_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' as fd;
import '../../app_global.dart';
import '../../crypto.dart';

class AutoEncryptAndDecryptInterceptor extends Interceptor {
  const AutoEncryptAndDecryptInterceptor(this._appInfo);

  final Map _appInfo;

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
    CommonUtils.log('url: ${options.uri.path} --- $data');
    // options.data = await fd.compute(PlatformAwareCrypto.encryptReqParams, data);
    options.data = PlatformAwareCrypto.encryptReqParams(data);
    return super.onRequest(options, handler);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.data case final Map data when data['data'] != null) {
      response.data =
          await fd.compute(PlatformAwareCrypto.decryptResData, response.data);
      // response.data = await PlatformAwareCrypto.decryptResData(response.data);
    }

    if (fd.kDebugMode) CommonUtils.log(jsonEncode(response.data));
    return super.onResponse(response, handler);
  }
}
