import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../page/index_page.dart';
import '../page/login.dart';
import '../page/normal_page.dart';
import '../page/routing_reference.dart';

/**
 * handler就是每个路由的规则，编写handler就是配置路由规则，比如我们要传递参数，参数的值是什么，这些都需要在Handler中完成。
 */

// 首页
Handler indexPageHanderl = Handler(
  handlerFunc:  (context, params) {
    return IndexPage();
  },
);

// 正常路由跳转
Handler normalPageHanderl = Handler(
    handlerFunc: (context, params){
      return NormalPage();
    }
);

// 路由传参
Handler routingReferenceHanderl = Handler(
    handlerFunc:  (context, params){
      String id = params['id']!.first;
      return RoutingReference(id: id);
    }
);

// 登陆页面
Handler loginHanderl = Handler(
    handlerFunc:  (context, params) {
      return Login();
    }
);