import 'package:easy_refresh/easy_refresh.dart';
import 'package:new_idea/api/biz_repository.dart';
import 'package:new_idea/component/biz_entity.dart';
import 'package:new_idea/view_model/base_refresh_view_model.dart';

class RefreshViewModel extends BaseRefreshViewModel<BizRepository> {
  late BizEntity _bizEntity = BizEntity();

  List<BizData>? get bizDataList => _bizEntity.data;

  int currentPage = 0;

  List<BizData>? _currentBizDataList;

  List<BizData>? get currentBizDataList => _currentBizDataList;

  int get totalPage => bizDataList!.length ~/ 1;

  Future<dynamic> getBizDataList() async {
    _bizEntity = await requestData(requestGetGenericEntityVM());
    if (_bizEntity?.code == 0) {
      if (_bizEntity.data == null || _bizEntity.data!.length <= 0) {
        setEmpty();
      } else {
        refreshLocalData(true);
        setSuccess();
      }
    } else {
      setError(new Error(), message: "请求失败");
    }
  }

  Future<dynamic> refreshBizData() async {
    var bizEntity = await refreshData(requestGetGenericEntityVM());
    if (bizEntity != null && bizEntity.code == 0) {
      _bizEntity = bizEntity;
      refreshLocalData(true);
      setSuccess();
      easyRefreshController.finishRefresh();
      easyRefreshController.resetFooter();
    } else {
      easyRefreshController.resetFooter();
      easyRefreshController.finishRefresh(IndicatorResult.fail);
    }
  }

  void refreshLocalData([bool initFlag = false]) {
    if (initFlag) {
      currentPage = 0;
      _currentBizDataList = bizDataList?.sublist(0, 1);
      return;
    }
    currentPage = currentPage >= totalPage - 1 ? 0 : currentPage + 1;
    _currentBizDataList =
        bizDataList?.sublist(currentPage * 1, currentPage * 1 + 1);
    notifyListeners();
  }

  requestGetGenericEntityVM() {
    return baseRepository?.requestGetGenericEntity();
  }

  BizRepository createRepository() {
    return BizRepository();
  }
}
