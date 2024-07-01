import '../../type_def.dart';

abstract class MonitorDomain {

  AsyncJson getMonitorIndex({
    required int id,
    required int page,
    required int limit,
  });

}