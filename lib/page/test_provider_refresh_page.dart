import 'package:flutter/material.dart';

import '../provider/provider_widget.dart';
import '../view_model/home_view_model.dart';
import 'package:easy_refresh/easy_refresh.dart';

class TestProviderRefreshPage extends StatefulWidget {
  @override
  State<TestProviderRefreshPage> createState() =>
      _TestProviderRefreshPageState();
}

class _TestProviderRefreshPageState extends State<TestProviderRefreshPage> {
  int _count = 10;
  late EasyRefreshController _controller;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController(
      controlFinishRefresh: true,
      controlFinishLoad: true,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("热播列表providerproxy+单refresh"),
          centerTitle: true,
        ),
        body: ProviderWidget<HomeViewModel>(
          onModelReady: (model) {
            loadData(model);
          },
          viewModel: HomeViewModel(title: "3"),
          builder: (context, model, child) {
            print("HomeModel重新build");
            return EasyRefresh(
              controller: _controller,
              header: ClassicHeader(
                dragText: 'Pull to refresh',
                armedText: 'Release ready,准备',
                readyText: 'Refreshing...ready。。。。准备',
                processingText: 'Refreshing...process，进行中',
                processedText: 'Succeeded,hell，成功',
                noMoreText: 'No more',
                failedText: 'Failed',
                messageText: 'Last updated at %T',
                safeArea: false,
              ),
              footer: const ClassicFooter(),
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 4));
                if (!mounted) {
                  return;
                }
                setState(() {
                  _count = 10;
                });
                _controller.finishRefresh();
                _controller.resetFooter();
              },
              onLoad: () async {
                await Future.delayed(const Duration(seconds: 4));
                if (!mounted) {
                  return;
                }
                setState(() {
                  _count += 5;
                });
                _controller.finishLoad(_count >= 20
                    ? IndicatorResult.noMore
                    : IndicatorResult.success);
              },
              child: ListView.separated(
                itemCount: model.bizDataValue != null ? model.bizDataValue!.length : 0,
                separatorBuilder: (BuildContext context, int index) => const Divider(),
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(model.bizDataValue![index].toString()),
                  );
                },
              )
            );
          },
        ));
  }
}

loadData(HomeViewModel model) {
  print("model:$model");
  model.getList();
  print("");
}
