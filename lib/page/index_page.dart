import 'package:flutter/material.dart';

import '../provider/provider_widget.dart';
import '../view_model/home_view_model.dart';

class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("热播列表"),
          centerTitle: true,
        ),
        body: ProviderWidget<HomeViewModel>(
          onModelReady: (model) {
            loadData(model);
          },
          model: HomeViewModel(title: "3"),
          builder: (context, model, child) {
            print("HomeModel重新build");
            return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: _buildContent(model));
          },
        ));
  }
}

Widget _buildContent(HomeViewModel model) {
  return ListView.separated(
    itemCount: model.bizDataValue!=null?model.bizDataValue!.length:0,
    separatorBuilder: (BuildContext context, int index) => const Divider(),
    itemBuilder: (BuildContext context, int index) {
      return ListTile(
        title: Text(model.bizDataValue![index].id.toString()),
      );
    },
  );
}

loadData(HomeViewModel model) {
  print("model:$model");
  model.getList();
  print("");
}
