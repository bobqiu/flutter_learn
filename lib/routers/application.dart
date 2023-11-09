
import 'package:fluro/fluro.dart';
class Application {
  static  FluroRouter router=FluroRouter();
  static void initRouter() {
    if (router == null) {
      router = FluroRouter();
    }
  }
}