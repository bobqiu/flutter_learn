import 'package:fluro/fluro.dart';
import 'package:new_idea/routers/router_handler.dart';

class Routes {
  static String root = '/';
  static String indexPage = '/indexPage';
  static String normalPage = '/normalPage';
  static String routingReference = '/routingReference';
  static String login = '/login';
  static String refreshPage='/refreshPage';
  static String testProviderRefreshPage='/testProviderRefreshPage';
  static String orderPage='/orderPage';
  static String orderListPage='/orderListPage';
  static String splashPage="/splashPage";
  static String homePage="/homePage";

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(handlerFunc: (context, params) {
      router.printTree();
      print(router.toString());
      print('ERROR====>ROUTE WAS NOT FONUND!!!,$router'); // 找不到路由，跳转404页面
      print('找不到路由，404');
    });
    /*router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        print('ERROR====>ROUTE WAS NOT FONUND!!!'); // 找不到路由，跳转404页面
        print('找不到路由，404');
      },
    );*/

    // 路由页面配置
    router.define(splashPage, handler: splashPageHandler);
    router.define(login, handler: loginHandler);
    router.define(indexPage+"/:type", handler: indexPageHandler);
    router.define(normalPage, handler: normalPageHandler);
    router.define(routingReference, handler: routingReferenceHandler);

    router.define(refreshPage, handler: refreshPageHandler);
    router.define(testProviderRefreshPage, handler: testProviderRefreshPageHandler);
    router.define(orderPage, handler: orderPageHandler);
    router.define(orderListPage, handler: orderListPageHandler);

    router.define(homePage, handler: homePageHandler);
  }
}
