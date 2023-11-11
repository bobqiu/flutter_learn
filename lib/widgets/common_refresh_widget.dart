import 'package:flutter/material.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:date_format/date_format.dart';

typedef OnRefreshCallback = Future<void> Function();
typedef OnLoadMoreCallback = Future<void> Function();

class CommonRefreshWidget extends StatefulWidget {
  CommonRefreshWidget({
    required this.listView,
    this.easyRefreshController,
    this.onRefresh,
    this.onLoad,
  });

  Widget listView;
  int count = 0;
  late OnRefreshCallback? onRefresh;
  late OnLoadMoreCallback? onLoad;
  EasyRefreshController? easyRefreshController;

  @override
  _CustomCommonRefreshWidgetState createState() =>
      _CustomCommonRefreshWidgetState();
}

class _CustomCommonRefreshWidgetState extends State<CommonRefreshWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
        controller: widget.easyRefreshController,
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
        onRefresh: widget.onRefresh,
        onLoad: widget.onLoad,
        child: widget.listView);
  }

  @override
  void dispose() {
    super.dispose();
  }
}

String getCurrentTime() {
  var now = DateTime.now();
  return formatDate(now, [hh, ':', nn]);
}
