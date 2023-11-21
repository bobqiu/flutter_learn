import 'package:flutter/material.dart';
import 'package:new_idea/res/app_color.dart';

class AppThemeViewModel extends ChangeNotifier {
  Color iconThemeColor = AppColor.default_icon_grey;
  Color txtColor = AppColor.default_txt_grey;

  void setIconThemeColor(Color iconThemeColor) {
    this.iconThemeColor = iconThemeColor;
  }

  void setTxtColor(Color txtColor) {
    this.txtColor = txtColor;
  }

  void setHomeDetailPageThemeColor() {
    setIconThemeColor(AppColor.white);

    setTxtColor(AppColor.white);
  }

  void setHomePageThemeColor() {
    setIconThemeColor(AppColor.default_icon_grey);
    setTxtColor(AppColor.default_txt_grey);
  }

  void setDynamicActionBarColor(
      {required Color iconThemeColor, required Color txtColor}) {
    setTxtColor(txtColor ?? AppColor.default_txt_grey);
  }
}