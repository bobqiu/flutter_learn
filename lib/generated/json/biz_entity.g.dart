

import '../../component/biz_entity.dart';
import 'base/json_convert_content.dart';

BizEntity $BizEntityFromJson(Map<String, dynamic> json) {
  final BizEntity bizEntity = BizEntity();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    bizEntity.code = code;
  }
  final List<BizData>? data = (json['data'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<BizData>(e) as BizData).toList();
  if (data != null) {
    bizEntity.data = data;
  }
  final dynamic msg = json['msg'];
  if (msg != null) {
    bizEntity.msg = msg;
  }
  return bizEntity;
}

Map<String, dynamic> $BizEntityToJson(BizEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  data['msg'] = entity.msg;
  return data;
}

extension BizEntityExtension on BizEntity {
  BizEntity copyWith({
    int? code,
    List<BizData>? data,
    dynamic msg,
  }) {
    return BizEntity()
      ..code = code ?? this.code
      ..data = data ?? this.data
      ..msg = msg ?? this.msg;
  }
}

BizData $BizDataFromJson(Map<String, dynamic> json) {
  final BizData bizData = BizData();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    bizData.id = id;
  }
  final dynamic username = json['username'];
  if (username != null) {
    bizData.username = username;
  }
  final dynamic nickname = json['nickname'];
  if (nickname != null) {
    bizData.nickname = nickname;
  }
  final dynamic email = json['email'];
  if (email != null) {
    bizData.email = email;
  }
  final dynamic mobile = json['mobile'];
  if (mobile != null) {
    bizData.mobile = mobile;
  }
  final dynamic sex = json['sex'];
  if (sex != null) {
    bizData.sex = sex;
  }
  final String? avatar = jsonConvert.convert<String>(json['avatar']);
  if (avatar != null) {
    bizData.avatar = avatar;
  }
  final dynamic dept = json['dept'];
  if (dept != null) {
    bizData.dept = dept;
  }
  final dynamic posts = json['posts'];
  if (posts != null) {
    bizData.posts = posts;
  }
  return bizData;
}

Map<String, dynamic> $BizDataToJson(BizData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['username'] = entity.username;
  data['nickname'] = entity.nickname;
  data['email'] = entity.email;
  data['mobile'] = entity.mobile;
  data['sex'] = entity.sex;
  data['avatar'] = entity.avatar;
  data['dept'] = entity.dept;
  data['posts'] = entity.posts;
  return data;
}

extension BizDataExtension on BizData {
  BizData copyWith({
    int? id,
    dynamic username,
    dynamic nickname,
    dynamic email,
    dynamic mobile,
    dynamic sex,
    String? avatar,
    dynamic dept,
    dynamic posts,
  }) {
    return BizData()
      ..id = id ?? this.id
      ..username = username ?? this.username
      ..nickname = nickname ?? this.nickname
      ..email = email ?? this.email
      ..mobile = mobile ?? this.mobile
      ..sex = sex ?? this.sex
      ..avatar = avatar ?? this.avatar
      ..dept = dept ?? this.dept
      ..posts = posts ?? this.posts;
  }
}