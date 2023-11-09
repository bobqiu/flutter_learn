/// A custom exception class.
class NetException implements Exception {
  final String? _message;

  String get message => _message ?? '请求出错';

  final int? _code;

  int get code => _code ?? -1;

  NetException([this._message, this._code]);

  @override
  String toString() {
    return "code:$code--message=$message";
  }
}
/// 客户端请求错误
class BadRequestException extends NetException {
  BadRequestException({String? message, int? code}) : super(message, code);
}
/// 服务端响应错误
class BadServiceException extends NetException {
  BadServiceException({String? message, int? code}) : super(message, code);
}



class UnknownException extends NetException {
  UnknownException([String? message]) : super(message);
}

class CancelException extends NetException {
  CancelException([String? message]) : super(message);
}

class NetworkException extends NetException {
  NetworkException({String? message, int? code}) : super(message, code);
}

/// 401
class UnauthorisedException extends NetException {
  UnauthorisedException({String? message, int? code = 401}) : super(message);
}

class BadResponseException extends NetException {
  dynamic data;

  BadResponseException([this.data]) : super();
}
