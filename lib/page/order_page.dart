import 'package:flutter/material.dart';
import 'package:new_idea/view_model/order_view_model.dart';

import '../provider/provider_widget.dart';
import '../widgets/common_refresh_widget.dart';
import '../widgets/common_view_state_helper.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("订单列表"),
          centerTitle: true,
        ),
        body: ProviderWidget<OrderViewModel>(
          onModelReady: (model) {
            loadData(model);
          },
          viewModel: OrderViewModel(),
          builder: (context, model, child) {
            var modelstate=!model.isSuccess();
            print("!model.isSuccess(),$modelstate");
            if (!model.isSuccess()) {
              return CommonViewStateHelper(
                model: model,
                onEmptyPressed: () => loadData(model),
                onErrorPressed: () => loadData(model),
                onNoNetworkPressed: () => loadData(model),
              );
            }
            return  CommonRefreshWidget(
                easyRefreshController: model.easyRefreshController,
                onRefresh: () => model.refreshOrderData(),
                onLoad: ()=>model.loadMoreOrderData(),
                listView: ListView.separated(
                  itemCount: model.currentOrderDataList!=null?model.currentOrderDataList!.length:0,
                  separatorBuilder: (BuildContext context, int index) => const Divider(),
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(model.currentOrderDataList![index].no.toString()),
                    );
                  },
                )
            );
          },
        ));
  }
}
loadData(OrderViewModel model) {
  print("model:$model");
  model.getOrderData();
  print("");
}
