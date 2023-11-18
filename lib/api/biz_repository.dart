import 'dart:convert';


import 'package:flutter/material.dart';

import '../component/biz_entity.dart';
import '../model/biz_model.dart';
import '../net/base_repository.dart';
import '../net/result.dart';


class BizRepository extends BaseRepository {
  BizRepository() {}
  late int txt = 0;

  dynamic requestGet() async {
    var appResponse = await get("biz/list");


    // print("appResponse,$appResponse");
    appResponse?.when(success: (dynamic) {
      //  debugPrint("原始返回值成功返回，$dynamic");
      /* var data = dynamic['data'];

      debugPrint("原始返回值，$data");*/
      //return dynamic;
    }, failure: (String msg, int code) {
      print("失败了：msg=$msg/code=$code");
    });
    return appResponse;
    print("＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝");
  }

  void requestGet1() async {
    var appResponse = await get("biz/list", decodeType: BizModel());
    print("appResponse1,$appResponse");
    appResponse?.when(success: (model) {
      print("不带泛型model1,$model");
      var data = model.data;
      print("不带泛型1,$data");
      var size = model.data?.length;
      print("不带泛型1成功返回$size条");
    }, failure: (String msg, int code) {
      print("失败了：msg=$msg/code=$code");
    });
    print("＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝");
  }

  Future<List<BizData>> requestGetGeneric() async {
    late List<BizData> bizDataList;
    Result<BizEntity> appResponse =
    await get<BizEntity, BizEntity>("biz/list", decodeType: BizEntity());
    print("appResponse2,$appResponse");
    appResponse?.when(success: (model) {
     // print("带泛型model2,$model");
      List<BizData> biz = model.data as List<BizData>;
     // print("带泛型model2,data,${model.data}");
      print("biz,data,$biz");
      bizDataList = biz;
      return biz;
      var data = model.data?.first.id;
      txt = data!;
      print("带泛型2,$data");
      print("带泛型2txt,$txt");
      var size = model.data?.length;
      print("带泛型2成功返回$size条");
    }, failure: (String msg, int code) {
      print("失败了：msg=$msg/code=$code");
    });
    return bizDataList;
    print("＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝");
  }

  Future<BizEntity> requestGetGenericEntity() async {
    late BizEntity bizEntity=BizEntity();
    Result<BizEntity> appResponse =
    await get<BizEntity, BizEntity>("/trade/biz/list?tm="+DateTime.now().microsecondsSinceEpoch.toString(), decodeType: BizEntity());
    print("appResponse2,$appResponse");
    appResponse?.when(success: (model) {
      print("带泛型model2,$model");
      print("带泛型model2,data,${model.data}");
      bizEntity = model;
      var data = model.data;
      print("带泛型2,$data");
      var size = model.data?.length;
      print("带泛型2成功返回$size条");
    }, failure: (String msg, int code) {
      print("失败了：msg=$msg/code=$code");
      bizEntity.code=code;
      bizEntity.msg=msg;
    });
    print("bizentity,$bizEntity");
    return bizEntity;
    print("＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝");
    }
}