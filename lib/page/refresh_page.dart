import 'package:flutter/material.dart';
import 'package:new_idea/page/dragger/dragger_tile.dart.bak';
import 'package:new_idea/view_model/refresh_view_model.dart';
import 'package:new_idea/widgets/common_refresh_widget.dart';

import '../provider/provider_widget.dart';
import '../widgets/common_view_state_helper.dart';

class RefreshPage extends StatefulWidget {
  const RefreshPage({super.key});

  @override
  State<RefreshPage> createState() => _RefreshPageState();
}

class _RefreshPageState extends State<RefreshPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*appBar: AppBar(
          title: Text("刷新列表proxy＋封装refresh"),
          centerTitle: true,
        ),*/

        body: ProviderWidget<RefreshViewModel>(
      onModelReady: (model) {
        loadData(model);
      },
      viewModel: RefreshViewModel(),
      builder: (context, model, child) {
        var modelstate = !model.isSuccess();
        print("!model.isSuccess(),$modelstate");
        if (!model.isSuccess()) {
          return CommonViewStateHelper(
            model: model,
            onEmptyPressed: () => loadData(model),
            onErrorPressed: () => loadData(model),
            onNoNetworkPressed: () => loadData(model),
          );
        }
        return CommonRefreshWidget(
            easyRefreshController: model.easyRefreshController,
            onRefresh: () => model.refreshBizData(),
            listView: Column(children: <Widget>[
              /*Expanded(
                child: DraggerTile(),
              ),*/
              Expanded(
                  child: ListView.builder(
                itemCount:
                    model.bizDataList != null ? model.bizDataList!.length : 0,/*
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),*/
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(model.bizDataList![index].toString()),
                  );
                },
              ))
            ]));
      },
    ));
  }
}

loadData(RefreshViewModel model) {
  print("model:$model");
  model.getBizDataList();
  print("");
}
