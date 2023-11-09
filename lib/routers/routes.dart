import 'package:fluro/fluro.dart';
import 'package:new_idea/routers/router_handler.dart';

class Routes {
  static String root = '/';
  static String indexPage = '/indexPage';
  static String normalPage = '/normalPage';
  static String routingReference = '/routingReference';
  static String login = '/login';
  static String refreshPage='/refreshPage';

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(handlerFunc: (context, params) {
      print('ERROR====>ROUTE WAS NOT FONUND!!!'); // 找不到路由，跳转404页面
      print('找不到路由，404');
    });
    /*router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        print('ERROR====>ROUTE WAS NOT FONUND!!!'); // 找不到路由，跳转404页面
        print('找不到路由，404');
      },
    );*/

    // 路由页面配置
    router.define(indexPage, handler: indexPageHanderl);
    router.define(normalPage, handler: normalPageHanderl);
    router.define(routingReference, handler: routingReferenceHanderl);
    router.define(login, handler: loginHanderl);
    router.define(refreshPage, handler: refreshPageHanderl);
  }
}
