import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:new_idea/net/base_repository.dart';
import 'package:new_idea/provider/provider_widget.dart';
import 'package:new_idea/routers/application.dart';
import 'package:new_idea/routers/navigator_util.dart';
import 'package:new_idea/routers/routes.dart';
import 'package:new_idea/config/net_init.dart';
import 'package:new_idea/view_model/test_model.dart';
import 'package:provider/provider.dart';

import 'config/provider_manager.dart';

void main() {
  // 禁用提示
  Provider.debugCheckInvalidValueType = null;

  // widget和flutter初始化
  WidgetsFlutterBinding.ensureInitialized();
  NetInit();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;

    return MultiProvider(
        providers: providers,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(title: 'Flutter Demo Home Page'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

var style = TextStyle(color: Colors.white);

class _MyHomePageState extends State<MyHomePage> {
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
      body: Column(
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
                        {NavigatorUtil.jump(context, '/indexPage')},
                    child: Text('routerRight'),
                  ),
                  MaterialButton(
                    onPressed: () =>
                        {NavigatorUtil.jumpLeft(context, '/normalPage')},
                    child: Text('routerLeft'),
                  ),
                  MaterialButton(
                    onPressed: () =>
                    {NavigatorUtil.jumpLeft(context, '/refreshPage')},
                    child: Text('providerrefresh'),
                  ),
                ],
              ),
            ),
          ))),
          Container(
              color: Colors.deepOrangeAccent,
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
