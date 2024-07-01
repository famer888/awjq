import 'dart:ffi';

import 'banner_model.dart';
import 'live_model.dart';

class MonitorWithBannersModel {
  List<MionitorModel>? monitors;
  List<BannerModel>? banners;
  List<TipModel>? tips;

  MonitorWithBannersModel({this.monitors, this.banners, this.tips});

  factory MonitorWithBannersModel.fromJson(Map<String, dynamic> json) =>
      MonitorWithBannersModel(
        monitors: List<MionitorModel>.from(
            json['monitors'].map((e) => MionitorModel.fromJson(e))),
        banners: List<BannerModel>.from(
            json['banners'].map((e) => BannerModel.fromJson(e))),
        tips:
        List<TipModel>.from(json['tips'].map((e) => TipModel.fromJson(e))),
      );

  Map<String, dynamic> toJson() =>
      {'monitors': monitors, 'banners': banners, 'tips': tips};
}

class MionitorModel {
  final int? id;
  final String? title;
  final String? cover;
        bool? online;//自定义字段：只有实时监控才会是在线状态

  MionitorModel({
    this.id,
    this.title,
    this.cover,
    this.online = false,
  });

  factory MionitorModel.fromJson(Map<String, dynamic> json) => MionitorModel(
    id: json['id'],
    cover: json['cover'],
    title: json['title'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'cover': cover,
    'title': title,
  };
}
