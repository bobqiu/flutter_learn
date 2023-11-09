import 'package:dio/dio.dart';

import 'BaseEntity.dart';
import 'BaseListEntity.dart';
import 'ErrorEntity.dart';
import 'NWMethod.dart';
import 'baseApi.dart';


/**
 *  dio封装参考这一篇 https://juejin.im/post/6844903708757590024#heading-4
 */

class DioManager {
  static final DioManager _shared = DioManager._internal();
  factory DioManager() => _shared;
  Dio dio=new Dio();
  DioManager._internal() {
    if (dio == null) {
      BaseOptions options = BaseOptions(
        baseUrl: NWApi.baseApi,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        receiveDataWhenStatusError: false,
      /*  connectTimeout: Duration(30000),
        receiveTimeout: 3000,*/
      );
      dio = Dio(options);
    }
  }

  // 请求，返回参数为 T
  // method：请求方法，NWMethod.POST等
  // path：请求地址
  // params：请求参数
  // success：请求成功回调
  // error：请求失败回调
  Future request<T>(NWMethod method, String path, {Map? params, Function(T)? success, Function(ErrorEntity)? error}) async {
    try {
      Response response = await dio.request(path, data: params, options: Options(method: NWMethodValues[method]));
      if (response != null) {
        BaseEntity entity = BaseEntity<T>.fromJson(response.data);
        if (entity.code == "000000") {
          success!(entity.data);
          return entity.data;
        } else {
          error!(ErrorEntity(code: entity.code, message: entity.message));
        }
      } else {
        error!(ErrorEntity(code: "-1", message: "未知错误"));
      }
    } on DioException catch(e) {
     // error!(createErrorEntity(e.type));
    }
  }

  // 请求，返回参数为 List
  // method：请求方法，NWMethod.POST等
  // path：请求地址
  // params：请求参数
  // success：请求成功回调
  // error：请求失败回调
  Future requestList<T>(NWMethod method, String path, {Map? params, Function(List<T>)? success, Function(ErrorEntity)? error}) async {
    try {
      Response response = await dio.request(path, data: params, options: Options(method: NWMethodValues[method]));
      if (response != null) {
        BaseListEntity<T> entity = BaseListEntity<T>.fromJson(response.data);
        if (entity.code == 0) {
          success!(entity.data);
        } else {
          error!(ErrorEntity(code: entity.code, message: entity.message));
        }
      } else {
        error!(ErrorEntity(code: "-1", message: "未知错误"));
      }
    } on DioException catch(e) {
     // error!(createErrorEntity(e.type));
    }
  }

  // 错误信息
  ErrorEntity? createErrorEntity(DioExceptionType error) {
    switch (error.toString()) {
      case DioExceptionType.cancel:{
        return ErrorEntity(code:" -1", message: "请求取消");
      }
      break;
      case DioExceptionType.connectionTimeout:{
        return ErrorEntity(code: "-1", message: "连接超时");
      }
      break;
      case DioExceptionType.sendTimeout:{
        return ErrorEntity(code: "-1", message: "请求超时");
      }
      break;
      case DioExceptionType.receiveTimeout:{
        return ErrorEntity(code: "-1", message: "响应超时");
      }
      break;
      case DioExceptionType.badResponse:{
        try {
         /* int? errCode = response.statusCode;
          String? errMsg = response.statusMessage;
          return ErrorEntity(code: "$errCode", message: errMsg!!);*/
//          switch (errCode) {
//            case 400: {
//              return ErrorEntity(code: errCode, message: "请求语法错误");
//            }
//            break;
//            case 403: {
//              return ErrorEntity(code: errCode, message: "服务器拒绝执行");
//            }
//            break;
//            case 404: {
//              return ErrorEntity(code: errCode, message: "无法连接服务器");
//            }
//            break;
//            case 405: {
//              return ErrorEntity(code: errCode, message: "请求方法被禁止");
//            }
//            break;
//            case 500: {
//              return ErrorEntity(code: errCode, message: "服务器内部错误");
//            }
//            break;
//            case 502: {
//              return ErrorEntity(code: errCode, message: "无效的请求");
//            }
//            break;
//            case 503: {
//              return ErrorEntity(code: errCode, message: "服务器挂了");
//            }
//            break;
//            case 505: {
//              return ErrorEntity(code: errCode, message: "不支持HTTP协议请求");
//            }
//            break;
//            default: {
//              return ErrorEntity(code: errCode, message: "未知错误");
//            }
//          }
        } on Exception catch(_) {
          return ErrorEntity(code: "-1", message: "未知错误");
        }
      }
      break;
      default: {
      //  return ErrorEntity(code:" -1", message: response.statusMessage!!);
      }
    }
  }
}