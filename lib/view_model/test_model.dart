import 'package:flutter/cupertino.dart';
import 'package:new_idea/net/base_repository.dart';

class TestModel extends ChangeNotifier {
  String title = "";

  String get value => title;

  TestModel({this.title = "2"});

  setTitle(value) {
    final res =   BaseRepository.instance.get("biz/list");
    print("res::$res");

    title = title + value+res.toString();
    notifyListeners();
  }

  removeTitle() {
    title = "";
    notifyListeners();
  }
}


class TestMode2 extends ChangeNotifier {
  String title = "";

  String get value => title;

  TestMode2({this.title = "55555"});

  setTitle(value) {
    title = title + value;
    notifyListeners();
  }

  removeTitle() {
    title = "";
    notifyListeners();
  }
}