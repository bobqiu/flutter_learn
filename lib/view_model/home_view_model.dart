import 'package:flutter/material.dart';
import 'package:new_idea/view_model/base_refresh_view_model.dart';
import 'package:new_idea/view_model/base_view_model.dart';

import '../api/biz_repository.dart';
import '../component/biz_entity.dart';
import '../net/base_repository.dart';
import '../net/result.dart';

class HomeViewModel  extends BaseRefreshViewModel<BizRepository> {
  String title = "";

  String get value => title;

  HomeViewModel({this.title = "55555",this.bizEntity});

  setTitle(value) {
    title = title + value;
    notifyListeners();
  }
  setBizEntity(bizentityValue){
    bizEntity=bizentityValue;
    notifyListeners();
  }

  removeTitle() {
    title = "";
    notifyListeners();
  }

   BizEntity? bizEntity;

  BizEntity? get bizEntityValue => bizEntity;
  List<BizData>? get bizDataValue=>bizEntity?.data;

/*
  BizBean? _bizBean;*/

  /*Future<dynamic> getList() async{
   var requestGet = baseRepository?.requestGet();
   print("requestGet;$requestGet");
   requestGet.then((value) => {print(value.toString())});
   ss=await requestData(baseRepository?.requestGet());
   print('ssssss1111:$ss');
   notifyListeners();
 }*/
  Future<dynamic> getList() async{
    Result<BizEntity>  appResponse = await BaseRepository.instance.get("biz/list?tm="+DateTime.now().microsecondsSinceEpoch.toString(), decodeType: BizEntity());
    print("appResponse2,$appResponse");
    appResponse?.when(success: (model) {
    print("带泛型model2,$model");
    bizEntity=model;
    setBizEntity(model);

    print("带泛型model2,data,${model.data}");
 /*   bizData = model.data!;
    print("带泛型2,$bizData");*/
    var size = model.data?.length;
    print("带泛型2成功返回$size条");
    }, failure: (String msg, int code) {
    print("失败了：msg=$msg/code=$code");
    });
    /*print("bizdata,$bizData");*/

    //return bizData;

  }


  BizRepository createRepository(){
    return BizRepository();
  }
}
