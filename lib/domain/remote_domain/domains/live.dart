import '../../model/live_model.dart';
import '../../model/posts_with_banners_model.dart';
import '../../type_def.dart';

abstract class LiveDomain {

  AsyncResult<LiveWithBannersModel> getLiveIndex({
    required int id,
    required int page,
    required int limit,
  });

}