import 'package:flutter/services.dart';
import 'package:new_idea/res/app_color.dart';

class DdSystemChrome {
  static const SystemUiOverlayStyle statusDark = SystemUiOverlayStyle(
    statusBarColor: Color(0xFF000000),
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
  );
  static const SystemUiOverlayStyle statusTransparent = SystemUiOverlayStyle(
      statusBarColor: AppColor.transparent,
      statusBarBrightness: Brightness.dark);
}
