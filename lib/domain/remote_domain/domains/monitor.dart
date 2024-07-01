import '../../model/monitor_model.dart';
import '../../type_def.dart';

abstract class MonitorDomain {

  AsyncResult<MonitorWithBannersModel> getMonitorIndex({
    required int id,
    required int page,
    required int limit,
  });

  AsyncResult<List<MionitorModel>?> getMonitorSearch({
    required String word,
    required int page,
    required int limit,
  });

}