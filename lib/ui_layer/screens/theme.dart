import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTheme {
  static final TextStyle whiteOpacity612w400 = TextStyle(
    color: Colors.white.withOpacity(0.6),
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle whiteOpacity614w400 = TextStyle(
      color: Colors.white.withOpacity(0.6),
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      overflow: TextOverflow.visible,
      decoration: TextDecoration.none);

  static final TextStyle whiteOpacity615w400 = TextStyle(
      color: Colors.white.withOpacity(0.6),
      fontSize: 15.sp,
      fontWeight: FontWeight.w400,
      overflow: TextOverflow.visible,
      decoration: TextDecoration.none);

  static final TextStyle whiteOpacity616w400 = TextStyle(
      color: Colors.white.withOpacity(0.6),
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      overflow: TextOverflow.visible,
      decoration: TextDecoration.none);

  static final TextStyle white14w400 = TextStyle(
      color: Colors.white,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);
  static final TextStyle yellow16w600 = TextStyle(
      color: const Color(0xFFECAE37),
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.visible,
      decoration: TextDecoration.none);
  static final TextStyle white12w500 = TextStyle(
    color: Colors.white,
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle yellow9 = TextStyle(
      color: const Color.fromRGBO(255, 157, 18, 1),
      fontSize: 9.sp,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle yellow16w400 = TextStyle(
      color: const Color(0xFFECAE37),
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white12Normal = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none);

  static const Color rsColor = Color(0xFFECAE37);

  static final TextStyle rszb16w600 = TextStyle(
      color: rsColor,
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);
  static final TextStyle yellow12w500 = TextStyle(
    color: const Color(0xFFECAE37),
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle whiteOpacity612w500 = TextStyle(
      color: Colors.white.withOpacity(0.6),
      fontSize: 12.sp,
      fontWeight: FontWeight.w500);

  static final TextStyle whiteOpacity614w500 = TextStyle(
      color: Colors.white.withOpacity(0.6),
      fontSize: 14.sp,
      fontWeight: FontWeight.w500);

  ///@@@@@@@@@@

  static const gradient_90_114_colors = [
    Color.fromRGBO(90, 75, 235, 1),
    Color.fromRGBO(114, 98, 242, 1)
  ];

  static const LinearGradient gradient_90_114 = LinearGradient(
    colors: gradient_90_114_colors,
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient gradient_228_246 = LinearGradient(
    colors: [
      Color.fromRGBO(228, 177, 145, 1),
      Color.fromRGBO(246, 222, 199, 1)
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static final InputBorder inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(0.0),
    borderSide: const BorderSide(color: Colors.transparent, width: 0),
  );

  // 页面通用边距
  static double get pagePadding => 13.w;

  // 栏目顶部导航高度
  static double get navbarHegiht => 44.w;

  static const Color bgColor = Color.fromRGBO(11, 11, 33, 1);
  static const Color naviColor = Color.fromRGBO(11, 11, 33, 1);
  static const Color imageBgColor = Color.fromRGBO(255, 255, 255, 0.03);
  static const Color white02Color = Color.fromRGBO(255, 255, 255, 0.2);
  static const Color white08Color = Color.fromRGBO(255, 255, 255, 0.8);

  static const Color white06Color = Color.fromRGBO(255, 255, 255, 0.6);
  static const Color blackColor18 = Color.fromRGBO(18, 18, 18, 1);
  static const Color blackColor25 = Color.fromRGBO(25, 25, 25, 1);
  static const Color blackColor22 = Color.fromRGBO(22, 22, 22, 1);
  static const Color blackColor32 = Color.fromRGBO(32, 32, 32, 1);
  static const Color blackColor36 = Color.fromRGBO(36, 36, 36, 1);
  static const Color blackColor38 = Color.fromRGBO(38, 38, 38, 1);
  static const Color blackColor49 = Color.fromRGBO(49, 49, 49, 1);
  static const Color blackColor61 = Color.fromRGBO(61, 61, 61, 1);
  static const Color blackColor25505 = Color.fromRGBO(0, 0, 0, 0.5);

  static const Color bloodOrange2501046 = Color.fromRGBO(250, 104, 6, 1);
  static const Color bloodOrange2557710 = Color.fromRGBO(255, 77, 11, 1);
  static const Color bloodOrange2551020 = Color.fromRGBO(255, 102, 0, 1);
  static const Color bloodOrange255702 = Color.fromRGBO(253, 70, 2, 1);
  static const Color brownColor = Color.fromRGBO(114, 47, 7, 1);
  static const Color brownColor91_60_44 = Color.fromRGBO(118, 75, 51, 1);
  static const Color grayColor180 = Color.fromRGBO(180, 180, 180, 1);
  static const Color grayColor150 = Color.fromRGBO(150, 150, 150, 1);
  static const Color orange24718713 = Color.fromRGBO(247, 187, 13, 1);

  static const Color goldColor234_202_147 = Color.fromRGBO(234, 202, 147, 1);

  static const Color blueColor81_151_241 = Color.fromRGBO(94, 79, 236, 1);

  static const Color cyanColor00edfd = Color.fromRGBO(94, 79, 236, 1);

  static const Color jellyCyanColor103224185 = Color.fromRGBO(94, 79, 236, 1);

  static const Color jellyCyanColor108235220 = Color.fromRGBO(108, 235, 220, 1);

  static final TextStyle bloodOrange2557710_14 = TextStyle(
      color: bloodOrange2557710,
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle bloodOrange255702_15 = TextStyle(
      color: bloodOrange255702,
      fontSize: 15.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);
  static final TextStyle bloodOrange255702_15medium = TextStyle(
      color: bloodOrange255702,
      fontSize: 15.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle brown11medium = TextStyle(
      color: brownColor,
      fontSize: 11.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  static final TextStyle brown916044_12medium = TextStyle(
      color: brownColor91_60_44,
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  static final TextStyle brown916044_12semibold = TextStyle(
      color: brownColor91_60_44,
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none);

  static final TextStyle hex5c402b_12_S = TextStyle(
      color: const Color(0xff5c402b),
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none);

  static final TextStyle brown916044_14medium = TextStyle(
      color: brownColor91_60_44,
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  static final TextStyle brown1187551_12_semi = TextStyle(
      color: const Color.fromRGBO(118, 75, 51, 1),
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none);

  static final TextStyle brown1187551_24_semi = TextStyle(
      color: const Color.fromRGBO(118, 75, 51, 1),
      fontSize: 24.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none);

  static final TextStyle hex5c402b_24_S = TextStyle(
      color: const Color(0xff5c402b),
      fontSize: 24.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none);

  static final TextStyle brown916044_24semibold = TextStyle(
      color: brownColor91_60_44,
      fontSize: 24.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none);

  static final TextStyle gold12 = TextStyle(
      color: const Color.fromRGBO(255, 219, 178, 1),
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      // fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);
  static final TextStyle gold12medium = TextStyle(
      color: const Color.fromRGBO(255, 219, 178, 1),
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);
  static final TextStyle gold12semibold = TextStyle(
      color: const Color.fromRGBO(255, 219, 178, 1),
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none);

  static final TextStyle hexffdbb2_13 = TextStyle(
      color: const Color(0xffc7a87f),
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gold14medium = TextStyle(
      color: const Color.fromRGBO(255, 219, 178, 1),
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  static final TextStyle hexf2c774_14 = TextStyle(
      color: const Color(0xfff2c774),
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  static final TextStyle gold15 = TextStyle(
      color: const Color.fromRGBO(255, 219, 178, 1),
      fontSize: 15.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gold18M = TextStyle(
      color: const Color.fromRGBO(255, 219, 178, 1),
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle copper13 = TextStyle(
      color: const Color.fromRGBO(238, 196, 171, 1),
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle copper35 = TextStyle(
      color: const Color.fromRGBO(238, 196, 171, 1),
      fontSize: 35.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle copper25 = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 25.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  // 字体样式
  static final TextStyle black51_15_M = TextStyle(
      color: const Color.fromRGBO(51, 51, 51, 1),
      fontSize: 15.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  static final TextStyle black51_15 = TextStyle(
      color: const Color.fromRGBO(51, 51, 51, 1),
      fontSize: 15.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray150_12 = TextStyle(
      color: const Color.fromRGBO(153, 153, 153, 1),
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray150_14 = TextStyle(
      color: const Color.fromRGBO(150, 150, 150, 1),
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle black51_20_M = TextStyle(
      color: const Color.fromRGBO(51, 51, 51, 1),
      fontSize: 20.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  static final TextStyle black51_18_B = TextStyle(
      color: const Color.fromRGBO(51, 51, 51, 1),
      fontSize: 18.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none);

  static final TextStyle black26_18_semi = TextStyle(
      color: const Color.fromRGBO(26, 26, 26, 1),
      fontSize: 18.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none);

  static final TextStyle black26_15_M = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 15.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  static final TextStyle gray192_12 = TextStyle(
      color: const Color.fromRGBO(192, 192, 192, 1),
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);
  static final TextStyle gray192_13 = TextStyle(
      color: const Color.fromRGBO(192, 192, 192, 1),
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray199_13 = TextStyle(
      color: const Color.fromRGBO(180, 180, 180, 1),
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray198_13 = TextStyle(
      color: const Color.fromRGBO(198, 198, 198, 1),
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray205_14 = TextStyle(
      color: const Color.fromRGBO(205, 205, 205, 1),
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray205_14_B = TextStyle(
      color: const Color.fromRGBO(205, 205, 205, 1),
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none);

  static final TextStyle hex00edfd_11 = TextStyle(
      color: const Color(0xff00edfd),
      fontSize: 11.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.normal,
      decoration: TextDecoration.none);

  static final TextStyle hex00edfd_20_M = TextStyle(
      color: const Color(0xff00edfd),
      fontSize: 20.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  static final TextStyle gray192_14 = TextStyle(
      color: const Color.fromRGBO(192, 192, 192, 1),
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray192_14_B = TextStyle(
      color: const Color.fromRGBO(192, 192, 192, 1),
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none);

  static final TextStyle white233_12 = TextStyle(
      color: const Color.fromRGBO(233, 233, 233, 1),
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white232_13 = TextStyle(
      color: const Color.fromRGBO(232, 232, 232, 1),
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white232_14 = TextStyle(
      color: const Color.fromRGBO(232, 232, 232, 1),
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white236_14 = TextStyle(
      color: const Color.fromRGBO(236, 236, 236, 1),
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);
  static final TextStyle white237_14 = TextStyle(
      color: const Color.fromRGBO(237, 237, 237, 1),
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white232_13_B = TextStyle(
      color: const Color.fromRGBO(232, 232, 232, 1),
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none);

  static final TextStyle white232_16 = TextStyle(
      color: const Color.fromRGBO(232, 232, 232, 1),
      fontSize: 16.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white232_12 = TextStyle(
      color: const Color.fromRGBO(232, 232, 232, 1),
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray192_13_B = TextStyle(
      color: const Color.fromRGBO(192, 192, 192, 1),
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none);

  static final TextStyle gray105_12 = TextStyle(
      color: const Color.fromRGBO(105, 105, 105, 1),
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray105_16_M = TextStyle(
      color: const Color.fromRGBO(105, 105, 105, 1),
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray137_14_M = TextStyle(
      color: const Color.fromRGBO(137, 137, 137, 1),
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  static final TextStyle gray139_18 = TextStyle(
      color: const Color.fromRGBO(139, 139, 139, 1),
      fontSize: 18.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle graya3a2a2_10 = TextStyle(
      color: const Color(0xffffffff),
      fontSize: 10.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle graya8f8f8f_11 = TextStyle(
      color: const Color.fromRGBO(149, 148, 156, 1),
      fontSize: 11.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle graya3a2a2_11 = TextStyle(
      color: const Color(0xff949494),
      fontSize: 11.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle graya3a2a2_11_M = TextStyle(
      color: const Color(0xffffffff),
      fontSize: 11.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);
  static final TextStyle graya3a2a2_12 = TextStyle(
      color: const Color(0xffffffff),
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);
  static final TextStyle gray8f8e90_13 = TextStyle(
      color: const Color(0xff8f8e90),
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle graya3a2a2_13 = TextStyle(
      color: const Color(0xffffffff),
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray666_13 = TextStyle(
      color: const Color(0xff666666),
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle graya3a2a2_15 = TextStyle(
      color: const Color(0xffffffff),
      fontSize: 15.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);
  static final TextStyle grayaaa9a8_11 = TextStyle(
      color: const Color(0xffaaa9a8),
      fontSize: 11.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);
  static final TextStyle grayaaa9a8_13 = TextStyle(
      color: const Color(0xffaaa9a8),
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);
  static final TextStyle gray105_11 = TextStyle(
      color: const Color.fromRGBO(105, 105, 105, 1),
      fontSize: 11.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white255_8 = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 8.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle brown137_8 = TextStyle(
      color: const Color.fromRGBO(137, 88, 60, 1),
      fontSize: 8.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white255_10 = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 10.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white255_10_B = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 10.sp,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle brown_10_B = TextStyle(
      color: const Color.fromRGBO(137, 88, 60, 1),
      fontSize: 10.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white254_12 = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 10.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray168_9 = TextStyle(
      color: const Color.fromRGBO(168, 167, 171, 1),
      fontSize: 9.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray168_16_M = TextStyle(
      color: const Color.fromRGBO(153, 153, 153, 1),
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray213_12 = TextStyle(
      color: const Color.fromRGBO(213, 213, 213, 1),
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray213_13 = TextStyle(
      color: const Color.fromRGBO(213, 213, 213, 1),
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  static final TextStyle gray202_14_B = TextStyle(
      color: const Color.fromRGBO(202, 202, 202, 1),
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none);

  static final TextStyle gray202_14 = TextStyle(
      color: const Color.fromRGBO(202, 202, 202, 1),
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray204_14 = TextStyle(
      color: const Color.fromRGBO(204, 204, 204, 1),
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray240_14 = TextStyle(
      color: const Color.fromRGBO(240, 239, 244, 1),
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray204_15 = TextStyle(
      color: const Color.fromRGBO(204, 204, 204, 1),
      fontSize: 15.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);
  static final TextStyle gray204_15medium = TextStyle(
      color: const Color.fromRGBO(204, 204, 204, 1),
      fontSize: 15.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);
  static final TextStyle gray204_18 = TextStyle(
      color: const Color.fromRGBO(204, 204, 204, 1),
      fontSize: 18.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray203_14medium = TextStyle(
      color: const Color.fromRGBO(203, 203, 203, 1),
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  static final TextStyle gray203_11 = TextStyle(
      color: const Color.fromRGBO(203, 202, 200, 1),
      fontSize: 11.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray203_12 = TextStyle(
      color: const Color.fromRGBO(203, 202, 200, 1),
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray203_13 = TextStyle(
      color: const Color.fromRGBO(190, 189, 194, 1),
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray203_16 = TextStyle(
      color: const Color.fromRGBO(190, 189, 194, 1),
      fontSize: 16.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle orange247_13 = TextStyle(
      color: orange24718713,
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle orange247_15 = TextStyle(
      color: orange24718713,
      fontSize: 15.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray203_13_T = TextStyle(
      color: const Color.fromRGBO(203, 202, 200, 1),
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.lineThrough);

  static final TextStyle gray203_15medium = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, .8),
      fontSize: 15.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  static final TextStyle gray203_18medium = TextStyle(
      color: const Color.fromRGBO(203, 203, 203, 1),
      fontSize: 18.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  static final TextStyle gray168_12 = TextStyle(
      color: const Color.fromRGBO(168, 167, 171, 1),
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray163_10 = TextStyle(
      color: const Color.fromRGBO(163, 162, 162, 1),
      fontSize: 10.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray163_11 = TextStyle(
      color: const Color.fromRGBO(198, 199, 217, 1),
      fontSize: 11.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray190_12 = TextStyle(
      color: const Color.fromRGBO(190, 189, 194, 1),
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray163_12 = TextStyle(
      color: const Color.fromRGBO(163, 162, 162, 1),
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray163_13 = TextStyle(
      color: const Color.fromRGBO(74, 74, 74, 1),
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray163_14_M = TextStyle(
      color: const Color.fromRGBO(163, 162, 162, 1),
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  static final TextStyle gray163_15 = TextStyle(
      color: const Color.fromRGBO(163, 162, 162, 1),
      fontSize: 15.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray109_15 = TextStyle(
      color: const Color.fromRGBO(109, 109, 114, 1),
      fontSize: 15.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray168_13 = TextStyle(
      color: const Color.fromRGBO(168, 167, 171, 1),
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray95_13 = TextStyle(
      color: const Color.fromRGBO(168, 167, 171, 1),
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white255_22_B = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 22.sp,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white255_22_M = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 22.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white253_22_B = TextStyle(
      color: const Color.fromRGBO(253, 70, 2, 1),
      fontSize: 22.sp,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white255_24_B = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 24.sp,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white255_20_B = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white255_25_B = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 25.sp,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white255_20_M = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white255_24_M = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 24.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white255_24_S = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white255_20_S = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle hex666666_20_S = TextStyle(
      color: const Color(0xff666666),
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle hex666666_24_S = TextStyle(
      color: const Color(0xff666666),
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white255_18_B = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 18.sp,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white23_18 = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 18.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white255_18_M = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle brown_996619_13_M = TextStyle(
      color: const Color.fromRGBO(99, 66, 19, 1),
      fontSize: 13.sp,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle brown_1378860_14_M = TextStyle(
      color: const Color.fromRGBO(137, 88, 60, 1),
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle brown72_18 = TextStyle(
      color: const Color.fromRGBO(72, 23, 14, 1),
      fontSize: 18.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle brown248_18 = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 18.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white238_18_B = TextStyle(
      color: const Color.fromRGBO(238, 196, 171, 1),
      fontSize: 18.sp,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white81_18_M = TextStyle(
      color: const Color.fromRGBO(81, 43, 24, 1),
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle yellow255_15_M = TextStyle(
      color: const Color.fromRGBO(255, 189, 57, 1),
      fontSize: 15.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white255_18 = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 18.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle blue80_18 = TextStyle(
      color: const Color.fromRGBO(80, 237, 255, 1),
      fontSize: 18.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle blue80_18_M = TextStyle(
      color: const Color.fromRGBO(80, 237, 255, 1),
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle blue80_11 = TextStyle(
      color: MyTheme.jellyCyanColor103224185,
      fontSize: 11.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle blue80_11_M = TextStyle(
      color: const Color.fromRGBO(80, 237, 255, 1),
      fontSize: 11.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  static final TextStyle blue80_12 = TextStyle(
      color: const Color.fromRGBO(80, 237, 255, 1),
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle blue80_13_M = TextStyle(
      color: MyTheme.jellyCyanColor103224185,
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  static final TextStyle blue80_13_M_Line = TextStyle(
      color: MyTheme.jellyCyanColor103224185,
      fontSize: 13.sp,
      decoration: TextDecoration.underline,
      decorationColor: jellyCyanColor103224185,
  );

  static final TextStyle blue96_13_M = TextStyle(
      color: MyTheme.jellyCyanColor103224185,
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  static final TextStyle blue80_14_M = TextStyle(
      color: MyTheme.jellyCyanColor103224185,
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  static final TextStyle blue80_16_M = TextStyle(
      color: const Color.fromRGBO(80, 237, 255, 1),
      fontSize: 16.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  static final TextStyle blue80_15_M = TextStyle(
      color: MyTheme.jellyCyanColor103224185,
      fontSize: 15.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  static final TextStyle blue80_15 = TextStyle(
      color: MyTheme.jellyCyanColor103224185,
      fontSize: 15.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white255_15 = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 15.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray143_15 = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 15.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white9255_15 = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 15.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white255_16_M = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white25508_16_M = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 0.8),
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white244_16 = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 16.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white244_16_M = TextStyle(
      color: const Color.fromRGBO(244, 244, 244, 1),
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white244_20_M = TextStyle(
      color: const Color.fromRGBO(244, 244, 244, 1),
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle teal103224185_20_M = TextStyle(
      color: MyTheme.jellyCyanColor103224185,
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle teal103224185_18_M = TextStyle(
      color: MyTheme.jellyCyanColor103224185,
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white255_12 = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle greent113_12 = TextStyle(
      color: const Color.fromRGBO(113, 135, 184, 1),
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white255_12_M_T = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.lineThrough);

  static final TextStyle white255_12_semibold = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none);

  static final TextStyle white255_11 = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 11.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white255_11_03 = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 0.3),
      fontSize: 11.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle black0d141f_11 = TextStyle(
      color: const Color.fromRGBO(26, 26, 31, 1),
      fontSize: 11.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle black0d141f_11_M = TextStyle(
      color: const Color.fromRGBO(26, 26, 31, 1),
      fontSize: 11.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white255_11_B = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 11.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none);

  static final TextStyle white127_11_B = TextStyle(
      color: const Color.fromRGBO(127, 72, 26, 1),
      fontSize: 11.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none);

  static final TextStyle white217_12 = TextStyle(
      color: const Color.fromRGBO(217, 218, 218, 1),
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none);

  static final TextStyle white255_13 = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white23_12 = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white255_13_T = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.lineThrough);

  static final TextStyle gry30_14_M = TextStyle(
      color: const Color.fromRGBO(30, 30, 30, 1),
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle yellow253_14_M = TextStyle(
      color: const Color.fromRGBO(253, 70, 2, 1),
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray30_14_M_T = TextStyle(
      color: const Color.fromRGBO(30, 30, 30, 1),
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.lineThrough);

  static final TextStyle white_13 = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 13.sp,
      fontWeight: FontWeight.w400,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white255_13_M = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 13.sp,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white255_13_B = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 13.sp,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white255_12_B = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none);

  static final TextStyle white255_12_M = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  static final TextStyle red255_12_M = TextStyle(
      color: const Color.fromRGBO(255, 69, 0, 1),
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  static final TextStyle black84_14 = TextStyle(
      color: const Color.fromRGBO(84, 84, 84, 1),
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white255_14 = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white255_14_place = TextStyle(
      color: const Color.fromRGBO(255, 93, 95, 0.8),
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white255_14_B = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none);

  static final TextStyle white255_14_M = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  static final TextStyle white255_14_N = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.normal,
      decoration: TextDecoration.none);

  static final TextStyle white255_14_M_V = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 14.sp,
      overflow: TextOverflow.clip,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  static final TextStyle white255_15_M = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 15.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  static final TextStyle yellowffbd39_15_M = TextStyle(
      color: const Color(0xffffbd39),
      fontSize: 15.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  static final TextStyle white255_15_semibold = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 15.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none);

  static final TextStyle white95_15_semibold = TextStyle(
      color: const Color.fromRGBO(168, 167, 171, 1),
      fontSize: 15.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none);

  static final TextStyle white_17 = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 17.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.normal,
      decoration: TextDecoration.none);

  static final TextStyle white234_12 = TextStyle(
      color: const Color.fromRGBO(234, 234, 234, 1),
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white234_15_M = TextStyle(
      color: const Color.fromRGBO(234, 234, 234, 1),
      fontSize: 15.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle red2555713_11 = TextStyle(
      color: blueColor81_151_241,
      fontSize: 11.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray118_12 = TextStyle(
      color: const Color.fromRGBO(118, 118, 118, 1),
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray118_12_M = TextStyle(
      color: const Color.fromRGBO(118, 118, 118, 1),
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);
  static final TextStyle gray128_11 = TextStyle(
      color: const Color.fromRGBO(128, 128, 128, 1),
      fontSize: 11.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);
  static final TextStyle gray666666_11 = TextStyle(
      color: const Color(0xff666666),
      fontSize: 11.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);
  static final TextStyle gray180_12 = TextStyle(
      color: const Color.fromRGBO(180, 180, 180, 1),
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray180_12medium = TextStyle(
      color: const Color.fromRGBO(180, 180, 180, 1),
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray123_14 = TextStyle(
      color: const Color.fromRGBO(123, 123, 123, 1),
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray148_12 = TextStyle(
      color: const Color.fromRGBO(148, 148, 148, 1),
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray180_14 = TextStyle(
      color: const Color.fromRGBO(153, 153, 153, 0.8),
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray180_14medium = TextStyle(
      color: const Color.fromRGBO(180, 180, 180, 1),
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  static final TextStyle gray180_14_line = TextStyle(
      color: const Color.fromRGBO(180, 180, 180, 1),
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  static final TextStyle gray180_13 = TextStyle(
      color: const Color.fromRGBO(180, 180, 180, 1),
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray180_14_T = TextStyle(
      color: const Color.fromRGBO(180, 180, 180, 1),
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.lineThrough);

  static final TextStyle gray180_13medium = TextStyle(
      color: const Color.fromRGBO(180, 180, 180, 1),
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  static final TextStyle gray180_15_M = TextStyle(
      color: const Color.fromRGBO(153, 153, 153, 1),
      fontSize: 15.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray180_15 = TextStyle(
      color: const Color.fromRGBO(180, 180, 180, 1),
      fontSize: 15.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray180_16_B = TextStyle(
      color: const Color.fromRGBO(180, 180, 180, 1),
      fontSize: 16.sp,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray206_12 = TextStyle(
      color: const Color.fromRGBO(206, 206, 206, 1),
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray153_13 = TextStyle(
      color: const Color.fromRGBO(153, 153, 153, 1),
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);
  static final TextStyle gray153_14 = TextStyle(
      color: const Color.fromRGBO(153, 153, 153, 1),
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray127_14 = TextStyle(
      color: const Color.fromRGBO(153, 153, 153, 1),
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray153_14_M = TextStyle(
      color: const Color.fromRGBO(153, 153, 153, 1),
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray153_11 = TextStyle(
      color: const Color.fromRGBO(153, 153, 153, 1),
      fontSize: 11.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray102_13 = TextStyle(
      color: const Color.fromRGBO(102, 102, 102, 1),
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray102_14 = TextStyle(
      color: const Color.fromRGBO(102, 102, 102, 1),
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray102_15 = TextStyle(
      color: const Color.fromRGBO(102, 102, 102, 1),
      fontSize: 15.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray102_12 = TextStyle(
      color: const Color.fromRGBO(102, 102, 102, 1),
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray234_14 = TextStyle(
      color: const Color.fromRGBO(234, 234, 236, 1),
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray208_13 = TextStyle(
      color: const Color.fromRGBO(218, 218, 218, 1),
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle yellow255_11 = TextStyle(
      color: const Color.fromRGBO(255, 77, 11, 1),
      fontSize: 11.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle yellow255_14_M = TextStyle(
      color: const Color.fromRGBO(255, 73, 0, 1),
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle yellow255_12 = TextStyle(
      color: const Color.fromRGBO(255, 77, 11, 1),
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle yellow255_13 = TextStyle(
      color: const Color.fromRGBO(255, 77, 11, 1),
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle yellow255_15 = TextStyle(
      color: const Color(0xFFFF4D0B),
      fontSize: 15.sp,
      decoration: TextDecoration.underline);

  static final TextStyle yellow255_16_B = TextStyle(
      color: const Color.fromRGBO(255, 77, 11, 1),
      fontSize: 16.sp,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle yellow255_14_B = TextStyle(
      color: const Color.fromRGBO(255, 77, 11, 1),
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray30_14 = TextStyle(
      color: const Color.fromRGBO(30, 30, 30, 1),
      fontSize: 14.sp,
      decoration: TextDecoration.none);

  static final TextStyle gray169_14 = TextStyle(
      color: const Color.fromRGBO(169, 169, 169, 1),
      fontSize: 14.sp,
      decoration: TextDecoration.none);

  static final TextStyle gray172_14 = TextStyle(
      color: const Color.fromRGBO(110, 110, 123, 1),
      fontSize: 14.sp,
      decoration: TextDecoration.none);

  static final TextStyle gray172_17 = TextStyle(
      color: const Color.fromRGBO(172, 171, 176, 1),
      fontSize: 17.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.normal,
      decoration: TextDecoration.none);

  static final TextStyle gray168_15 = TextStyle(
      color: const Color.fromRGBO(168, 168, 168, 1),
      fontSize: 15.sp,
      decoration: TextDecoration.none);

  static final TextStyle yellow240_15 = TextStyle(
      color: const Color.fromRGBO(240, 96, 0, 1),
      fontSize: 15.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray157_14 = TextStyle(
      color: const Color.fromRGBO(157, 157, 157, 1),
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray214_12 = TextStyle(
      color: const Color.fromRGBO(214, 214, 214, 1),
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray179_15_M = TextStyle(
      color: const Color.fromRGBO(179, 179, 179, 1),
      fontSize: 15.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle hexb3b3b3_15_M = TextStyle(
      color: const Color(0xffb3b3b3),
      fontSize: 15.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray187_15_M = TextStyle(
      color: const Color.fromRGBO(187, 187, 187, 1),
      fontSize: 15.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle black64_15_M = TextStyle(
      color: const Color.fromRGBO(232, 232, 233, 1),
      fontSize: 15.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white244_15_M = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 15.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white241_15_semibold = TextStyle(
      color: const Color.fromRGBO(241, 241, 241, 1),
      fontSize: 15.sp,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white244_12 = TextStyle(
      color: const Color.fromRGBO(244, 244, 244, 1),
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);
  static final TextStyle white244_13 = TextStyle(
      color: const Color.fromRGBO(244, 244, 244, 1),
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray143_13 = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white244_14 = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white244_14semibold = TextStyle(
      color: const Color.fromRGBO(244, 244, 244, 1),
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none);
  static final TextStyle white244_18 = TextStyle(
      color: const Color.fromRGBO(244, 244, 244, 1),
      fontSize: 18.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle hex003dfd_25_M = TextStyle(
      color: const Color(0xff00edfd),
      fontSize: 25.sp,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  static final TextStyle hex003dfd_13 = TextStyle(
      color: const Color(0xff00edfd),
      fontSize: 13.sp,
      decoration: TextDecoration.none);

  static final TextStyle black51_14 = TextStyle(
      color: const Color.fromRGBO(51, 51, 51, 1),
      fontSize: 14.sp,
      decoration: TextDecoration.none);

  static final TextStyle white233_14 = TextStyle(
      color: const Color.fromRGBO(233, 233, 233, 1),
      fontSize: 14.sp,
      decoration: TextDecoration.none);

  static final TextStyle gray156_15 = TextStyle(
      color: const Color.fromRGBO(156, 159, 166, 1),
      fontSize: 15.sp,
      decoration: TextDecoration.none);

  static final TextStyle gray156_12 = TextStyle(
      color: const Color.fromRGBO(156, 159, 166, 1),
      fontSize: 12.sp,
      decoration: TextDecoration.none);

  static final TextStyle black0_18_M = TextStyle(
      color: const Color.fromRGBO(0, 0, 0, 1),
      fontSize: 18.sp,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none);

  static final TextStyle gray153_12 = TextStyle(
      color: const Color.fromRGBO(153, 153, 153, 1),
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray30_15 = TextStyle(
      color: const Color.fromRGBO(30, 30, 30, 1),
      fontSize: 15.sp,
      decoration: TextDecoration.none);

  static final TextStyle black13_11 = TextStyle(
      color: const Color.fromRGBO(95, 95, 95, 1),
      fontSize: 11.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle red255_13_M = TextStyle(
      color: const Color.fromRGBO(240, 128, 128, 1.0),
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  static final TextStyle green0_13_M = TextStyle(
      color: const Color.fromRGBO(0, 250, 154, 1.0),
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  static final TextStyle red255_11 = TextStyle(
      color: const Color.fromRGBO(240, 128, 128, 1.0),
      fontSize: 11.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  //==============================分界线=============================================

  static final TextStyle gray153_10 = TextStyle(
      color: const Color.fromRGBO(153, 153, 153, 1),
      fontSize: 10.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle lgray11 = TextStyle(
      color: const Color.fromRGBO(102, 102, 102, 1),
      fontSize: 11.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle lgray13 = TextStyle(
      color: const Color.fromRGBO(102, 102, 102, 1),
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle lgray14 = TextStyle(
      color: const Color.fromRGBO(102, 102, 102, 1),
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray12128 = TextStyle(
      color: const Color.fromRGBO(128, 128, 128, 1),
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray11 = TextStyle(
      color: const Color.fromRGBO(153, 153, 153, 1),
      fontSize: 11.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray12 = TextStyle(
      color: const Color.fromRGBO(153, 153, 153, 1),
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray13 = TextStyle(
      color: const Color.fromRGBO(153, 153, 153, 1),
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray150 = TextStyle(
      color: const Color.fromRGBO(50, 50, 50, 1),
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray173 = TextStyle(
      color: const Color.fromRGBO(173, 173, 173, 1),
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray14 = TextStyle(
      color: const Color.fromRGBO(153, 153, 153, 1),
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray10 = TextStyle(
      color: const Color.fromRGBO(153, 153, 153, 1),
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray232_15 = TextStyle(
      color: const Color.fromRGBO(153, 153, 153, 1),
      fontSize: 15.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle green85_15 = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 15.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray15 = TextStyle(
      color: const Color.fromRGBO(172, 171, 176, 1),
      fontSize: 15.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray153_15 = TextStyle(
      color: const Color.fromRGBO(153, 153, 153, 1),
      fontSize: 15.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray16 = TextStyle(
      color: const Color.fromRGBO(102, 102, 102, 1),
      fontSize: 16.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);
  static final TextStyle gray16medium = TextStyle(
      color: const Color.fromRGBO(102, 102, 102, 1),
      fontSize: 16.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);
  static final TextStyle gray16blod = TextStyle(
      color: const Color.fromRGBO(102, 102, 102, 1),
      fontSize: 16.sp,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray204 = TextStyle(
      color: const Color.fromRGBO(204, 204, 204, 1),
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray204_12 = TextStyle(
      color: const Color.fromRGBO(204, 204, 204, 1),
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray204_18_M = TextStyle(
      color: const Color.fromRGBO(204, 204, 204, 1),
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle red10 = TextStyle(
      color: const Color.fromRGBO(240, 75, 62, 1),
      fontSize: 10.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle red12 = TextStyle(
      color: const Color.fromRGBO(240, 75, 62, 1),
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle red240 = TextStyle(
      color: const Color.fromRGBO(246, 95, 133, 1),
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle red24015 = TextStyle(
      color: const Color.fromRGBO(240, 75, 62, 1),
      fontSize: 15.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle red13 = TextStyle(
      color: const Color.fromRGBO(255, 99, 71, 1),
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle red14 = TextStyle(
    color: const Color.fromRGBO(240, 75, 62, 1),
    fontSize: 14.sp,
    overflow: TextOverflow.ellipsis,
    decoration: TextDecoration.none,
  );

  static final TextStyle red16bold = TextStyle(
      color: const Color.fromRGBO(255, 157, 18, 1),
      fontSize: 16.sp,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle red20bold = TextStyle(
      color: const Color.fromRGBO(240, 75, 62, 1),
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle red15bold = TextStyle(
      color: const Color.fromRGBO(240, 75, 62, 1),
      fontSize: 15.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle yellow12 = TextStyle(
      color: const Color.fromRGBO(255, 157, 18, 1),
      fontSize: 12.sp,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle black20bold = TextStyle(
      color: const Color.fromRGBO(34, 34, 34, 1),
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle black1534 = TextStyle(
      color: const Color.fromRGBO(34, 34, 34, 1),
      fontSize: 15.sp,
      fontWeight: FontWeight.normal,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle blackBlod1534 = TextStyle(
      color: const Color.fromRGBO(34, 34, 34, 1),
      fontSize: 15.sp,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle blackMedium1534 = TextStyle(
      color: const Color.fromRGBO(34, 34, 34, 1),
      fontSize: 15.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle black1834 = TextStyle(
      color: const Color.fromRGBO(34, 34, 34, 1),
      fontSize: 18.sp,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);
  static final TextStyle black118_12 = TextStyle(
      color: const Color.fromRGBO(161, 161, 178, 1),
      fontSize: 12.sp,
      decoration: TextDecoration.none);

  static final TextStyle black788187_12 = TextStyle(
      color: const Color.fromRGBO(78, 81, 87, 1),
      fontSize: 12.sp,
      decoration: TextDecoration.none);

  static final TextStyle black12 = TextStyle(
      color: const Color.fromRGBO(51, 51, 51, 1),
      fontSize: 12.sp,
      decoration: TextDecoration.none);

  static final TextStyle black12_M = TextStyle(
      color: const Color.fromRGBO(51, 51, 51, 1),
      fontWeight: FontWeight.w600,
      fontSize: 12.sp,
      decoration: TextDecoration.none);

  static final TextStyle black13 = TextStyle(
      color: const Color.fromRGBO(51, 51, 51, 1),
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle black13bold = TextStyle(
      color: const Color.fromRGBO(51, 51, 51, 1),
      fontSize: 13.sp,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle black15 = TextStyle(
      color: const Color.fromRGBO(51, 51, 51, 1),
      fontSize: 15.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle black1434 = TextStyle(
      color: const Color.fromRGBO(34, 34, 34, 1),
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none);

  static final TextStyle black1234 = TextStyle(
      color: const Color.fromRGBO(34, 34, 34, 1),
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.normal,
      decoration: TextDecoration.none);

  static final TextStyle black15bold = TextStyle(
      color: const Color.fromRGBO(51, 51, 51, 1),
      fontSize: 15.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none);

  static final TextStyle black20bold51 = TextStyle(
      color: const Color.fromRGBO(51, 51, 51, 1),
      fontSize: 20.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none);

  static final TextStyle black18bold50 = TextStyle(
      color: const Color.fromRGBO(50, 50, 50, 1),
      fontSize: 18.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none);

  static final TextStyle black16 = TextStyle(
      color: const Color.fromRGBO(51, 51, 51, 1),
      fontSize: 16.sp,
      decoration: TextDecoration.none);

  static final TextStyle black16bold = TextStyle(
      color: const Color.fromRGBO(51, 51, 51, 1),
      fontSize: 16.sp,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none);

  static final TextStyle black16bold34 = TextStyle(
      color: const Color.fromRGBO(34, 34, 34, 1),
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  static final TextStyle black16medium34 = TextStyle(
      color: const Color.fromRGBO(34, 34, 34, 1),
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  static final TextStyle black1634 = TextStyle(
      color: const Color.fromRGBO(34, 34, 34, 1),
      fontSize: 16.sp,
      fontWeight: FontWeight.normal,
      decoration: TextDecoration.none);

  static final TextStyle black18bold = TextStyle(
      color: const Color.fromRGBO(51, 51, 51, 1),
      fontSize: 18.sp,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle black24 = TextStyle(
      color: const Color.fromRGBO(51, 51, 51, 1),
      fontSize: 24.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white10 = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 10.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);
  static final TextStyle hexa3a2a2_10 = TextStyle(
      color: const Color(0xffffffff),
      fontSize: 10.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);
  static final TextStyle hexa3a2a2_11 = TextStyle(
      color: const Color.fromRGBO(180, 180, 180, 1),
      fontSize: 11.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white9 = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 9.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white09_10 = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 0.9),
      fontSize: 10.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white9medium = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 9.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);
  static final TextStyle white10medium = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 10.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);
  static final TextStyle white10semibold = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 10.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none);

  static final TextStyle white24 = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 24.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white11 = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 11.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle green11 = TextStyle(
      color: const Color.fromRGBO(87, 136, 245, 1),
      fontSize: 11.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white11medium = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 11.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);
  static final TextStyle white11semibold = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 11.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none);

  static final TextStyle white12 = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white08_12 = TextStyle(
      color: white08Color,
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white08_14_M = TextStyle(
      color: white08Color,
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  static final TextStyle white06_12 = TextStyle(
      color: white06Color,
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white06_10 = TextStyle(
      color: white06Color,
      fontSize: 10.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle gray95_12 = TextStyle(
      color: const Color.fromRGBO(148, 148, 148, 1),
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white12medium = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);
  static final TextStyle hexa3a2a2_12 = TextStyle(
      color: const Color(0xffffffff),
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle hexa0a0a0_12 = TextStyle(
      color: const Color(0xffa0a0a0),
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle rgb250219183_14 = TextStyle(
      color: const Color.fromRGBO(250, 219, 183, 1),
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle hex00a3f2_12 = TextStyle(
      color: const Color(0xff00a3f2),
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle hexff2a8a_12 = TextStyle(
      color: const Color(0xffFF6347),
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white13 = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white13medium = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  static final TextStyle hexa3a2a2_13 = TextStyle(
      color: const Color(0xffffffff),
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);
  static final TextStyle hexa3a2a2_13_M = TextStyle(
      color: const Color(0xffffffff),
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);
  static final TextStyle hexfbe099_13_M = TextStyle(
      color: const Color(0xfffbe099),
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);
  static final TextStyle white14 = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white14Medium = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle hexa3a2a2_15 = TextStyle(
      color: const Color(0xff999999),
      fontSize: 15.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white15 = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 15.sp,
      // overflow: TextOverflow.fade,
      decoration: TextDecoration.none);

  static final TextStyle white15bold = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 15.sp,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white15semibold = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 15.sp,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white16bold = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 16.sp,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);
  static final TextStyle white16medium = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 16.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white237242250_11medium = TextStyle(
      color: const Color.fromRGBO(237, 242, 250, 1),
      fontSize: 11.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);
  static final TextStyle white237242250_17medium = TextStyle(
      color: const Color.fromRGBO(237, 242, 250, 1),
      fontSize: 17.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white19_semi = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 19.sp,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white18 = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 18.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);
  static final TextStyle white18mudium = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white18bold = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 18.sp,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white18semibold = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);
  static final TextStyle hexffbd39_18_M = TextStyle(
      color: const Color(0xffffbd39),
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);
  static final TextStyle hexaa5000_18_S = TextStyle(
      color: const Color(0xffaa5000),
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);
  static final TextStyle white20bold = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);
  static final TextStyle white20medium = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle white22bold = TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 22.sp,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle hex0d141f_11 = TextStyle(
      color: const Color.fromRGBO(26, 26, 31, 1),
      fontSize: 11.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);
  static final TextStyle jellyCyan_11 = TextStyle(
      color: jellyCyanColor103224185,
      fontSize: 11.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);
  static final TextStyle jellyCyan_11_M = TextStyle(
      color: jellyCyanColor103224185,
      fontSize: 11.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);
  static final TextStyle hex0d141f_13 = TextStyle(
      color: const Color.fromRGBO(26, 26, 31, 1),
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);
  static final TextStyle jellyCyan_13 = TextStyle(
      color: jellyCyanColor103224185,
      fontSize: 13.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle jellyCyan_13_M = TextStyle(
      color: jellyCyanColor103224185,
      fontSize: 13.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);
  static final TextStyle jellyCyan_14 = TextStyle(
      color: jellyCyanColor103224185,
      fontSize: 14.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);
  static final TextStyle jellyCyan_15 = TextStyle(
      color: jellyCyanColor103224185,
      fontSize: 15.sp,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);
  static final TextStyle jellyCyan_15_M = TextStyle(
      color: jellyCyanColor103224185,
      fontSize: 15.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);

  static final TextStyle jellyCyan_18 = TextStyle(
      color: jellyCyanColor103224185,
      fontSize: 18.sp,
      overflow: TextOverflow.visible,
      decoration: TextDecoration.none);

  static final TextStyle jellyCyan_18_M = TextStyle(
      color: jellyCyanColor103224185,
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);
  static final TextStyle jellyCyan_25_semi = TextStyle(
      color: jellyCyanColor103224185,
      fontSize: 25.sp,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
      decoration: TextDecoration.none);
}
