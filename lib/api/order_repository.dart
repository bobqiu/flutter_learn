import 'package:new_idea/component/order_entity.dart';
import 'package:new_idea/net/result.dart';

import '../net/base_repository.dart';

class OrderRepository extends BaseRepository {
  BizRepository() {}

  Future<OrderEntity> getOrderListPage(String? pageNo, String? pageSize) async {
    OrderEntity orderEntity = OrderEntity();
    Result<OrderEntity> response = await get(
        "/trade/order/page?pageNo=$pageNo&pageSize=$pageSize",
        decodeType: OrderEntity());
    response.when(success: (entity) {
      orderEntity = entity;
      var size = entity.data?.list!.length;
      print("getOrderListPage ~~~~~带泛型2成功返回$size条");
    }, failure: (String msg, int code) {
      print("getOrderListPage ~~~~~失败了：msg=$msg/code=$code");
      orderEntity.code = code;
      orderEntity.msg = msg;
    });
    return orderEntity;
  }
}
