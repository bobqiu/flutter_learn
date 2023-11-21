import 'package:flutter/material.dart';
import 'package:new_idea/res/app_color.dart';

enum LogoPosition {
  Left,
  Center,
}


class CommonCustomerBar  extends StatelessWidget implements PreferredSizeWidget{
  final double? contentHeight;
  final Color? backgroundColor;
  final Color? txtColor;
  final Color? iconColor;
  final LogoPosition logoPosition;
  final VoidCallback? onPressedBack;
  final Widget? contentChild;

  const CommonCustomerBar({
    Key? key,
    this.contentHeight,
    this.backgroundColor,
    this.logoPosition = LogoPosition.Left,
    this.onPressedBack,
    this.contentChild,
    this.txtColor,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: backgroundColor,
        child: contentChild ??
            AppBarContent(
              contentHeight: contentHeight,
              logoPosition: logoPosition,
              backgroundColor: Colors.black12,
              onPressedBack: onPressedBack,
              iconColor: iconColor,
              txtColor: txtColor,
            ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(contentHeight! + 40);
}

class AppBarContent extends StatelessWidget {
  final double? contentHeight;
  final Color? backgroundColor;
  final Color? txtColor;
  final Color? iconColor;
  final LogoPosition? logoPosition;
  final VoidCallback? onPressedBack;

  const AppBarContent({
    Key? key,
    this.contentHeight,
    this.backgroundColor,
    this.txtColor,
    this.iconColor,
    this.logoPosition = LogoPosition.Left,
    this.onPressedBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: contentHeight,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: <Widget>[
              if (logoPosition == LogoPosition.Center)
                Positioned(
                  child: GestureDetector(
                    onTap: onPressedBack,
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.arrow_back,
                          color: iconColor,
                        )),
                  ),
                ),
              _buildLogoTxt("日日梦日日梦"),
              Positioned(
                right: 15,
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        // jumpVideoHistory(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Icon(
                          Icons.history,
                          color: iconColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        //  jumpRank(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Icon(
                          IconData(0xe600, fontFamily: "appIconFonts"),
                          color: iconColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        _buildSearch(context),
      ],
    );
  }

  _buildLogoTxt(String logoTxt) {
    Gradient textGradient = LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [Colors.lightBlue, Colors.blue]);
    Shader textShader = textGradient.createShader(Rect.fromLTRB(0, 0, 40, 40));

    Alignment logoAlignment = logoPosition == LogoPosition.Left
        ? Alignment.centerLeft
        : Alignment.center;

    return Align(
      alignment: logoAlignment,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (logoPosition == LogoPosition.Left)
            SizedBox(
              width: 10,
            ),
          Text(
            logoTxt.substring(0, 3),
            style: TextStyle(
              foreground: Paint()..shader = textShader,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            logoTxt.substring(3, 6),
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.pink[400],
            ),
          ),
        ],
      ),
    );
  }

  _buildSearch(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // jumpTxtSearch(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.only(bottom: 10),
        child: Container(
          height: 30,
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: AppColor.search_bg_grey,
          ),
          child: Row(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 10, right: 2),
                  child: Icon(
                    Icons.search,
                    size: 16,
                    color: iconColor,
                  )),
              Text(
                "梦想搜索",
                style: TextStyle(
                  color: txtColor,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}