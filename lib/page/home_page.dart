import 'package:flutter/material.dart';
import 'package:new_idea/net/base_repository.dart';
import 'package:new_idea/provider/provider_widget.dart';
import 'package:new_idea/routers/navigator_utils.dart';
import 'package:new_idea/view_model/test_model.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key,required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}
var style = TextStyle(color: Colors.white);
class _HomePageState extends State<HomePage> {

  String src = "1321232131";

  void _testRequest() async {
    /*final res =  await Api.UserLoginApi({
      "user_name": "lalalal2414214",
      "user_pwd": "12312414124"
    });*/
    final res = await BaseRepository.instance
        .get("biz/list?tm=" + DateTime.now().microsecondsSinceEpoch.toString());

    print("res::$res");
    this.setState(() {
      src = res.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          ProviderWidget<TestModel>(
              viewModel: TestModel(title: "3"),
              builder: (context, TestModel, child) {
                print("TestMode1重新build");
                return Container(
                    child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.redAccent,
                            height: 48,
                            child: Row(
                              children: <Widget>[
                                Flexible(child: Text('Child1', style: style)),
                                Flexible(child: Text('Model data: ', style: style)),
                                MaterialButton(
                                  onPressed: () => TestModel.setTitle("2"),
                                  child: Text('add'),
                                ),
                                MaterialButton(
                                  onPressed: () => TestModel.removeTitle(),
                                  child: Text('remove'),
                                ),
                                Container(
                                    color: Colors.deepOrangeAccent,
                                    child: Center(
                                      child: Text('${TestModel.title}', style: style),
                                    )),
                              ],
                            ),
                          ),
                        )));
              }),
          ProviderWidget<TestMode2>(
              viewModel: TestMode2(title: "4"),
              builder: (context, TestModel, child) {
                print("TestMode2重新build");
                return Container(
                    child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.blueAccent,
                            height: 48,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text('Child2', style: style),
                                Flexible(
                                    child: Text('Model data: ${TestModel.title}',
                                        style: style)),
                                MaterialButton(
                                  onPressed: () => TestModel.setTitle("2"),
                                  child: Text('add'),
                                ),
                                MaterialButton(
                                  onPressed: () => TestModel.removeTitle(),
                                  child: Text('remove'),
                                ),
                                MaterialButton(
                                  onPressed: () =>
                                  {NavigatorUtils.jumpLeft(context, '/testProviderRefreshPage')},
                                  child: Text('provider+原refresh集成'),
                                ),
                              ],
                            ),
                          ),
                        )));
              }),
          Container(
              child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.redAccent,
                      height: 48,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          MaterialButton(
                            onPressed: () =>
                            //{NavigatorUtils.goIndexPage(context)},
                            {NavigatorUtils.jump(context, '/indexPage/4')},
                            child: Text('routerRight'),
                          ),
                          MaterialButton(
                            onPressed: () =>
                            {NavigatorUtils.jumpLeft(context, '/normalPage')},
                            child: Text('routerLeft'),
                          ),
                          /*MaterialButton(
                    onPressed: () =>
                    {NavigatorUtil.jumpLeft(context, '/testProviderRefreshPage')},
                    child: Text('provider+refresh集成'),
                  ),*/
                          MaterialButton(
                            onPressed: () =>
                            {NavigatorUtils.jumpLeft(context, '/refreshPage')},
                            child: Text('provider+封装refresh集成'),
                          ),
                        ],
                      ),
                    ),
                  ))),
          Container(
              child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.yellowAccent,
                      height: 48,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          MaterialButton(
                            onPressed: () =>
                            {NavigatorUtils.jump(context, '/orderPage')},
                            child: Text('订单演示'),
                          ),
                          MaterialButton(
                            onPressed: () =>
                            {NavigatorUtils.jumpLeft(context, '/orderListPage')},
                            child: Text('订单分页'),
                          ),
                          /*MaterialButton(
                    onPressed: () =>
                    {NavigatorUtil.jumpLeft(context, '/testProviderRefreshPage')},
                    child: Text('provider+refresh集成'),
                  ),*/
                          MaterialButton(
                            onPressed: () =>
                            {NavigatorUtils.jumpLeft(context, '/refreshPage')},
                            child: Text('provider+封装refresh集成'),
                          ),
                        ],
                      ),
                    ),
                  ))),
          Container(
              child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.blueAccent,
                      height: 48,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          MaterialButton(
                            onPressed: () =>
                            //{NavigatorUtils.jump(context, '/indexPage')},
                            {NavigatorUtils.goIndexPage(context)},
                            child: Text('routerRight'),
                          ),
                          MaterialButton(
                            onPressed: () =>
                            {NavigatorUtils.jumpLeft(context, '/normalPage')},
                            child: Text('routerLeft'),
                          ),
                          /*MaterialButton(
                    onPressed: () =>
                    {NavigatorUtil.jumpLeft(context, '/testProviderRefreshPage')},
                    child: Text('provider+refresh集成'),
                  ),*/
                          MaterialButton(
                            onPressed: () =>
                            {NavigatorUtils.jumpLeft(context, '/refreshPage')},
                            child: Text('provider+封装refresh集成'),
                          ),
                        ],
                      ),
                    ),
                  ))),
          Container(
              child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.amberAccent,
                      height: 48,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          MaterialButton(
                            onPressed: () =>
                            {NavigatorUtils.jump(context, '/indexPage')},
                            child: Text('routerRight'),
                          ),
                          MaterialButton(
                            onPressed: () =>
                            {NavigatorUtils.jumpLeft(context, '/normalPage')},
                            child: Text('routerLeft'),
                          ),
                          /*MaterialButton(
                    onPressed: () =>
                    {NavigatorUtil.jumpLeft(context, '/testProviderRefreshPage')},
                    child: Text('provider+refresh集成'),
                  ),*/
                          MaterialButton(
                            onPressed: () =>
                            {NavigatorUtils.jumpLeft(context, '/refreshPage')},
                            child: Text('provider+封装refresh集成'),
                          ),
                        ],
                      ),
                    ),
                  ))),
          Container(
              child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.greenAccent,
                      height: 48,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          MaterialButton(
                            onPressed: () =>
                            {NavigatorUtils.jump(context, '/indexPage')},
                            child: Text('routerRight'),
                          ),
                          MaterialButton(
                            onPressed: () =>
                            {NavigatorUtils.jumpLeft(context, '/normalPage')},
                            child: Text('routerLeft'),
                          ),
                          /*MaterialButton(
                    onPressed: () =>
                    {NavigatorUtil.jumpLeft(context, '/testProviderRefreshPage')},
                    child: Text('provider+refresh集成'),
                  ),*/
                          MaterialButton(
                            onPressed: () =>
                            {NavigatorUtils.jumpLeft(context, '/refreshPage')},
                            child: Text('provider+封装refresh集成'),
                          ),
                        ],
                      ),
                    ),
                  ))),
          Container(
              color: Colors.deepOrangeAccent,
              height: 40,
              child: Center(
                child: Text('$src', style: style),
              )),
        ],
      ),
      floatingActionButton: InkWell(
        borderRadius: BorderRadius.circular(45),
        onTap: _testRequest,
        child: Container(
          height: 80,
          width: 80,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(45),
          ),
          child: Text(
            "点击请求",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}
