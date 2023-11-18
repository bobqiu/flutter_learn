import 'package:new_idea/generated/json/base/json_convert_content.dart';
import 'package:new_idea/component/order_entity.dart';

OrderEntity $OrderEntityFromJson(Map<String, dynamic> json) {
  final OrderEntity orderEntity = OrderEntity();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    orderEntity.code = code;
  }
  final OrderData? data = jsonConvert.convert<OrderData>(json['data']);
  if (data != null) {
    orderEntity.data = data;
  }
  final String? msg = jsonConvert.convert<String>(json['msg']);
  if (msg != null) {
    orderEntity.msg = msg;
  }
  return orderEntity;
}

Map<String, dynamic> $OrderEntityToJson(OrderEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['data'] = entity.data?.toJson();
  data['msg'] = entity.msg;
  return data;
}

extension OrderEntityExtension on OrderEntity {
  OrderEntity copyWith({
    int? code,
    OrderData? data,
    String? msg,
  }) {
    return OrderEntity()
      ..code = code ?? this.code
      ..data = data ?? this.data
      ..msg = msg ?? this.msg;
  }
}

OrderData $OrderDataFromJson(Map<String, dynamic> json) {
  final OrderData orderData = OrderData();
  final List<OrderDataList>? list = (json['list'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<OrderDataList>(e) as OrderDataList)
      .toList();
  if (list != null) {
    orderData.list = list;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    orderData.total = total;
  }
  return orderData;
}

Map<String, dynamic> $OrderDataToJson(OrderData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['list'] = entity.list?.map((v) => v.toJson()).toList();
  data['total'] = entity.total;
  return data;
}

extension OrderDataExtension on OrderData {
  OrderData copyWith({
    List<OrderDataList>? list,
    int? total,
  }) {
    return OrderData()
      ..list = list ?? this.list
      ..total = total ?? this.total;
  }
}

OrderDataList $OrderDataListFromJson(Map<String, dynamic> json) {
  final OrderDataList orderDataList = OrderDataList();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    orderDataList.id = id;
  }
  final String? no = jsonConvert.convert<String>(json['no']);
  if (no != null) {
    orderDataList.no = no;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    orderDataList.createTime = createTime;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    orderDataList.type = type;
  }
  final int? terminal = jsonConvert.convert<int>(json['terminal']);
  if (terminal != null) {
    orderDataList.terminal = terminal;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    orderDataList.userId = userId;
  }
  final String? userIp = jsonConvert.convert<String>(json['userIp']);
  if (userIp != null) {
    orderDataList.userIp = userIp;
  }
  final dynamic userRemark = json['userRemark'];
  if (userRemark != null) {
    orderDataList.userRemark = userRemark;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    orderDataList.status = status;
  }
  final int? productCount = jsonConvert.convert<int>(json['productCount']);
  if (productCount != null) {
    orderDataList.productCount = productCount;
  }
  final dynamic finishTime = json['finishTime'];
  if (finishTime != null) {
    orderDataList.finishTime = finishTime;
  }
  final int? cancelTime = jsonConvert.convert<int>(json['cancelTime']);
  if (cancelTime != null) {
    orderDataList.cancelTime = cancelTime;
  }
  final int? cancelType = jsonConvert.convert<int>(json['cancelType']);
  if (cancelType != null) {
    orderDataList.cancelType = cancelType;
  }
  final dynamic remark = json['remark'];
  if (remark != null) {
    orderDataList.remark = remark;
  }
  final int? payOrderId = jsonConvert.convert<int>(json['payOrderId']);
  if (payOrderId != null) {
    orderDataList.payOrderId = payOrderId;
  }
  final bool? payStatus = jsonConvert.convert<bool>(json['payStatus']);
  if (payStatus != null) {
    orderDataList.payStatus = payStatus;
  }
  final int? payTime = jsonConvert.convert<int>(json['payTime']);
  if (payTime != null) {
    orderDataList.payTime = payTime;
  }
  final String? payChannelCode = jsonConvert.convert<String>(
      json['payChannelCode']);
  if (payChannelCode != null) {
    orderDataList.payChannelCode = payChannelCode;
  }
  final int? totalPrice = jsonConvert.convert<int>(json['totalPrice']);
  if (totalPrice != null) {
    orderDataList.totalPrice = totalPrice;
  }
  final int? discountPrice = jsonConvert.convert<int>(json['discountPrice']);
  if (discountPrice != null) {
    orderDataList.discountPrice = discountPrice;
  }
  final int? deliveryPrice = jsonConvert.convert<int>(json['deliveryPrice']);
  if (deliveryPrice != null) {
    orderDataList.deliveryPrice = deliveryPrice;
  }
  final int? adjustPrice = jsonConvert.convert<int>(json['adjustPrice']);
  if (adjustPrice != null) {
    orderDataList.adjustPrice = adjustPrice;
  }
  final int? payPrice = jsonConvert.convert<int>(json['payPrice']);
  if (payPrice != null) {
    orderDataList.payPrice = payPrice;
  }
  final int? deliveryType = jsonConvert.convert<int>(json['deliveryType']);
  if (deliveryType != null) {
    orderDataList.deliveryType = deliveryType;
  }
  final dynamic pickUpStoreId = json['pickUpStoreId'];
  if (pickUpStoreId != null) {
    orderDataList.pickUpStoreId = pickUpStoreId;
  }
  final dynamic pickUpVerifyCode = json['pickUpVerifyCode'];
  if (pickUpVerifyCode != null) {
    orderDataList.pickUpVerifyCode = pickUpVerifyCode;
  }
  final dynamic deliveryTemplateId = json['deliveryTemplateId'];
  if (deliveryTemplateId != null) {
    orderDataList.deliveryTemplateId = deliveryTemplateId;
  }
  final dynamic logisticsId = json['logisticsId'];
  if (logisticsId != null) {
    orderDataList.logisticsId = logisticsId;
  }
  final dynamic logisticsNo = json['logisticsNo'];
  if (logisticsNo != null) {
    orderDataList.logisticsNo = logisticsNo;
  }
  final dynamic deliveryTime = json['deliveryTime'];
  if (deliveryTime != null) {
    orderDataList.deliveryTime = deliveryTime;
  }
  final dynamic receiveTime = json['receiveTime'];
  if (receiveTime != null) {
    orderDataList.receiveTime = receiveTime;
  }
  final String? receiverName = jsonConvert.convert<String>(
      json['receiverName']);
  if (receiverName != null) {
    orderDataList.receiverName = receiverName;
  }
  final String? receiverMobile = jsonConvert.convert<String>(
      json['receiverMobile']);
  if (receiverMobile != null) {
    orderDataList.receiverMobile = receiverMobile;
  }
  final int? receiverAreaId = jsonConvert.convert<int>(json['receiverAreaId']);
  if (receiverAreaId != null) {
    orderDataList.receiverAreaId = receiverAreaId;
  }
  final String? receiverDetailAddress = jsonConvert.convert<String>(
      json['receiverDetailAddress']);
  if (receiverDetailAddress != null) {
    orderDataList.receiverDetailAddress = receiverDetailAddress;
  }
  final dynamic afterSaleStatus = json['afterSaleStatus'];
  if (afterSaleStatus != null) {
    orderDataList.afterSaleStatus = afterSaleStatus;
  }
  final int? refundPrice = jsonConvert.convert<int>(json['refundPrice']);
  if (refundPrice != null) {
    orderDataList.refundPrice = refundPrice;
  }
  final dynamic couponId = json['couponId'];
  if (couponId != null) {
    orderDataList.couponId = couponId;
  }
  final int? couponPrice = jsonConvert.convert<int>(json['couponPrice']);
  if (couponPrice != null) {
    orderDataList.couponPrice = couponPrice;
  }
  final int? pointPrice = jsonConvert.convert<int>(json['pointPrice']);
  if (pointPrice != null) {
    orderDataList.pointPrice = pointPrice;
  }
  final int? vipPrice = jsonConvert.convert<int>(json['vipPrice']);
  if (vipPrice != null) {
    orderDataList.vipPrice = vipPrice;
  }
  final int? brokerageUserId = jsonConvert.convert<int>(
      json['brokerageUserId']);
  if (brokerageUserId != null) {
    orderDataList.brokerageUserId = brokerageUserId;
  }
  final String? receiverAreaName = jsonConvert.convert<String>(
      json['receiverAreaName']);
  if (receiverAreaName != null) {
    orderDataList.receiverAreaName = receiverAreaName;
  }
  final List<OrderDataListItems>? items = (json['items'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<OrderDataListItems>(e) as OrderDataListItems)
      .toList();
  if (items != null) {
    orderDataList.items = items;
  }
  final OrderDataListUser? user = jsonConvert.convert<OrderDataListUser>(
      json['user']);
  if (user != null) {
    orderDataList.user = user;
  }
  final OrderDataListBrokerageUser? brokerageUser = jsonConvert.convert<
      OrderDataListBrokerageUser>(json['brokerageUser']);
  if (brokerageUser != null) {
    orderDataList.brokerageUser = brokerageUser;
  }
  return orderDataList;
}

Map<String, dynamic> $OrderDataListToJson(OrderDataList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['no'] = entity.no;
  data['createTime'] = entity.createTime;
  data['type'] = entity.type;
  data['terminal'] = entity.terminal;
  data['userId'] = entity.userId;
  data['userIp'] = entity.userIp;
  data['userRemark'] = entity.userRemark;
  data['status'] = entity.status;
  data['productCount'] = entity.productCount;
  data['finishTime'] = entity.finishTime;
  data['cancelTime'] = entity.cancelTime;
  data['cancelType'] = entity.cancelType;
  data['remark'] = entity.remark;
  data['payOrderId'] = entity.payOrderId;
  data['payStatus'] = entity.payStatus;
  data['payTime'] = entity.payTime;
  data['payChannelCode'] = entity.payChannelCode;
  data['totalPrice'] = entity.totalPrice;
  data['discountPrice'] = entity.discountPrice;
  data['deliveryPrice'] = entity.deliveryPrice;
  data['adjustPrice'] = entity.adjustPrice;
  data['payPrice'] = entity.payPrice;
  data['deliveryType'] = entity.deliveryType;
  data['pickUpStoreId'] = entity.pickUpStoreId;
  data['pickUpVerifyCode'] = entity.pickUpVerifyCode;
  data['deliveryTemplateId'] = entity.deliveryTemplateId;
  data['logisticsId'] = entity.logisticsId;
  data['logisticsNo'] = entity.logisticsNo;
  data['deliveryTime'] = entity.deliveryTime;
  data['receiveTime'] = entity.receiveTime;
  data['receiverName'] = entity.receiverName;
  data['receiverMobile'] = entity.receiverMobile;
  data['receiverAreaId'] = entity.receiverAreaId;
  data['receiverDetailAddress'] = entity.receiverDetailAddress;
  data['afterSaleStatus'] = entity.afterSaleStatus;
  data['refundPrice'] = entity.refundPrice;
  data['couponId'] = entity.couponId;
  data['couponPrice'] = entity.couponPrice;
  data['pointPrice'] = entity.pointPrice;
  data['vipPrice'] = entity.vipPrice;
  data['brokerageUserId'] = entity.brokerageUserId;
  data['receiverAreaName'] = entity.receiverAreaName;
  data['items'] = entity.items?.map((v) => v.toJson()).toList();
  data['user'] = entity.user?.toJson();
  data['brokerageUser'] = entity.brokerageUser?.toJson();
  return data;
}

extension OrderDataListExtension on OrderDataList {
  OrderDataList copyWith({
    int? id,
    String? no,
    int? createTime,
    int? type,
    int? terminal,
    int? userId,
    String? userIp,
    dynamic userRemark,
    int? status,
    int? productCount,
    dynamic finishTime,
    int? cancelTime,
    int? cancelType,
    dynamic remark,
    int? payOrderId,
    bool? payStatus,
    int? payTime,
    String? payChannelCode,
    int? totalPrice,
    int? discountPrice,
    int? deliveryPrice,
    int? adjustPrice,
    int? payPrice,
    int? deliveryType,
    dynamic pickUpStoreId,
    dynamic pickUpVerifyCode,
    dynamic deliveryTemplateId,
    dynamic logisticsId,
    dynamic logisticsNo,
    dynamic deliveryTime,
    dynamic receiveTime,
    String? receiverName,
    String? receiverMobile,
    int? receiverAreaId,
    String? receiverDetailAddress,
    dynamic afterSaleStatus,
    int? refundPrice,
    dynamic couponId,
    int? couponPrice,
    int? pointPrice,
    int? vipPrice,
    int? brokerageUserId,
    String? receiverAreaName,
    List<OrderDataListItems>? items,
    OrderDataListUser? user,
    OrderDataListBrokerageUser? brokerageUser,
  }) {
    return OrderDataList()
      ..id = id ?? this.id
      ..no = no ?? this.no
      ..createTime = createTime ?? this.createTime
      ..type = type ?? this.type
      ..terminal = terminal ?? this.terminal
      ..userId = userId ?? this.userId
      ..userIp = userIp ?? this.userIp
      ..userRemark = userRemark ?? this.userRemark
      ..status = status ?? this.status
      ..productCount = productCount ?? this.productCount
      ..finishTime = finishTime ?? this.finishTime
      ..cancelTime = cancelTime ?? this.cancelTime
      ..cancelType = cancelType ?? this.cancelType
      ..remark = remark ?? this.remark
      ..payOrderId = payOrderId ?? this.payOrderId
      ..payStatus = payStatus ?? this.payStatus
      ..payTime = payTime ?? this.payTime
      ..payChannelCode = payChannelCode ?? this.payChannelCode
      ..totalPrice = totalPrice ?? this.totalPrice
      ..discountPrice = discountPrice ?? this.discountPrice
      ..deliveryPrice = deliveryPrice ?? this.deliveryPrice
      ..adjustPrice = adjustPrice ?? this.adjustPrice
      ..payPrice = payPrice ?? this.payPrice
      ..deliveryType = deliveryType ?? this.deliveryType
      ..pickUpStoreId = pickUpStoreId ?? this.pickUpStoreId
      ..pickUpVerifyCode = pickUpVerifyCode ?? this.pickUpVerifyCode
      ..deliveryTemplateId = deliveryTemplateId ?? this.deliveryTemplateId
      ..logisticsId = logisticsId ?? this.logisticsId
      ..logisticsNo = logisticsNo ?? this.logisticsNo
      ..deliveryTime = deliveryTime ?? this.deliveryTime
      ..receiveTime = receiveTime ?? this.receiveTime
      ..receiverName = receiverName ?? this.receiverName
      ..receiverMobile = receiverMobile ?? this.receiverMobile
      ..receiverAreaId = receiverAreaId ?? this.receiverAreaId
      ..receiverDetailAddress = receiverDetailAddress ??
          this.receiverDetailAddress
      ..afterSaleStatus = afterSaleStatus ?? this.afterSaleStatus
      ..refundPrice = refundPrice ?? this.refundPrice
      ..couponId = couponId ?? this.couponId
      ..couponPrice = couponPrice ?? this.couponPrice
      ..pointPrice = pointPrice ?? this.pointPrice
      ..vipPrice = vipPrice ?? this.vipPrice
      ..brokerageUserId = brokerageUserId ?? this.brokerageUserId
      ..receiverAreaName = receiverAreaName ?? this.receiverAreaName
      ..items = items ?? this.items
      ..user = user ?? this.user
      ..brokerageUser = brokerageUser ?? this.brokerageUser;
  }
}

OrderDataListItems $OrderDataListItemsFromJson(Map<String, dynamic> json) {
  final OrderDataListItems orderDataListItems = OrderDataListItems();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    orderDataListItems.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    orderDataListItems.userId = userId;
  }
  final int? orderId = jsonConvert.convert<int>(json['orderId']);
  if (orderId != null) {
    orderDataListItems.orderId = orderId;
  }
  final int? spuId = jsonConvert.convert<int>(json['spuId']);
  if (spuId != null) {
    orderDataListItems.spuId = spuId;
  }
  final String? spuName = jsonConvert.convert<String>(json['spuName']);
  if (spuName != null) {
    orderDataListItems.spuName = spuName;
  }
  final int? skuId = jsonConvert.convert<int>(json['skuId']);
  if (skuId != null) {
    orderDataListItems.skuId = skuId;
  }
  final String? picUrl = jsonConvert.convert<String>(json['picUrl']);
  if (picUrl != null) {
    orderDataListItems.picUrl = picUrl;
  }
  final int? count = jsonConvert.convert<int>(json['count']);
  if (count != null) {
    orderDataListItems.count = count;
  }
  final int? price = jsonConvert.convert<int>(json['price']);
  if (price != null) {
    orderDataListItems.price = price;
  }
  final int? discountPrice = jsonConvert.convert<int>(json['discountPrice']);
  if (discountPrice != null) {
    orderDataListItems.discountPrice = discountPrice;
  }
  final int? payPrice = jsonConvert.convert<int>(json['payPrice']);
  if (payPrice != null) {
    orderDataListItems.payPrice = payPrice;
  }
  final dynamic orderPartPrice = json['orderPartPrice'];
  if (orderPartPrice != null) {
    orderDataListItems.orderPartPrice = orderPartPrice;
  }
  final dynamic orderDividePrice = json['orderDividePrice'];
  if (orderDividePrice != null) {
    orderDataListItems.orderDividePrice = orderDividePrice;
  }
  final int? afterSaleStatus = jsonConvert.convert<int>(
      json['afterSaleStatus']);
  if (afterSaleStatus != null) {
    orderDataListItems.afterSaleStatus = afterSaleStatus;
  }
  final List<
      OrderDataListItemsProperties>? properties = (json['properties'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<OrderDataListItemsProperties>(
          e) as OrderDataListItemsProperties).toList();
  if (properties != null) {
    orderDataListItems.properties = properties;
  }
  return orderDataListItems;
}

Map<String, dynamic> $OrderDataListItemsToJson(OrderDataListItems entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['userId'] = entity.userId;
  data['orderId'] = entity.orderId;
  data['spuId'] = entity.spuId;
  data['spuName'] = entity.spuName;
  data['skuId'] = entity.skuId;
  data['picUrl'] = entity.picUrl;
  data['count'] = entity.count;
  data['price'] = entity.price;
  data['discountPrice'] = entity.discountPrice;
  data['payPrice'] = entity.payPrice;
  data['orderPartPrice'] = entity.orderPartPrice;
  data['orderDividePrice'] = entity.orderDividePrice;
  data['afterSaleStatus'] = entity.afterSaleStatus;
  data['properties'] = entity.properties?.map((v) => v.toJson()).toList();
  return data;
}

extension OrderDataListItemsExtension on OrderDataListItems {
  OrderDataListItems copyWith({
    int? id,
    int? userId,
    int? orderId,
    int? spuId,
    String? spuName,
    int? skuId,
    String? picUrl,
    int? count,
    int? price,
    int? discountPrice,
    int? payPrice,
    dynamic orderPartPrice,
    dynamic orderDividePrice,
    int? afterSaleStatus,
    List<OrderDataListItemsProperties>? properties,
  }) {
    return OrderDataListItems()
      ..id = id ?? this.id
      ..userId = userId ?? this.userId
      ..orderId = orderId ?? this.orderId
      ..spuId = spuId ?? this.spuId
      ..spuName = spuName ?? this.spuName
      ..skuId = skuId ?? this.skuId
      ..picUrl = picUrl ?? this.picUrl
      ..count = count ?? this.count
      ..price = price ?? this.price
      ..discountPrice = discountPrice ?? this.discountPrice
      ..payPrice = payPrice ?? this.payPrice
      ..orderPartPrice = orderPartPrice ?? this.orderPartPrice
      ..orderDividePrice = orderDividePrice ?? this.orderDividePrice
      ..afterSaleStatus = afterSaleStatus ?? this.afterSaleStatus
      ..properties = properties ?? this.properties;
  }
}

OrderDataListItemsProperties $OrderDataListItemsPropertiesFromJson(
    Map<String, dynamic> json) {
  final OrderDataListItemsProperties orderDataListItemsProperties = OrderDataListItemsProperties();
  final int? propertyId = jsonConvert.convert<int>(json['propertyId']);
  if (propertyId != null) {
    orderDataListItemsProperties.propertyId = propertyId;
  }
  final String? propertyName = jsonConvert.convert<String>(
      json['propertyName']);
  if (propertyName != null) {
    orderDataListItemsProperties.propertyName = propertyName;
  }
  final int? valueId = jsonConvert.convert<int>(json['valueId']);
  if (valueId != null) {
    orderDataListItemsProperties.valueId = valueId;
  }
  final String? valueName = jsonConvert.convert<String>(json['valueName']);
  if (valueName != null) {
    orderDataListItemsProperties.valueName = valueName;
  }
  return orderDataListItemsProperties;
}

Map<String, dynamic> $OrderDataListItemsPropertiesToJson(
    OrderDataListItemsProperties entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['propertyId'] = entity.propertyId;
  data['propertyName'] = entity.propertyName;
  data['valueId'] = entity.valueId;
  data['valueName'] = entity.valueName;
  return data;
}

extension OrderDataListItemsPropertiesExtension on OrderDataListItemsProperties {
  OrderDataListItemsProperties copyWith({
    int? propertyId,
    String? propertyName,
    int? valueId,
    String? valueName,
  }) {
    return OrderDataListItemsProperties()
      ..propertyId = propertyId ?? this.propertyId
      ..propertyName = propertyName ?? this.propertyName
      ..valueId = valueId ?? this.valueId
      ..valueName = valueName ?? this.valueName;
  }
}

OrderDataListUser $OrderDataListUserFromJson(Map<String, dynamic> json) {
  final OrderDataListUser orderDataListUser = OrderDataListUser();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    orderDataListUser.id = id;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    orderDataListUser.nickname = nickname;
  }
  final String? avatar = jsonConvert.convert<String>(json['avatar']);
  if (avatar != null) {
    orderDataListUser.avatar = avatar;
  }
  return orderDataListUser;
}

Map<String, dynamic> $OrderDataListUserToJson(OrderDataListUser entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['nickname'] = entity.nickname;
  data['avatar'] = entity.avatar;
  return data;
}

extension OrderDataListUserExtension on OrderDataListUser {
  OrderDataListUser copyWith({
    int? id,
    String? nickname,
    String? avatar,
  }) {
    return OrderDataListUser()
      ..id = id ?? this.id
      ..nickname = nickname ?? this.nickname
      ..avatar = avatar ?? this.avatar;
  }
}

OrderDataListBrokerageUser $OrderDataListBrokerageUserFromJson(
    Map<String, dynamic> json) {
  final OrderDataListBrokerageUser orderDataListBrokerageUser = OrderDataListBrokerageUser();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    orderDataListBrokerageUser.id = id;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    orderDataListBrokerageUser.nickname = nickname;
  }
  final String? avatar = jsonConvert.convert<String>(json['avatar']);
  if (avatar != null) {
    orderDataListBrokerageUser.avatar = avatar;
  }
  return orderDataListBrokerageUser;
}

Map<String, dynamic> $OrderDataListBrokerageUserToJson(
    OrderDataListBrokerageUser entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['nickname'] = entity.nickname;
  data['avatar'] = entity.avatar;
  return data;
}

extension OrderDataListBrokerageUserExtension on OrderDataListBrokerageUser {
  OrderDataListBrokerageUser copyWith({
    int? id,
    String? nickname,
    String? avatar,
  }) {
    return OrderDataListBrokerageUser()
      ..id = id ?? this.id
      ..nickname = nickname ?? this.nickname
      ..avatar = avatar ?? this.avatar;
  }
}