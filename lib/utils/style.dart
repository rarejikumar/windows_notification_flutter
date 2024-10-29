import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'apptheme.dart';

class Style {
  static TextStyle headingTextStyle() => GoogleFonts.roboto(
          textStyle: const TextStyle(
        color: Colors.white,
        fontSize: 27,
        fontWeight: FontWeight.w700,
      ));

  static TextStyle titleTextStyle(Color color, double fontSize) =>
      GoogleFonts.roboto(
          textStyle: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
      ));



   static TextStyle boldTextStyle(Color color, double fontSize) =>
        GoogleFonts.roboto(
        textStyle: TextStyle(
        color: color, fontSize: fontSize, 
        fontWeight: FontWeight.bold,
        ));

  static TextStyle normalTextStyle(Color color, double fontSize) =>
      GoogleFonts.roboto(
        textStyle: TextStyle(
        color: color, fontSize: fontSize, fontWeight: FontWeight.w400)
  );

  static TextStyle mediumTextStyle(Color color, double fontSize) =>
      GoogleFonts.roboto(
          textStyle: TextStyle(
              color: color, fontSize: fontSize, fontWeight: FontWeight.w500)
      );

  static TextStyle underLineTextStyle(Color color, double fontSize) =>
      GoogleFonts.roboto(
          textStyle: TextStyle(
              color: color, fontSize: fontSize, fontWeight: FontWeight.w400,decoration: TextDecoration.underline)
      );


  static ButtonStyle primaryButtonStyle() => ElevatedButton.styleFrom(
      backgroundColor: AppTheme.primaryColor, disabledForegroundColor: Colors.grey.withOpacity(0.38), disabledBackgroundColor: Colors.grey.withOpacity(0.12),
      padding: const EdgeInsets.all(0.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
      elevation: 1);

  static ButtonStyle roundedButtonStyle(Color color, double radius) => ElevatedButton.styleFrom(
      backgroundColor: color, disabledForegroundColor: Colors.grey.withOpacity(0.38), disabledBackgroundColor: Colors.grey.withOpacity(0.12),
      padding: const EdgeInsets.all(0.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      elevation: 1);

  static ButtonStyle borderButtonStyle() => ElevatedButton.styleFrom(
    foregroundColor: AppTheme.primaryColor, backgroundColor: AppTheme.whiteBackground, side: const BorderSide(color: AppTheme.primaryColor, width: 2),
    textStyle: const TextStyle(
        color: AppTheme.primaryColor, fontSize: 14, fontStyle: FontStyle.normal),
  );


  static BoxDecoration gradientButtonBackground() => BoxDecoration(
      gradient: const LinearGradient(
        colors: [AppTheme.lightPurple, AppTheme.darkPurple],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      border: Border.all(color: Colors.white, width: 2),
      borderRadius: BorderRadius.circular(32.0));

  static BoxDecoration gradientButtonDisabled() => BoxDecoration(
      gradient: const LinearGradient(
        colors: [AppTheme.lightGray, AppTheme.paleGray],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      border: Border.all(color: Colors.white, width: 2),
      borderRadius: BorderRadius.circular(32.0));

  static InputDecoration roundedTextFieldStyle(String label, String icon) =>
      InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: IconButton(
              icon: SvgPicture.asset(icon, height: 16, width: 16),
              onPressed: null,
            ),
          ),
          hintText: label,
          errorMaxLines: 3,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22.0),
            borderSide: const BorderSide(color: AppTheme.borderColor, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22.0),
            borderSide: const BorderSide(color: AppTheme.borderColor, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22.0),
            borderSide: const BorderSide(color: AppTheme.borderColor, width: 2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22.0),
            borderSide: const BorderSide(color: AppTheme.borderColor, width: 2),
          ));

  static InputDecoration suffixTextField(String label, String icon) =>
      InputDecoration(
          contentPadding:
          const EdgeInsets.only(top: 10.0, bottom: 10, left: 20.0, right: 20),
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: IconButton(
              icon: SvgPicture.asset(icon, height: 24, width: 24),
              onPressed: null,
            ),
          ),
          hintText: label,
          hintStyle: Style.normalTextStyle(AppTheme.secondaryTextColor, 12),
          errorMaxLines: 3,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(26.0),
            borderSide: const BorderSide(color: AppTheme.borderColor, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(26.0),
            borderSide: const BorderSide(color: AppTheme.borderColor, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(26.0),
            borderSide: const BorderSide(color: AppTheme.borderColor, width: 2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(26.0),
            borderSide: const BorderSide(color: AppTheme.borderColor, width: 2),
          ));

  static InputDecoration noImageTextFieldStyle(String label) =>
      InputDecoration(
          contentPadding:
          const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          hintText: label,
          errorMaxLines: 3,
          hintStyle: const TextStyle(color: AppTheme.warmGrey),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22.0),
            borderSide: const BorderSide(color: AppTheme.borderColor, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22.0),
            borderSide: const BorderSide(color: AppTheme.borderColor, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22.0),
            borderSide: const BorderSide(color: AppTheme.borderColor, width: 2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22.0),
            borderSide: const BorderSide(color: AppTheme.borderColor, width: 2),
          ));


  // static  String dateTimeToString(String format, DateTime date) {
  //   var locale = LocaleService.locale;
  //   String formattedDate = DateFormat(format,locale.toString()).format(date);
  //   return formattedDate;
  // }

  static  DateTime stringToDateTime(String date) {
    if(date.isNotEmpty) {
      return DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(date);
    }
    return DateTime.now();
  }

  static String formatTimeAMPM(String time) {
    String formattedDate = DateFormat('hh:mm a').format(DateTime.parse(time));
    return formattedDate;
  }


  static String stripHtmlIfNeeded(String text) {
    return text.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' ');
  }


  String formatISOTime(DateTime date) {
   // DateTime date = DateTime(date.year, 10, 10, 10, 52, 50, 756, 619);

    var utcDate = date.toUtc();
    return utcDate.toIso8601String();
    // String formattedDate = utcDate.toIso8601String();
    // String milliseconds = utcDate.millisecond.toString().padLeft(3, '0');
    // String utcOffset = utcDate.timeZoneOffset.isNegative ? '-' : '+';
    // utcOffset += utcDate.timeZoneOffset.inHours.toString().padLeft(2, '0');
    // utcOffset += ':${date.timeZoneOffset.inMinutes.remainder(60).toString().padLeft(2, '0')}';
    // formattedDate = formattedDate.replaceFirst('Z', '.$milliseconds$utcOffset');
    // return '$formattedDate+00:00';
  }

}
