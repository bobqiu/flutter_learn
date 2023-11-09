import '../net/base_net_model.dart';

class BizModel  extends BaseNetModel{
  List<BizBean>? data;
  num? code;
  String? msg;

  BizModel({this.data, this.code,this.msg});
  BizModel fromJson(Map<String, dynamic> json) {
    print("json,$json");
    return BizModel.fromJson(json);
  }
  BizModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(BizBean.fromJson(v));
      });
    }
    code=json['code'];
    msg=json['msg'];

  }
}

class BizBean extends BaseNetModel{
  int? id;
  String? username;
  BizBean({this.id, this.username});

  BizBean.fromJson(dynamic json) {
    id=json['id'];
    username=json['username'];

  }
  @override
  BizBean fromJson(Map<String, dynamic> json) {
    return BizBean.fromJson(json);
  }
}
