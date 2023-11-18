import 'dart:math';

import 'package:flutter/material.dart';
import 'package:new_idea/widgets/common_list_view_widget.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  Future<List<String>?> loadData(int pageNum, int pageSize) async {
    await Future.delayed(const Duration(seconds: 2));
    return Random().nextBool()
        ? ['000']
        : ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LoadListView')),
      body: LoadListView<String>(
        pageSize: 10,
        refreshOnStart: true,
        emptyWidget: const Center(
          child: Padding(
            padding: EdgeInsets.only(top: 100),
            child: Text('此处空空如也'),
          ),
        ),
        onRefreshData: (pageNum, pageSize) async {
          return loadData(pageNum, pageSize);
        },
        onLoadData: (pageNum, pageSize) async {
          return loadData(pageNum, pageSize);
        },
        itemBuilder: (context, count, index, data) {
          return Container(
            alignment: Alignment.center,
            color: Colors.blue.withOpacity(Random().nextInt(10) / 10.0),
            height: 100,
            child: Text(data),
          );
        },
      ),
    );
  }
}