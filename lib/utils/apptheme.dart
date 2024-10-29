import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static final light = ThemeData.light().copyWith(
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: Colors.white,
            minimumSize: const Size(88, 36),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(2.0)),
            ),
          )),

      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
          )),

      appBarTheme: const AppBarTheme(
          backgroundColor: primaryColor,
          iconTheme: IconThemeData(color: Colors.white),
          actionsIconTheme: IconThemeData(color: Colors.white),
          systemOverlayStyle:
          SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          centerTitle: true,
          elevation: 0,
          titleTextStyle: TextStyle(color: Colors.white)
      ), colorScheme: lightColorScheme.copyWith(background: Colors.white));

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: primaryColor,
    secondary: Color(0xFF03DAC5),
    background: Color(0xFFE6EBEB),
    surface: Color(0xFFFAFBFB),
    onBackground: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  static const Color primaryColor = Color(0xFF8684d1);
  static const Color swipeBackground = Color(0xffd6d4ff);
  static const Color navyBlue = Color(0xff1e2c5b);
  static const Color subheadingTextColor = Color(0xff77838f);
  static const Color whiteBackground = Color(0xfff8f7f7);
  static const Color secondaryTextColor = Color(0xff757575);
  static const Color borderColor = Color(0xffe8e8e8);
  static const Color lightGray = Color(0xffceced2);
  static const Color lightPurple = Color(0xff9b89d0);
  static const Color darkPurple = Color(0xff8083d2);
  static const Color coral = Color(0xfffe604d);
  static const Color paleGray = Color(0xffe3e4ea);
  static const Color starYellowColor = Color(0xffe8c433);
  static const Color blackColor = Color(0xFF000000);
  static const Color melonColor = Color(0xD2F5445E);
  static const Color coralFlowerColor = Color(0xff5d77dd);
  static const Color coralFlowColor = Color(0xff8977e8);
  static const Color darkPeriBlue = Color(0xff6168dc);
  static const Color textGrey = Color(0xff505050);
  static const Color hiddenTextColor = Color(0xff959595);

  static const Color teriteryTextColor = Color(0xff909090);
  static const Color meetingGreen = Color(0xff61b50e);
  static const Color meetingBlue = Color(0xff9587d0);
  static const Color meetingOrange = Color(0xffffb34d);
  static const Color meetingLit = Color(0xffa2a2a2);
  static const Color meetingRed = Color(0xfffe604d);
  
  static const Color warmGrey = Color(0xff8f8f8f);
  static const Color darkBrown = Color(0xff2e2321);
  static const Color darkBlack = Color(0xff060608);
  static const Color lightBlack = Color(0xff58585a);
  static const Color deepLilac = Color(0xff8383d1);
  static const Color greyishBrown = Color(0xff535353);
  static const Color brownishGrey = Color(0xff676767);
  static const Color audioBarColor = Color(0xffcecece);
  static const Color dateColor = Color(0xff9f9f9f);
  static const Color dividerColor = Color(0xffdfdfdf);
  static const Color dartNavyBlue = Color(0xff212239);
  static const Color playerBorder = Color(0xff707070);
  static const Color playerProgress = Color(0xff8689D5);
  static const Color liteBlueE2E2F2FF = Color(0xE2E2F2FF);
  static const Color tabIconColor = Color(0xffb0afcc);

  static const Color lightDimBlack = Color(0xff353536);

  static const Color itemSelected = Color(0xffECECFC);
  static const Color blue9888d0 = Color(0xff9888d0);
  static const Color greyd4d4d4 = Color(0xffd4d4d4);
  static const Color hintTextGray = Color(0xff7E7E7E);
  static const Color borderGray = Color(0xffB4B4B4);
  static const Color deleteIconColor = Color(0xff969696);
  static const Color yellowColor = Color(0xffFFFB8D);
  static const Color yellowBorderColor = Color(0xffFFDF5C);
  static const Color greyText = Color(0xaa1D1D26);
  static const Color meetingTextBorder = Color(0xffC6C2C2);
  static const Color meetingSubtitleColor = Color(0xff949393);
  static const Color meetingDatePickerColor = Color(0xffF0EFF7);
  static const Color meetingEndTime = Color(0xff5C93EB);
  static const Color meetingAccepted = Color(0xff119F27);
  static const Color meetingTentative = Color(0xff9B89D0);
  static const Color meetingCancelled = Color(0xffFF6868);
  static const Color meetingUnAnswered = Color(0x83e5dcff);





}
