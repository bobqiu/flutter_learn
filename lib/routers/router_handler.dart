import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:new_idea/page/home_page.dart';
import 'package:new_idea/page/splash_page.dart';

import '../page/index_page.dart';
import '../page/login_page.dart';
import '../page/normal_page.dart';
import '../page/order_list_page.dart';
import '../page/order_page.dart';
import '../page/refresh_page.dart';
import '../page/routing_reference.dart';
import '../page/test_provider_refresh_page.dart';

/**
 * handler就是每个路由的规则，编写handler就是配置路由规则，比如我们要传递参数，参数的值是什么，这些都需要在Handler中完成。
 */
// 登陆页面
Handler loginHandler = Handler(handlerFunc: (context, params) {
  return LoginPage();
});
// 首页
Handler indexPageHandler = Handler(
  handlerFunc: (context, params) {
    var currentTabName = params["type"]?[0];
    return IndexPage(currentTabName!);
  },
);
Handler homePageHandler=Handler(handlerFunc: (context,params){
  return HomePage(title: '',);
});
//　引导页
Handler splashPageHandler=Handler(handlerFunc: (context,params){
  return SplashPage();
});

//集成刷新
Handler refreshPageHandler = Handler(handlerFunc: (context, params) {
  return RefreshPage();
});
Handler testProviderRefreshPageHandler =
    Handler(handlerFunc: (context, params) {
  return TestProviderRefreshPage();
});
// 正常路由跳转
Handler normalPageHandler = Handler(handlerFunc: (context, params) {
  return NormalPage();
});

// 路由传参
Handler routingReferenceHandler = Handler(handlerFunc: (context, params) {
  String id = params['id']!.first;
  return RoutingReference(id: id);
});


//订单基础页带上下拉
Handler orderPageHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> parameters) {
  return OrderPage();
});
//订单列表页带分页
Handler orderListPageHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> parameters) {
  return OrderListPage();
});
