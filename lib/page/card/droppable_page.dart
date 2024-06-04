import 'package:flutter/material.dart';

import 'demo_widget.dart';
import 'droppable_widget.dart';

class DroppablePage extends StatefulWidget {
  @override
  _DroppablePageState createState() => _DroppablePageState();
}

class _DroppablePageState extends State<DroppablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Droppable Cards'),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(16.0, 16.0, 48.0, 48.0),
        child: DroppableWidget(
          key: null,
          children: <Widget>[
            DemoWidget(assets: 'assets/cards/card_1.jpg', key: null,),
            DemoWidget(assets: 'assets/cards/card_2.jpg', key: null,),
            DemoWidget(assets: 'assets/cards/card_3.jpg', key: null,),
          ],
        ),
      ),
    );
  }
}