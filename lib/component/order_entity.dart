import 'package:new_idea/generated/json/base/json_field.dart';
import 'package:new_idea/generated/json/order_entity.g.dart';
import 'dart:convert';

import '../net/base_net_model.dart';
export 'package:new_idea/generated/json/order_entity.g.dart';

@JsonSerializable()
class OrderEntity  extends BaseNetModel{
  int? code;
  OrderData? data;
  String? msg;

  OrderEntity();

  factory OrderEntity.fromJson(Map<String, dynamic> json) =>
      $OrderEntityFromJson(json);

  Map<String, dynamic> toJson() => $OrderEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  @override
  fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    return OrderEntity.fromJson(json);

  }
}

@JsonSerializable()
class OrderData {
  List<OrderDataList>? list;
  int? total;

  OrderData();

  factory OrderData.fromJson(Map<String, dynamic> json) =>
      $OrderDataFromJson(json);

  Map<String, dynamic> toJson() => $OrderDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class OrderDataList {
  int? id;
  String? no;
  int? createTime;
  int? type;
  int? terminal;
  int? userId;
  String? userIp;
  dynamic userRemark;
  int? status;
  int? productCount;
  dynamic finishTime;
  int? cancelTime;
  int? cancelType;
  dynamic remark;
  int? payOrderId;
  bool? payStatus;
  int? payTime;
  String? payChannelCode;
  int? totalPrice;
  int? discountPrice;
  int? deliveryPrice;
  int? adjustPrice;
  int? payPrice;
  int? deliveryType;
  dynamic pickUpStoreId;
  dynamic pickUpVerifyCode;
  dynamic deliveryTemplateId;
  dynamic logisticsId;
  dynamic logisticsNo;
  dynamic deliveryTime;
  dynamic receiveTime;
  String? receiverName;
  String? receiverMobile;
  int? receiverAreaId;
  String? receiverDetailAddress;
  dynamic afterSaleStatus;
  int? refundPrice;
  dynamic couponId;
  int? couponPrice;
  int? pointPrice;
  int? vipPrice;
  int? brokerageUserId;
  String? receiverAreaName;
  List<OrderDataListItems>? items;
  OrderDataListUser? user;
  OrderDataListBrokerageUser? brokerageUser;

  OrderDataList();

  factory OrderDataList.fromJson(Map<String, dynamic> json) =>
      $OrderDataListFromJson(json);

  Map<String, dynamic> toJson() => $OrderDataListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class OrderDataListItems {
  int? id;
  int? userId;
  int? orderId;
  int? spuId;
  String? spuName;
  int? skuId;
  String? picUrl;
  int? count;
  int? price;
  int? discountPrice;
  int? payPrice;
  dynamic orderPartPrice;
  dynamic orderDividePrice;
  int? afterSaleStatus;
  List<OrderDataListItemsProperties>? properties;

  OrderDataListItems();

  factory OrderDataListItems.fromJson(Map<String, dynamic> json) =>
      $OrderDataListItemsFromJson(json);

  Map<String, dynamic> toJson() => $OrderDataListItemsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class OrderDataListItemsProperties {
  int? propertyId;
  String? propertyName;
  int? valueId;
  String? valueName;

  OrderDataListItemsProperties();

  factory OrderDataListItemsProperties.fromJson(Map<String, dynamic> json) =>
      $OrderDataListItemsPropertiesFromJson(json);

  Map<String, dynamic> toJson() => $OrderDataListItemsPropertiesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class OrderDataListUser {
  int? id;
  String? nickname;
  String? avatar;

  OrderDataListUser();

  factory OrderDataListUser.fromJson(Map<String, dynamic> json) =>
      $OrderDataListUserFromJson(json);

  Map<String, dynamic> toJson() => $OrderDataListUserToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class OrderDataListBrokerageUser {
  int? id;
  String? nickname;
  String? avatar;

  OrderDataListBrokerageUser();

  factory OrderDataListBrokerageUser.fromJson(Map<String, dynamic> json) =>
      $OrderDataListBrokerageUserFromJson(json);

  Map<String, dynamic> toJson() => $OrderDataListBrokerageUserToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
