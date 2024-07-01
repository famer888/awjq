part of '../repo.dart';

mixin _Live on _BaseAppRepo implements LiveDomain {

  @override
  AsyncResult<LiveWithBannersModel> getLiveIndex({
    required int id,
    required int page,
    required int limit,
  }) =>
      _liveService.getLiveIndex(
        id: id,
        page: page,
        limit: limit,
      ).deserializeJsonBy(LiveWithBannersModel.fromJson).guard;
}
