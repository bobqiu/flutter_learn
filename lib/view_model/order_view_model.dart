import 'package:new_idea/api/order_repository.dart';
import 'package:new_idea/component/order_entity.dart';
import 'package:new_idea/view_model/base_refresh_view_model.dart';
import 'package:easy_refresh/easy_refresh.dart';

class OrderViewModel extends BaseRefreshViewModel<OrderRepository> {
  OrderEntity _orderEntity = OrderEntity();

  List<OrderDataList>? get orderDataList => _orderEntity?.data?.list;

  List<OrderDataList>? _currentOrderDataList;

  List<OrderDataList>? get currentOrderDataList => _currentOrderDataList;

  int currentPage = 1;
  int pageSize = 40;

  int get totalPage => _orderEntity!.data!.total! ~/ pageSize + 1;

  Future<dynamic> getOrderData() async {
    _orderEntity = await requestData(
        getOrder(currentPage.toString(), pageSize.toString()));
    if (_orderEntity?.code == 0) {
      if (_orderEntity.data == null || _orderEntity?.data?.list == null) {
        setEmpty();
      } else {
        refreshLocalData(true);
        setSuccess();
      }
    } else {
      setError(new Error(), message: "请求失败");
    }
  }

  Future<dynamic> refreshOrderData() async {
    var orderEntity =
        await refreshData(getOrder(1.toString(), pageSize.toString()));
    if (orderEntity != null && orderEntity.code == 0) {
      _orderEntity = orderEntity;
      refreshLocalData(true);
      setSuccess();
      easyRefreshController.finishRefresh();
      easyRefreshController.resetFooter();
    } else {
      easyRefreshController.resetFooter();
      easyRefreshController.finishRefresh(IndicatorResult.fail);
    }
  }

  Future<dynamic> loadMoreOrderData() async {
    var orderEntity = await loadData(
        getOrder((currentPage + 1).toString(), pageSize.toString()));
    print("totalPage:$totalPage,currentPage:$currentPage+1");
    if (orderEntity != null && orderEntity.code == 0) {
      _orderEntity = orderEntity;
      refreshLocalData(false);

      setSuccess();
      easyRefreshController.finishLoad(currentPage >= totalPage
          ? IndicatorResult.noMore
          : IndicatorResult.success);
    } else {
      easyRefreshController.resetFooter();
      easyRefreshController.finishRefresh(IndicatorResult.fail);
    }
  }

  void refreshLocalData([bool initFlag = false]) {
    if (initFlag) {
      currentPage = 1;
      _currentOrderDataList = orderDataList;
      return;
    }
    if (currentPage < totalPage) {
      _currentOrderDataList?.addAll(orderDataList!);
      currentPage++;
    }
    notifyListeners();
  }

  getOrder(String? pageNo, String? pageSize) {
    return baseRepository?.getOrderListPage(pageNo, pageSize);
  }

  OrderRepository createRepository() {
    return OrderRepository();
  }
}
