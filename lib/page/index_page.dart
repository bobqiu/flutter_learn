
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_idea/page/home_page.dart';
import 'package:new_idea/page/login_page.dart';
import 'package:new_idea/provider/provider_widget.dart';
import 'package:new_idea/res/app_color.dart';
import 'package:new_idea/routers/navigator_utils.dart';
import 'package:new_idea/utils/event_bus_utils.dart';
import 'package:new_idea/view_model/index_view_model.dart';
import 'package:new_idea/widgets/common_customer_bar.dart';

class IndexPage extends StatefulWidget {
  static const String TAB_HOME = "首页";
  static const String TAB_MOVIE = "电影";
  static const String TAB_SHOW = "综艺";
  static const String TAB_CARTOON = "动漫";
  static const String TAB_ME = "我的";
  static const String TAB_TELEPLAY = "连续剧";
  static const String CLASSES = "classes";

  IndexPage(this.currentTabName);

  String currentTabName;

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final bottomBarItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: IndexPage.TAB_HOME),
    BottomNavigationBarItem(
        icon: Icon(IconData(0xe80b, fontFamily: "appIconFonts")),
        label: IndexPage.TAB_ME),
  ];

  var _pageController = PageController();

  late List<dynamic> _list=[];
  late DateTime _lastPressed;

  var unauthEvent;
  @override
  void initState() {
    super.initState();
    //监听到401状态码
    unauthEvent=eventBus.on<UnAuthenticate>((event) {
      print('page A received msg');
      eventBus.off(unauthEvent);
      NavigatorUtils.goToLoginRemovePage(context);
      //NavigatorUtils.jumpLeft(context, '/normalPage');
    });
   /* eventBusUtils.on<UnAuthenticate>((unAuthenticate){
      NavigatorUtils.goToLoginRemovePage(context);
      return ;
    });*/
   /* eventBus.on<UnAuthenticate>().listen((event) {
      RouteRedirect().authLoginPageCouldNotBack(context);
      return;
    });*/
    _list
      ..add(HomePage(title: 'sssss',))
      ..add(LoginPage());
  }

  @override
  void dispose() {
    super.dispose();
    eventBus.off(unauthEvent);

  }

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<IndexViewModel>(
      onModelReady: (model) {
        print("widget.currentTabName:${widget.currentTabName}");
        switch (widget.currentTabName) {
          case IndexPage.TAB_HOME:
            model.navBarCurrentIndex = 0;
            break;
          case IndexPage.TAB_MOVIE:
            model.navBarCurrentIndex = 1;
            break;
          case IndexPage.TAB_TELEPLAY:
            model.navBarCurrentIndex = 2;
            break;
          case IndexPage.TAB_SHOW:
            model.navBarCurrentIndex = 3;
            break;
          case IndexPage.TAB_ME:
            model.navBarCurrentIndex = 4;
            break;
        }
      },
      viewModel: IndexViewModel(_pageController),
      builder: (BuildContext context, IndexViewModel model, Widget? child) {
        return Scaffold(
          backgroundColor: AppColor.black,
          appBar: model.isShowIndexAppBar
              ? CommonCustomerBar(
            contentHeight: 50,
            backgroundColor: Colors.white,
          )
              : null,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: model.navBarCurrentIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              model.setNavBarCurrentIndex(index);
            },
            items: bottomBarItems,
          ),
          body: WillPopScope(
            onWillPop: () async {
              if (_lastPressed == null ||
                  DateTime.now().difference(_lastPressed) >
                      Duration(seconds: 1)) {
                //两次点击间隔超过1秒则重新计时
                Fluttertoast.showToast(msg: "再一次点击返回");
                _lastPressed = DateTime.now();
                return false;
              }
              return true;
            },
            child: Container(
                color: AppColor.white, child: _buildIndexContent(model)),
          ),
        );
      },
      child: CommonCustomerBar(
        contentHeight: 50,
        backgroundColor: Colors.white,
      ),
    );
  }

  Widget _buildIndexContent(model) {
    return PageView.builder(
      itemBuilder: (ctx, index) => _list[index],
      itemCount: _list.length,
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}
