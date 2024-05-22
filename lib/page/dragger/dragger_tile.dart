import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:new_idea/res/app_color.dart';
import 'package:new_idea/widgets/skeleton_item.dart';

class DraggerTile extends StatefulWidget {
  const DraggerTile({super.key});

  @override
  State<DraggerTile> createState() => _DraggerTileState();
}

class _DraggerTileState extends State<DraggerTile>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _tabIndex = 0;
  int _listCount = 20;
  int _gridCount = 20;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final themeData = Theme.of(context);
    return Scaffold(
      body: EasyRefresh.builder(
        header: ClassicHeader(
          clamping: true,
          position: IndicatorPosition.locator,
          mainAxisAlignment: MainAxisAlignment.end,
          dragText: 'Pull to refresh',
          armedText: 'Release ready',
          readyText: 'Refreshing...',
          processingText: 'Refreshing...',
          processedText: 'Succeeded',
          noMoreText: 'No more',
          failedText: 'Failed',
          messageText: 'Last updated at %T',
        ),
        footer: ClassicFooter(
          position: IndicatorPosition.locator,
          dragText: 'Pull to load',
          armedText: 'Release ready',
          readyText: 'Loading...',
          processingText: 'Loading...',
          processedText: 'Succeeded',
          noMoreText: 'No more',
          failedText: 'Failed',
          messageText: 'Last updated at %T',
        ),
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 2), () {
            if (mounted) {
              setState(() {
                if (_tabController.index == 0) {
                  _listCount = 20;
                } else {
                  _gridCount = 20;
                }
              });
            }
          });
        },
        onLoad: () async {
          await Future.delayed(const Duration(seconds: 2), () {
            if (mounted) {
              setState(() {
                if (_tabController.index == 0) {
                  _listCount += 10;
                } else {
                  _gridCount += 10;
                }
              });
            }
          });
        },
        childBuilder: (context, physics) {
          return ScrollConfiguration(
            behavior: const ERScrollBehavior(),
            child: ExtendedNestedScrollView(
              physics: physics,
              onlyOneScrollInBody: true,
              pinnedHeaderSliverHeightBuilder: () {
                return MediaQuery.of(context).padding.top + kToolbarHeight;
              },
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return <Widget>[
                  const HeaderLocator.sliver(clearExtent: false),
                  SliverAppBar(
                    leading: new IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: AppColor.primary,
                      onPressed: () {},
                    ),
                    expandedHeight: 120,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text(
                        'TabBarView',
                        style: TextStyle(color: AppColor.red),
                      ),
                      centerTitle: false,
                    ),
                  ),
                ];
              },
              body: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(" hello world "),
                      Text(" I am Jack "),
                    ],
                  ),
                  TabBar(
                    controller: _tabController,
                    labelColor: AppColor.black_33,
                    indicatorColor: AppColor.icon_yellow,
                    tabs: const <Widget>[
                      Tab(
                        text: '列表',
                      ),
                      Tab(
                        text: '网格',
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: <Widget>[
                        ExtendedVisibilityDetector(
                          uniqueKey: const Key('Tab0'),
                          child: _AutomaticKeepAlive(
                            child: CustomScrollView(
                              physics: physics,
                              slivers: [
                                SliverList(
                                    delegate: SliverChildBuilderDelegate(
                                        (context, index) {
                                  return const SkeletonItem();
                                }, childCount: _listCount)),
                                const FooterLocator.sliver(),
                              ],
                            ),
                          ),
                        ),
                        ExtendedVisibilityDetector(
                          uniqueKey: const Key('Tab1'),
                          child: _AutomaticKeepAlive(
                            child: CustomScrollView(
                              physics: physics,
                              slivers: [
                                SliverGrid(
                                    delegate: SliverChildBuilderDelegate(
                                        (context, index) {
                                      return const SkeletonItem(
                                        direction: Axis.horizontal,
                                      );
                                    }, childCount: _gridCount),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 6 / 7,
                                    )),
                                const FooterLocator.sliver(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _AutomaticKeepAlive extends StatefulWidget {
  final Widget child;

  const _AutomaticKeepAlive({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<_AutomaticKeepAlive> createState() => _AutomaticKeepAliveState();
}

class _AutomaticKeepAliveState extends State<_AutomaticKeepAlive>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
