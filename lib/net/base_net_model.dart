import '../view_model/base_view_model.dart';

abstract class BaseNetModel extends BaseViewModel{
  dynamic fromJson(Map<String,dynamic> json);
}