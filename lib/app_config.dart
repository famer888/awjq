import 'package:flutter/foundation.dart' as fd;

class BuildConfig {
  static const key = fd.kIsWeb ? '6435a8c95c5ab9c0' : '6899ab796191b571';
  static const iv = fd.kIsWeb ? '3c451ea1fbd72f04' : '236ee31a968bd338';
  static const appKey = fd.kIsWeb
      ? 'e62c8d1db825a4f83861c3e74e9277f2'
      : 'c81cc86e312c375dfdbd2cc6e60515c6';
  static const ver = fd.kIsWeb ? 'v4' : 'v3';

  static const mediaKey = 'f5d965df75336270';
  static const mediaIv = '97b60394abc2fbe1';
  static const secretKey = 'f61acd3544f69e7e';
  static const secretIv = '2358a8801e7e53fc';
  static const defaultFdsKey =
      'aCwhyaDuBLBNyDbBCuJVzrKTwp7ctPx0ThvoJEFhXL9C9YGtPJqOmNE9ivKMy8hw';

  /// 备用接口线路
  static final apiLines = fd.kIsWeb
      ? [
          'https://bpi6.ufvmysfg.com/api.php',
          'https://lnx.ufvmysfg.com/api.php',
        ]
      : [
          'https://bpi3.ufvmysfg.com/api.php',
          'https://bpi4.ufvmysfg.com/api.php',
          'https://bpi5.ufvmysfg.com/api.php',
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
