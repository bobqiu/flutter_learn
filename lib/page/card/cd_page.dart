import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

List<String> images = [
  'https://gank.io/images/5ba77f3415b44f6c843af5e149443f94',
  'https://gank.io/images/02eb8ca3297f4931ab64b7ebd7b5b89c',
  'https://gank.io/images/31f92f7845f34f05bc10779a468c3c13',
  'https://gank.io/images/b0f73f9527694f44b523ff059d8a8841',
  'https://gank.io/images/1af9d69bc60242d7aa2e53125a4586ad',
];

// 生成的卡片
List<Widget> cards = List.generate(
  images.length,
      (int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 17),
            blurRadius: 23.0,
            spreadRadius: -13.0,
            color: Colors.black54,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Image.network(
          images[index],
          fit: BoxFit.cover,
        ),
      ),
    );
  },
);

void main() {
  runApp(CdPage(cards: cards));
}

class CdPage extends StatefulWidget {
  final List<Widget> cards;

  const CdPage({required this.cards});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<CdPage> with TickerProviderStateMixin {
  // 卡片列表
  final List<Widget> _cards = [];
  // 最前面卡片的索引
  int _frontCardIndex = 0;
  // 保存最前面卡片的定位
  Alignment _frontCardAlignment = Alignment(0.0, -0.5);
  // 保存最前面卡片的旋转角度
  double _frontCardRotation = 0.0;
  // 卡片回弹动画
  late Animation<Alignment> _reboundAnimation;
  // 卡片回弹动画控制器
  late AnimationController _reboundController;
  // 卡片位置变换动画控制器
  late AnimationController _cardChangeController;

  //  前面的卡片，使用 Align 定位
  Widget _frontCard(BoxConstraints constraints) {
    // 判断是否还有卡片
    Widget card =
    _frontCardIndex < _cards.length ? _cards[_frontCardIndex] : Container();
    bool forward = _cardChangeController.status == AnimationStatus.forward;

    // 使用 Transform.rotate 旋转卡片
    Widget rotate = Transform.rotate(
      angle: (pi / 180.0) * _frontCardRotation,
      // 使用 SizedBox 确定卡片尺寸
      child: SizedBox.fromSize(
        size: CardSizes.front(constraints),
        child: card,
      ),
    );

    if (forward) {
      return Align(
        alignment: CardAnimations.frontCardDisappearAnimation(
          _cardChangeController,
          _frontCardAlignment,
        ).value,
        child: rotate,
      );
    }

    return Align(
      alignment: _frontCardAlignment,
      child: rotate,
    );
  }

  // 中间的卡片，使用 Align 定位
  Widget _middleCard(BoxConstraints constraints) {
    // 判断是否还有两张卡片
    Widget card = _frontCardIndex < _cards.length - 1
        ? _cards[_frontCardIndex + 1]
        : Container();
    bool forward = _cardChangeController.status == AnimationStatus.forward;

    if (forward) {
      return Align(
        alignment: CardAnimations.middleCardAlignmentAnimation(
          _cardChangeController,
        ).value,
        child: SizedBox.fromSize(
          size: CardAnimations.middleCardSizeAnimation(
            _cardChangeController,
            constraints,
          ).value,
          child: card,
        ),
      );
    }

    return Align(
      alignment: CardAlignments.middle,
      child: SizedBox.fromSize(
        size: CardSizes.middle(constraints),
        child: card,
      ),
    );
  }

  // 后面的卡片，使用 Align 定位
  Widget _backCard(BoxConstraints constraints) {
    // 判断数组中是否还有三张卡片
    Widget card = _frontCardIndex < _cards.length - 2
        ? _cards[_frontCardIndex + 2]
        : Container();
    bool forward = _cardChangeController.status == AnimationStatus.forward;

    if (forward) {
      return Align(
        alignment: CardAnimations.backCardAlignmentAnimation(
          _cardChangeController,
        ).value,
        child: SizedBox.fromSize(
          size: CardAnimations.backCardSizeAnimation(
            _cardChangeController,
            constraints,
          ).value,
          child: card,
        ),
      );
    }

    return Align(
      alignment: CardAlignments.back,
      child: SizedBox.fromSize(
        size: CardSizes.back(constraints),
        child: card,
      ),
    );
  }

  // 改变位置的动画
  void _runChangeOrderAnimation() {
    _cardChangeController.reset();
    _cardChangeController.forward();
  }

  // 卡片回弹的动画
  void _runReboundAnimation(Offset pixelsPerSecond, Size size) {
    // 创建动画值
    _reboundAnimation = _reboundController.drive(
      AlignmentTween(
        begin: _frontCardAlignment,
        end: Alignment(0.0, -0.5),
      ),
    );
    // 计算动画运动速度
    final double unitsPerSecondX = pixelsPerSecond.dx / size.width;
    final double unitsPerSecondY = pixelsPerSecond.dy / size.height;
    final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
    final unitVelocity = unitsPerSecond.distance;
    // 创建弹簧模拟的定义
    const spring = SpringDescription(mass: 30, stiffness: 1, damping: 1);
    // 创建弹簧模拟
    final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);
    // 根据给定的模拟运行动画
    _reboundController.animateWith(simulation);
    // 重置旋转值
    _frontCardRotation = 0.0;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    // 初始化卡片数组
    _cards.addAll(widget.cards);
    // 初始化回弹的动画控制器
    _reboundController = AnimationController(vsync: this)
      ..addListener(() {
        setState(() {
          _frontCardAlignment = _reboundAnimation.value;
        });
      });

    // 初始化卡片换位动画控制器
    _cardChangeController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    )
      ..addListener(() => setState(() {}))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          // 将最前面卡片的索引向前移动一位
          _frontCardIndex++;
          // 动画运行结束后重置位置和旋转
          _frontCardRotation = 0.0;
          _frontCardAlignment = CardAlignments.front;
          setState(() {});
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TCards demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: 360,
            height: 520,
            child: LayoutBuilder(
              builder: (context, constraints) {
                // 使用 LayoutBuilder 获取容器的尺寸，传个子项计算卡片尺寸
                final Size size = MediaQuery.of(context).size;
                // 移动的速度
                final double speed = 10.0;
                // 卡片横轴距离限制
                final double limit = 10.0;

                return Stack(
                  children: [
                    // 后面的子项会显示在上面，所以前面的卡片放在最后
                    _backCard(constraints),
                    _middleCard(constraints),
                    _frontCard(constraints),
                    // 使用一个占满父元素的 GestureDetector 监听手指移动
                    // 如果动画在运行中就不在响应手势
                    _cardChangeController.status != AnimationStatus.forward
                        ? SizedBox.expand(
                      child: GestureDetector(
                        onPanDown: (DragDownDetails details) {},
                        onPanUpdate: (DragUpdateDetails details) {
                          // 手指移动就更新最前面卡片的 alignment 属性
                          _frontCardAlignment += Alignment(
                            details.delta.dx / (size.width / 2) * speed,
                            details.delta.dy / (size.height / 2) * speed,
                          );
                          // 设置最前面卡片的旋转角度
                          _frontCardRotation = _frontCardAlignment.x;
                          setState(() {});
                        },
                        onPanEnd: (DragEndDetails details) {
                          // 如果最前面的卡片横轴移动距离超过限制就运行换位动画，否则运行回弹动画
                          if (_frontCardAlignment.x > limit ||
                              _frontCardAlignment.x < -limit) {
                            _runChangeOrderAnimation();
                          } else {
                            _runReboundAnimation(
                              details.velocity.pixelsPerSecond,
                              size,
                            );
                          }
                        },
                      ),
                    )
                        : IgnorePointer(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

/// 卡片尺寸
class CardSizes {
  static Size front(BoxConstraints constraints) {
    return Size(constraints.maxWidth * 0.9, constraints.maxHeight * 0.9);
  }

  static Size middle(BoxConstraints constraints) {
    return Size(constraints.maxWidth * 0.85, constraints.maxHeight * 0.9);
  }

  static Size back(BoxConstraints constraints) {
    return Size(constraints.maxWidth * 0.8, constraints.maxHeight * .9);
  }
}

/// 卡片位置
class CardAlignments {
  static Alignment front = Alignment(0.0, -0.5);
  static Alignment middle = Alignment(0.0, 0.0);
  static Alignment back = Alignment(0.0, 0.5);
}

/// 卡片运动动画
class CardAnimations {
  /// 最前面卡片的消失动画
  static Animation<Alignment> frontCardDisappearAnimation(
      AnimationController parent,
      Alignment beginAlignment,
      ) {
    return AlignmentTween(
      begin: beginAlignment,
      end: Alignment(
        beginAlignment.x > 0
            ? beginAlignment.x + 30.0
            : beginAlignment.x - 30.0,
        0.0,
      ),
    ).animate(
      CurvedAnimation(
        parent: parent,
        curve: Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );
  }

  /// 中间卡片位置变换动画
  static Animation<Alignment> middleCardAlignmentAnimation(
      AnimationController parent,
      ) {
    return AlignmentTween(
      begin: CardAlignments.middle,
      end: CardAlignments.front,
    ).animate(
      CurvedAnimation(
        parent: parent,
        curve: Interval(0.2, 0.5, curve: Curves.easeIn),
      ),
    );
  }

  /// 中间卡片尺寸变换动画
  static Animation<Size?> middleCardSizeAnimation(
      AnimationController parent,
      BoxConstraints constraints,
      ) {
    return SizeTween(
      begin: CardSizes.middle(constraints),
      end: CardSizes.front(constraints),
    ).animate(
      CurvedAnimation(
        parent: parent,
        curve: Interval(0.2, 0.5, curve: Curves.easeIn),
      ),
    );
  }

  /// 最后面卡片位置变换动画
  static Animation<Alignment> backCardAlignmentAnimation(
      AnimationController parent,
      ) {
    return AlignmentTween(
      begin: CardAlignments.back,
      end: CardAlignments.middle,
    ).animate(
      CurvedAnimation(
        parent: parent,
        curve: Interval(0.4, 0.7, curve: Curves.easeIn),
      ),
    );
  }

  /// 最后面卡片尺寸变换动画
  static Animation<Size?> backCardSizeAnimation(
      AnimationController parent,
      BoxConstraints constraints,
      ) {
    return SizeTween(
      begin: CardSizes.back(constraints),
      end: CardSizes.middle(constraints),
    ).animate(
      CurvedAnimation(
        parent: parent,
        curve: Interval(0.4, 0.7, curve: Curves.easeIn),
      ),
    );
  }
}