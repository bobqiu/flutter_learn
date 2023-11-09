import 'package:flutter/material.dart';
import 'package:easy_refresh/easy_refresh.dart';

class NormalPage extends StatefulWidget {
  @override
  State<NormalPage> createState() => _NormalPageState();
}

class _NormalPageState extends State<NormalPage> {
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
        title: Text("EasyRefresh"),
      ),
      body: EasyRefresh(
        controller: _controller,
        header: ClassicHeader(dragText: 'Pull to refresh',
          armedText: 'Release ready,准备',
          readyText: 'Refreshing...ready。。。。准备',
          processingText: 'Refreshing...process，进行中',
          processedText: 'Succeeded,hell，成功',
          noMoreText: 'No more',
          failedText: 'Failed',
          messageText: 'Last updated at %T',
          safeArea: false,),
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
          _controller.finishLoad(
              _count >= 20 ? IndicatorResult.noMore : IndicatorResult.success);
        },
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: Container(
                alignment: Alignment.center,
                height: 80,
                child: Text('${index + 1}'),
              ),
            );
          },
          itemCount: _count,
        ),
      ),
    );
  }
}
