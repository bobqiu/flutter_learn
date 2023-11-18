import 'package:flutter/material.dart';
import 'package:new_idea/view_model/home_view_model.dart';
import 'package:new_idea/widgets/common_refresh_widget.dart';
import 'package:easy_refresh/easy_refresh.dart';
import '../provider/provider_widget.dart';

class RefreshPage extends StatefulWidget {
  const RefreshPage({super.key});

  @override
  State<RefreshPage> createState() => _RefreshPageState();
}

class _RefreshPageState extends State<RefreshPage> {
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
          title: Text("刷新列表proxy＋封装refresh"),
          centerTitle: true,
        ),
        body: ProviderWidget<HomeViewModel>(
          onModelReady: (model) {
            loadData(model);
          },
          viewModel: HomeViewModel(),
          builder: (context, model, child) {
            return  CommonRefreshWidget(
                easyRefreshController: _controller,
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
                listView: ListView.separated(
                  itemCount: model.bizDataValue!=null?model.bizDataValue!.length:0,
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