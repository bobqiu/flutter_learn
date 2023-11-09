
import '../model/user_login.dart';
import 'DioManager.dart';
import 'NWMethod.dart';
import 'baseApi.dart';

class Api {
  ///示例请求
  static UserLoginApi(Map<String , dynamic> param ) async {
    return await DioManager().request<UserLogin>(
            NWMethod.GET,
            NWApi.loginPath,
            params: param,
            success: (data) {
print(data);
            },
            error: (error) {
              print("error code = ${error?.code}, massage = ${error?.message}");
            }
          );
      }
}
