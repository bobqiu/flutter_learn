import 'package:dio/dio.dart'
    show
        DioException,
        ErrorInterceptorHandler,
        InterceptorsWrapper,
        RequestInterceptorHandler,
        RequestOptions,
        Response,
        ResponseInterceptorHandler;
import 'package:new_idea/main.dart';
import 'package:new_idea/page/login_page.dart';
import 'package:new_idea/routers/navigator_utils.dart';
import 'package:new_idea/routers/routes.dart';
import 'package:new_idea/utils/event_bus_utils.dart';
import 'package:new_idea/utils/global_context.dart';
import 'package:new_idea/utils/sp_utils.dart';

class AuthInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    var autherization = SpUtils.getString("Authorization");
   // var autherization="test";
    print("autherization:$autherization");
    print("autherization?.isEmpty;==null:${autherization?.isEmpty}");
    print("autherization=="":${autherization==""}");

    if(autherization!.isEmpty) {
      //通知home页面用户未认证，跳转到login页面
      eventBus.emit(UnAuthenticate("unauth"));
     /* globalNavigatorKey.currentState
          ?.pushNamedAndRemoveUntil('/login', (route) => false);*/
   //   NavigatorUtils.jump(GlobalContext.context,Routes.login);
    }
     options.headers["Authorization"]="";
    handler.next(options);

  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print("err:::,$err, $handler");
    super.onError(err, handler);
  }

  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
      super.onResponse(response, handler);

  }
}
