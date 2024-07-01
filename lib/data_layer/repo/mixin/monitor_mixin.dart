part of '../repo.dart';

mixin _Monitor on _BaseAppRepo implements MonitorDomain {

  @override
  AsyncJson getMonitorIndex({
    required int id,
    required int page,
    required int limit,
  }) =>
      _monitorService.getMonitorIndex(
        id: id,
        page: page,
        limit: limit,
      );
}
