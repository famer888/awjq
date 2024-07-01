import '../../../domain/type_def.dart';
import 'base_service.dart';

class LiveService extends BaseService {
  LiveService(super._dio);

  @override
  final service = 'live';

  /// 工单列表
  AsyncJson getLiveIndex({
    required int id,
    required int page,
    required int limit}) =>
      post('/index', data: {'id': id, 'page': page, 'limit': limit});


}
