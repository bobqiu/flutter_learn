

import 'dart:convert';

import '../generated/json/base/json_field.dart';
import '../generated/json/biz_entity.g.dart';
import '../net/base_net_model.dart';

@JsonSerializable()
class BizEntity extends BaseNetModel{
	int? code;
	List<BizData>? data;
	dynamic msg;

	BizEntity();

	factory BizEntity.fromJson(Map<String, dynamic> json) => $BizEntityFromJson(json);

	Map<String, dynamic> toJson() => $BizEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}

  @override
  fromJson(Map<String, dynamic> json) {
    return BizEntity.fromJson(json);
  }
}

@JsonSerializable()
class BizData extends BaseNetModel{
	int? id;
	dynamic username;
	dynamic nickname;
	dynamic email;
	dynamic mobile;
	dynamic sex;
	String? avatar;
	dynamic dept;
	dynamic posts;

	BizData();

	factory BizData.fromJson(Map<String, dynamic> json) => $BizDataFromJson(json);

	Map<String, dynamic> toJson() => $BizDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}

  @override
  fromJson(Map<String, dynamic> json) {
    return BizData.fromJson(json);
    
  }
}