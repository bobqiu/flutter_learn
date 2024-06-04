import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TaluoCardPage extends StatefulWidget {
  const TaluoCardPage({super.key});

  @override
  State<TaluoCardPage> createState() => _TaluoCardPageState();
}

class _TaluoCardPageState extends State<TaluoCardPage> {
  List<String> tarotCards = List.generate(22, (index) => 'tarot_card_$index'); // 假设的卡片资源文件名列表


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SizedBox(
            width: 300,
            height: 600,
            child: CustomPaint(
              painter: FanPainter(
                cards: tarotCards,
                centerX: 150,
                centerY: 300,
                radius: 200,
                spacingDegrees: 4,
              ),
            ),
          ),
      ),
    );
  }
}
class FanPainter extends CustomPainter {
  final List<String> cards;
  final double centerX;
  final double centerY;
  final double radius;
  final double spacingDegrees;
  late List<ui.Image> _images=[];

  FanPainter({
    required this.cards,
    required this.centerX,
    required this.centerY,
    required this.radius,
    required this.spacingDegrees,
  }):super(){
    _loadImages();
  }

  @override
  void paint(Canvas canvas, Size size) {
   // if (_images.isEmpty) return;
    final totalDegrees = (cards.length - 1) * spacingDegrees;
    final startAngle = -totalDegrees / 2;

    for (var i = 0; i < cards.length; i++) {
      final angle = startAngle + i * spacingDegrees;
      final radians = angle * pi / 100;
      final x = centerX + radius * cos(radians);
      final y = centerY + radius * sin(radians);
      // 使用drawImage绘制图片到指定位置
     // canvas.drawImage(_images[i], Offset(x - 50, y - 90), Paint());
      // 这里简单地绘制圆形代替实际的塔罗牌图片，实际应用中应该使用Image.asset等加载图片
      final cardRect = Rect.fromLTWH(x - 50, y - 90, 100, 180); // 假定卡片尺寸为100x180
      canvas.drawRect(cardRect, Paint()..color = Colors.blue);
    }
  }

  @override
  bool shouldRepaint(covariant FanPainter oldDelegate) => true;

  Future<void> _loadImages() async {
    _images = await Future.wait(cards.map((card) => _getImageFromAsset(card)));
  }

  Future<ui.Image> _getImageFromAsset(String assetPath) async {
    ByteData data = await rootBundle.load('assets/tarot_card.png');
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List()) as ui.Codec;
    ui.FrameInfo frame = await codec.getNextFrame();
    return frame.image;
  }
}

