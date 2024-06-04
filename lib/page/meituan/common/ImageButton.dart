import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  const ImageButton(
      {required this.image, required this.title, this.tip = null});

  final Widget image;
  final String title;
  final dynamic tip;

  @override
  Widget build(context) {
    return InkWell(
      onTap: () => {print("context:$context")},
      splashColor: Colors.grey,
      child: Stack(
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: 12,
                ),
                image,
                SizedBox(
                  height: 5,
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: tip != null
                ? Tag(
                    tag: tip,
                    isEmphasize: true,
                    radius: 15.0,
                  )
                : null,
          ),
        ],
      ),
    );
  }
}

class Tag extends StatelessWidget {
  Tag({required this.tag, this.isEmphasize = false, this.radius = 3.0});

  final String tag;
  final bool isEmphasize;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: isEmphasize ? Colors.red : Colors.black, width: 0.5),
        color: isEmphasize ? Colors.red : Colors.white,
        borderRadius: BorderRadius.circular((radius)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 3.0, right: 3.0, bottom: 1.0),
        child: Text(
          tag,
          style: TextStyle(
              fontSize: 10.0, color: isEmphasize ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}

class PriceText extends StatelessWidget {
  PriceText(this._price);

  final String _price;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: <TextSpan>[
        TextSpan(
            text: "￥", style: TextStyle(fontSize: 10.0, color: Colors.red)),
        TextSpan(
            text: _price,
            style: TextStyle(
                fontSize: 15.0,
                color: Colors.red,
                fontWeight: FontWeight.bold)),
        TextSpan(
            text: " 起", style: TextStyle(fontSize: 10.0, color: Colors.black))
      ]),
    );
  }
}