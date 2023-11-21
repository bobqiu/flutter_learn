import 'package:flutter/material.dart';
import 'package:new_idea/res/app_color.dart';
import 'package:new_idea/routers/navigator_utils.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animLeft;
  late Animation<double> _animRight;
  late Gradient _textGradient;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    Future.delayed(Duration(milliseconds: 300)).then((value) {
      _animationController.forward();
      Future.delayed(Duration(milliseconds: 2000)).then((value) {
        NavigatorUtils.goIndexPage(context);
      });
    });
    _textGradient = LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [Colors.lightBlue, Colors.blue]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: Container(
        color: AppColor.white,
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (_animLeft != null)
              AnimatedBuilder(
                animation: _animLeft,
                builder: (BuildContext context, Widget? child) {
                  return Transform.translate(
                    offset: Offset(_animLeft.value, 0),
                    child: Text(
                      '欢迎进入',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  );
                },
              ),
            SizedBox(
              width: 5,
            ),
            if (_animRight != null) _buildLogoTxt(),
          ],
        ),
      ),
    );
  }

  _buildLogoTxt() {
    return AnimatedBuilder(
        animation: _animRight,
        builder: (BuildContext context, Widget? child) {
          return Transform.translate(
            offset: Offset(_animRight.value, 0),
            child: Text.rich(
              TextSpan(
                text: "新思考",
                style: TextStyle(
                  foreground: Paint()
                    ..shader =
                    _textGradient.createShader(Rect.fromLTRB(0, 0, 40, 40)),
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
                children: [
                  TextSpan(
                    text: "新思维",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      foreground: Paint()..color = Colors.pink[400]!,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final offset = getTextWidth("新思考新思维") - getTextWidth("flutter");
    final screenWidth = MediaQuery.of(context).size.width;
    _animLeft = Tween(begin: -screenWidth / 2 - offset / 2, end: 0.toDouble())
        .animate(CurvedAnimation(
        parent: _animationController, curve: Curves.easeIn));
    _animRight = Tween(begin: screenWidth / 2 - offset / 2, end: 0.toDouble())
        .animate(CurvedAnimation(
        parent: _animationController, curve: Curves.easeIn));
  }

  double getTextWidth(String text) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w600,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.width;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
