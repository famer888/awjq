import 'package:flutter/widgets.dart';
import '/domain/model/home_data_model.dart';

class AppGlobal {
  static String m3u8Encrypt = '0';

  static BuildContext? context;

  static ReportConfig? reportConfig;
  static String reportAppId = '';

  static String reportTraceId = '';
  static String affXCode = '';
}
