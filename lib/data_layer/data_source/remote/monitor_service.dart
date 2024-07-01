import '../../../domain/type_def.dart';
import 'base_service.dart';

class MonitorService extends BaseService {
  MonitorService(super._dio);

  @override
  final service = 'monitor';

  /// 工单列表
  AsyncJson getMonitorIndex({
    required int id,
    required int page,
    required int limit}) =>
      post('/index', data: {'id': id, 'page': page, 'limit': limit});


}