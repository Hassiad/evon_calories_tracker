import 'package:flutter/material.dart';

Color primaryColorLT = Color(0xff423869);
Color accentColor = Color(0xffF9BA60);
Color hintColorW = Color(0xffAAAAAA);
Color hintColorC = Color(0xff707070);
Color errorColor = Color(0xffF93939);

Color successfulColor = Color(0xff2DCA36);
Color initiatedColor = Color(0xffffc107);
Color textAreaColor = Color(0xffF7F7F7);

Color topSubtitleColor = Color(0xffAAAAAA);
const double buttonHeight = 52.0;
const double buttonRadius = 30.0;

const int hex = 0xff423869;
// const Color primaryColorLT = Color(hex);

const Color textColor = Color(0xff383838);

const primarySwatch = MaterialColor(hex, {
  50: Color(hex),
  100: Color(hex),
  200: Color(hex),
  300: Color(hex),
  400: Color(hex),
  500: Color(hex),
  600: Color(hex),
  700: Color(hex),
  800: Color(hex),
  900: Color(hex),
});

final elevatedButtonThemeData = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    primary: accentColor,
    textStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18.0,
    ),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(buttonRadius),
      ),
    ),
  ),
);
final headline5 = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 26.0,
  fontFamily: 'Rubik',
);
final headline6 = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 20.0,
  fontFamily: 'Rubik',
);
final subHeadline5 = TextStyle(
  color: Color(0xffAAAAAA),
  fontFamily: 'Rubik',
  fontWeight: FontWeight.normal,
  fontSize: 14.0,
);
final bodyText1 = TextStyle(
  color: textColor,
  fontWeight: FontWeight.normal,
  fontSize: 16.0,
  fontFamily: 'CarosSoft',
);
final bodyText2 = TextStyle(
  color: textColor,
  fontFamily: 'CarosSoft',
  fontWeight: FontWeight.normal,
  fontSize: 14.0,
);
final inputDecoration = InputDecoration(
  hintStyle: bodyText2.copyWith(color: hintColorW),
  border: InputBorder.none,
);

final inputDecorationSM = InputDecoration(
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: primaryColorLT, width: 1.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: hintColorW, width: 1.0),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 1.0),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 1.0),
  ),
  disabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: hintColorW.withOpacity(0.5), width: 1.0),
  ),
  errorStyle: TextStyle(
    color: Colors.red, // or any other color
  ),
);

const loremIpsum =
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. '
    '\n\nIt has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.\n\nIt was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'
    'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.';
