part of '../repo.dart';

mixin _Sign on _BaseAppRepo implements SignDomain {
  @override
  AsyncResult<ExpOfVIPData> getExpOfVIP() =>
      _signService.getExpOfVIP().deserializeJsonBy(ExpOfVIPData.fromJson).guard;

  @override
  AsyncJson expConvertVIP({required int id}) =>
      _signService.expConvertVIP(id: id);

  @override
  AsyncResult<WelfareTaskModel> signListTask({String? type}) => _signService
      .signListTask(type)
      .deserializeJsonBy(WelfareTaskModel.fromJson)
      .guard;

  @override
  AsyncResult signListTaskAccept(Map request) =>
      _signService.signListTaskAccept(request).deserialize().guard;
}
