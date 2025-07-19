import 'package:flutter/foundation.dart';

class BuildConfig {
  static const key = '2acf7e91e9864673';
  static const iv = '1c29882d3ddfcfd6';
  static const appKey = '5589d41f92a597d016b037ac37db243d';
  static const mediaKey = 'f5d965df75336270';
  static const mediaIv = '97b60394abc2fbe1';
  static const secretKey = 'f61acd3544f69e7e';
  static const secretIv = '2358a8801e7e53fc';
  static const defaultFdsKey =
      'aCwhyaDuBLBNyDbBCuJVzrKTwp7ctPx0ThvoJEFhXL9C9YGtPJqOmNE9ivKMy8hw';

  /// 备用接口线路
  static final apiLines = kIsWeb
      ? [
          'https://bpi3.tyfmbcyr.xyz/api.php',
          'https://lnx.tyfmbcyr.xyz/api.php',
        ]
      : [
          'https://bpi3.tyfmbcyr.xyz/api.php',
          'https://bpi4.tyfmbcyr.xyz/api.php',
          'https://bpi5.tyfmbcyr.xyz/api.php',
        ];

  /// 备用线路
  static const githubLine =
      'https://raw.githubusercontent.com/ailiu258099-blip/master/main/awjq.txt';

  static final fdsKeyApi = [
    'https://wvseee.jsbacjr.com/aw.txt',
    'https://gitee.com/fdsaw/ffewelmcxww/raw/master/aw.txt',
  ];

  /// 跳转webview路径
  static const webViewPathName = 'ktloadwebview';

  static const affCodeKey = 'awjq_aff';

  static const webBundleId = 'com.pwa.awjq';

  static const cacheKeys = (
    appBox: 'awjqbox',
    chats: 'awjqbox_Chats',
    videoBox: 'awjq_video_box',
    imageBox: 'awjqbox_ImageCache',
    imageCacheSalt: 'MxqtSeXnRz',
  );
}
