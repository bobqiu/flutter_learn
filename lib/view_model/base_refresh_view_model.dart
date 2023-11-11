import 'package:new_idea/net/base_repository.dart';
import 'package:new_idea/view_model/base_view_model.dart';
import 'package:easy_refresh/easy_refresh.dart';

abstract class BaseRefreshViewModel<T extends BaseRepository>
    extends BaseViewModel<T> {
  EasyRefreshController _easyRefreshController = EasyRefreshController(
    controlFinishRefresh: true,
    controlFinishLoad: true,
  );

  EasyRefreshController get easyRefreshController => _easyRefreshController;

  /*BaseRefreshViewModel(){
    _easyRefreshController=EasyRefreshController(
      controlFinishRefresh: true,
      controlFinishLoad: true,
    );
  }*/

  /// 通用请求数据方法 子类可以复写
  Future<dynamic> refreshData(Future<dynamic> requestApi) async {
    var result;
    try {
      result = await requestApi;
    } catch (e) {
      print(e.toString());
    }
    return result;
  }

  Future<dynamic> loadData(Future<dynamic> requestApi) async {
    var result;
    try {
      result = await requestApi;
    } catch (e) {
      print(e.toString());
    }
    return result;
  }
}
