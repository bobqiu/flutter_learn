import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:new_idea/net/auth_interceptor.dart';

import '../net/default_net_decoder.dart';
import '../net/net_options.dart';

NetInit() {
  NetOptions.instance
      // header
      .addHeaders({"Authorization": 'Bearer 1c448392d3b1475d82ba70550d3113e7'})
      //.setBaseUrl("http://192.168.43.192:48080/admin-api")
     // .setBaseUrl("http://192.168.71.40:48080/admin-api")
      .setBaseUrl("http://172.16.139.128:48080/admin-api")
      //.setBaseUrl("http://192.168.125.117:48080/admin-api")
      // 代理/https
      // .setHttpClientAdapter(IOHttpClientAdapter()
      //   ..onHttpClientCreate = (client) {
      //     client.findProxy = (uri) {
      //       return 'PROXY 192.168.120.143:8888';
      //     };
      //     client.badCertificateCallback =
      //         (X509Certificate cert, String host, int port) => true;
      //     return client;
      //   })
      // cookie
      .addInterceptor(CookieManager(CookieJar()))
      // dio_http_cache
      // .addInterceptor(DioCacheManager(CacheConfig(
      //   baseUrl: "https://www.xxx.com/",
      // )).interceptor)
      // dio_cache_interceptor
      .addInterceptor(AuthInterceptor())
      .addInterceptor(DioCacheInterceptor(
          options: CacheOptions(
            store: MemCacheStore(),
        policy: CachePolicy.forceCache,
        hitCacheOnErrorExcept: [401, 403],
        maxStale: const Duration(days: 7),
        priority: CachePriority.normal,
        cipher: null,
        keyBuilder: CacheOptions.defaultCacheKeyBuilder,
        allowPostMethod: false,
      )))
      //  全局解析器
      .setHttpDecoder(DefaultNetDecoder.getInstance())
      //  超时时间
      .setConnectTimeout(const Duration(milliseconds: 3000))
      // 允许打印log，默认未 true
      .enableLogger(true)
      .create();
}
