import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

class TarotCardFan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('选牌区')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CardList(),
        ),
      ),
    );
  }
}

class CardList extends StatelessWidget {
  final List<String> cardImages = List.generate(
    2,
        (index) => "assets/cards/cover-v=1.0.png",
  );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: cardImages.length,
      itemBuilder: (context, index) {
        double rotationAngle = -52.5 + 5 * index;
        return Transform.rotate(
          angle: rotationAngle.toDouble(),
          child: Card(
            elevation: 5,
            shadowColor: Colors.grey,
            child: Image.asset(
              cardImages[index],
              fit: BoxFit.cover,
              width: 100,
              height: 100,
            ),
          ),
        );
      },
    );
  }
}
