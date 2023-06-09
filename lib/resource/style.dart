import 'package:flutter/material.dart';

const hugeFontSize = 48.0;
const largeTextSize = 28.0;
const mediumTextSize = 20.0;
const bodyTextSize = 18.0;
const miniTextSize = 16.0;

const minimumTextSize = 12.0;

const String fontName = 'Montserrat';

const appBarTextStyle = TextStyle(
  fontFamily: fontName,
  fontWeight: FontWeight.w600,
  fontSize: mediumTextSize,
  color: Colors.white,
);

const navBarTextStyle = TextStyle(
  fontFamily: fontName,
  fontWeight: FontWeight.w600,
  fontSize: minimumTextSize,
  color: Colors.black,
);

const titleTextStyle = TextStyle(
  fontFamily: fontName,
  fontWeight: FontWeight.w600,
  fontSize: largeTextSize,
  color: Colors.black,
);

const titleShadowTextStyle =
    TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold,
        /*color:Color(0xffFFFFDF)*/
        shadows: [
      Shadow(
        blurRadius: 5.0, // shadow blur
        color: Colors.white, // shadow color
        offset: Offset(0.0, 0.0), // how much shadow will be shown
      )
    ]);
const largeTitleShadowTextStyle =
    TextStyle(color: Colors.white, fontSize: 35.0, fontWeight: FontWeight.bold,
        /*color:Color(0xffFFFFDF)*/
        shadows: [
      Shadow(
        blurRadius: 5.0, // shadow blur
        color: Colors.white, // shadow color
        offset: Offset(0.0, 0.0), // how much shadow will be shown
      )
    ]);

const subTitleShadowTextStyle =
    TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w600,
        /*color:Color(0xffFFFFDF)*/
        shadows: [
      Shadow(
        blurRadius: 3.0, // shadow blur
        color: Colors.white, // shadow color
        offset: Offset(0.0, 0.0), // how much shadow will be shown
      )
    ]);
const smallSubTitleShadowTextStyle =
    TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.w600,
        /*color:Color(0xffFFFFDF)*/
        shadows: [
      Shadow(
        blurRadius: 2.0, // shadow blur
        color: Colors.white, // shadow color
        offset: Offset(0.0, 0.0), // how much shadow will be shown
      )
    ]);

const bodyTextStyle = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: bodyTextSize,
    color: Colors.black,
    height: 1.6);

const buttonTextStyle = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w500,
    fontSize: miniTextSize,
    color: Colors.black,
    height: 1.6);

var mainColorScheme = ColorScheme.fromSwatch(
  primarySwatch: Colors.amber,
  accentColor: Colors.amber,
);

var myElevatedButtonStyle = ButtonStyle(
    padding: MaterialStateProperty.all<EdgeInsets>(
      const EdgeInsets.fromLTRB(28.0, 15.0, 28.0, 15.0),
    ),
    textStyle: MaterialStateProperty.all(buttonTextStyle));

var myIconTheme = const IconThemeData(
  color: Colors.black,
);

var myTabBarTheme = TabBarTheme(
  labelColor: Colors.white,
  labelStyle: navBarTextStyle,
  unselectedLabelColor: navBarTextStyle.color,
  indicator: BoxDecoration(
    borderRadius: BorderRadius.circular(6),
    color: Colors.amber,
  ),
);

var iconTheme = const IconThemeData(
  color: Colors.black,
);

const formButtonTextStyle = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w500,
    fontSize: miniTextSize,
    color: Colors.amber,
    backgroundColor: Colors.white,
    height: 1.6);

var formButton = ButtonStyle(
    padding: MaterialStateProperty.all<EdgeInsets>(
      const EdgeInsets.fromLTRB(28.0, 15.0, 28.0, 15.0),
    ),
    textStyle: MaterialStateProperty.all(formButtonTextStyle),
    backgroundColor:
        MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
      return Colors.white;
    }));

var prepaidTextStyle = const TextStyle(
  color: Colors.white,
  fontFamily: fontName,
  fontWeight: FontWeight.w500,
  fontSize: 22,
);
