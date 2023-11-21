import 'package:flutter/cupertino.dart';

class IndexViewModel with ChangeNotifier{
  PageController _pageController;
  int navBarCurrentIndex = 0;
  bool isShowIndexAppBar = true;

  void setNavBarCurrentIndex(int navBarCurrentIndex) {
    this.navBarCurrentIndex = navBarCurrentIndex;
    isShowIndexAppBar = this.navBarCurrentIndex != 4;
    _pageController.jumpToPage(navBarCurrentIndex);
    notifyListeners();
  }

  IndexViewModel(this._pageController);
}