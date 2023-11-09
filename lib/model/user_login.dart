class UserLogin {
  String? msg;
  String? code;
  Data? data;

  UserLogin({required this.msg, required this.code, required this.data});

  UserLogin.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    code = json['code'];
    data = (json['data'] != null ? new Data.fromJson(json['data']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class Data {
  int? userId;
  int? groupId;
  String? userName;
  String? userPwd;
  String? userNickName;


  Data(
      {required this.userId,
        required this.groupId,
        required this.userName,
        required this.userPwd,
        required this.userNickName
       });

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    groupId = json['group_id'];
    userName = json['user_name'];
    userPwd = json['user_pwd'];
    userNickName = json['user_nick_name'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['group_id'] = this.groupId;
    data['user_name'] = this.userName;
    data['user_pwd'] = this.userPwd;
    data['user_nick_name'] = this.userNickName;

    return data;
  }
}