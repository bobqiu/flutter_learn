import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:new_idea/config/net_init.dart';
import 'package:new_idea/page/login_page.dart';
import 'package:new_idea/page/splash_page.dart';
import 'package:new_idea/res/app_color.dart';
import 'package:new_idea/routers/application.dart';
import 'package:new_idea/routers/routes.dart';
import 'package:new_idea/utils/event_bus_utils.dart';
import 'package:new_idea/utils/global_context.dart';
import 'package:new_idea/utils/sp_utils.dart';
import 'package:new_idea/utils/system/dd_system_chrome.dart';
import 'package:new_idea/view_model/app_theme_model.dart';
import 'package:provider/provider.dart';

import 'config/provider_manager.dart';
// final GlobalKey<NavigatorState> globalNavigatorKey = GlobalKey();

void main() {
  // 禁用提示
  Provider.debugCheckInvalidValueType = null;

  // widget和flutter初始化
  WidgetsFlutterBinding.ensureInitialized();
  NetInit();
  SpUtils.getInstance();
  EventBusUtils.instance;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  _MyAppState() {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    GlobalContext.setContext = context;
    return MultiProvider(
        providers: providers,
      child: Builder(
        builder: (context) => MaterialApp(
          title: "新思考新思维",
          color: AppColor.black,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
              secondary: Colors.red, // Your accent color
            ),
            scaffoldBackgroundColor: AppColor.white,
            appBarTheme: AppBarTheme(
              color: AppColor.black,
            ),
            iconTheme: IconThemeData(
              color: context.watch<AppThemeViewModel>().iconThemeColor,
            ),
          ),
         // navigatorKey: globalNavigatorKey,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Application.router?.generator,
          home: AnnotatedRegion(
            value: DdSystemChrome.statusDark,
            child: SplashPage(),
          ),
        ),
      ),
    );
  }
}
