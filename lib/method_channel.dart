import 'package:flutter/services.dart';

class MethodChannelExample {
  static const platform = MethodChannel('com.leadergroup.axionic/desktop_app');

  Future<String> getNativeData() async {
    try {
      final String result = await platform.invokeMethod('getNativeData');
      return result;
    } on PlatformException catch (e) {
      return "Failed to get data: '${e.message}'.";
    }
  }
}
