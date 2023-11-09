// 当返回的是这种格式时 {“code”: 0, “message”: “”, “data”: []}
import 'EntityFactory.dart';

class BaseListEntity<T> {
  String code;
  String message;
  List<T> data;

  BaseListEntity({required this.code, required this.message, required this.data});

  factory BaseListEntity.fromJson(json) {
    List<T> mData=[];
    if (json['data'] != null) {
      //遍历data并转换为我们传进来的类型
      (json['data'] as List).forEach((v) {
        mData.add(EntityFactory.generateOBJ<T>(v));
      });
    }

    return BaseListEntity(
      code: json["code"],
      message: json["msg"],
      data: mData,
    );
  }
}