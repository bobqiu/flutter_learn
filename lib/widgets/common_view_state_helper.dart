import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_idea/view_model/base_view_model.dart';
import '../provider/view_state.dart';
import '../res/app_color.dart';

class CommonViewStateHelper<T extends BaseViewModel> extends StatelessWidget {
  final T model;
  final VoidCallback? onEmptyPressed;
  final VoidCallback? onErrorPressed;
  final VoidCallback? onNoNetworkPressed;

  CommonViewStateHelper({
    required this.model,
    this.onEmptyPressed,
    this.onErrorPressed,
    this.onNoNetworkPressed,
  });

  @override
  Widget build(BuildContext context) {
    if (model!.isLoading()) {
      return new CommonViewStateLoadingWidget();
    } else if (model!.isEmpty()) {
      return new CommonViewStateEmptyWidget(onPressed: onEmptyPressed);
    } else if (model!.isError()) {
     // Fluttertoast.showToast(msg: '请求失败');
      return new CommonViewStateErrorWidget(
          error: model?.viewStateError, onPressed: onErrorPressed);
    } else if (model!.isNoNetWork()) {
    //  Fluttertoast.showToast(msg: '当前没有网络');
      return new CommonViewStateNoNetWorkWidget(onPressed: onNoNetworkPressed);
    } else {
      throw new Exception('状态异常，请核查状态');
    }
  }
}

class CommonViewStateNoNetWorkWidget extends StatelessWidget {
  final String? message;
  final VoidCallback? onPressed;

  CommonViewStateNoNetWorkWidget({this.message, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
          onTap: () {
            onPressed!();
          },
          child: Center(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Text(
                message ?? '没有网络,点击重试',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: AppColor.black_33),
              ),
            ),
          )),
    );
  }
}

class CommonViewStateErrorWidget extends StatelessWidget {
  final ViewStateError? error;
  final VoidCallback? onPressed;

  CommonViewStateErrorWidget({this.error, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
          onTap: () {
            onPressed!();
          },
          child: Center(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Text(
                '数据请求异常,点击重试',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: AppColor.black_33),
              ),
            ),
          )),
    );
  }
}

class CommonViewStateEmptyWidget extends StatelessWidget {
  final String? message;
  final VoidCallback? onPressed;

  CommonViewStateEmptyWidget({this.message, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          onPressed!();
        },
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Text(
              message ?? '暂无数据，点击重试',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: AppColor.black_33),
            ),
          ),
        ),
      ),
    );
  }
}

class CommonViewStateLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: AppColor.white,
      body: new Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}