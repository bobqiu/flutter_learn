
import 'package:dio/dio.dart';
import 'package:new_idea/net/result.dart';

/// A function that takes a `Response` and returns a `Result<T>`.
typedef NetConverter<T> = Result<T> Function(Response response);