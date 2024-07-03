import 'dart:ffi';

import 'banner_model.dart';
import 'live_model.dart';

class MonitorWithBannersModel {
  List<MonitorModel>? monitors;
  List<BannerModel>? banners;
  List<TipModel>? tips;

  MonitorWithBannersModel({this.monitors, this.banners, this.tips});

  factory MonitorWithBannersModel.fromJson(Map<String, dynamic> json) =>
      MonitorWithBannersModel(
        monitors: List<MonitorModel>.from(
            json['monitors'].map((e) => MonitorModel.fromJson(e))),
        banners: List<BannerModel>.from(
            json['banners'].map((e) => BannerModel.fromJson(e))),
        tips:
        List<TipModel>.from(json['tips'].map((e) => TipModel.fromJson(e))),
      );

  Map<String, dynamic> toJson() =>
      {'monitors': monitors, 'banners': banners, 'tips': tips};
}

class MonitorModel {
  final int? id;
  final String? title;
  final String? cover;
        bool? online;//自定义字段：只有实时监控才会是在线状态
  final String? hls;
  final String? show;
  final int? type;
  final int? coins;
  final String? intro;
  final int? isFavorite;
  final String? payTip;
  final int? viewFct;
  final int? commentCt;
  final int? favoriteFct;

  MonitorModel({
    this.id,
    this.title,
    this.cover,
    this.online = false,
    this.hls,
    this.show,
    this.type,
    this.coins,
    this.intro,
    this.isFavorite,
    this.payTip,
    this.viewFct,
    this.favoriteFct,
    this.commentCt,
  });

  factory MonitorModel.fromJson(Map<String, dynamic> json) => MonitorModel(
    id: json['id'],
    cover: json['cover'],
    title: json['title'],
    show: json['show'],
    type: json['type'],
    coins: json['coins'],
    intro: json['intro'],
    isFavorite: json['is_favorite'],
    payTip: json['pay_tip'],
    viewFct: json['view_fct'],
    favoriteFct: json['favorite_fct'],
    commentCt: json['comment_ct'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'cover': cover,
    'title': title,
    'hls': hls,
    'show': show,
    'type': type,
    'coins': coins,
    'intro': intro,
    'is_favorite': isFavorite,
    'pay_tip': payTip,
    'view_fct': viewFct,
    'comment_ct': commentCt,
    'favorite_fct': favoriteFct,
  };
}
