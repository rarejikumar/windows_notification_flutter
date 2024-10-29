import 'dart:io';
import 'package:axionic_desktop/utils/apptheme.dart';
import 'package:axionic_desktop/utils/image_utils.dart';
import 'package:axionic_desktop/utils/style.dart';
import 'package:desktop_webview_window/desktop_webview_window.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:windows_notification/notification_message.dart';
import 'package:windows_notification/windows_notification.dart';

import 'method_channel.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  appWindow.size = const Size(1000, 700);
  runApp(const MyApp());
  appWindow.show();
  doWhenWindowReady(() {
    final win = appWindow;
    const initialSize = Size(1000, 700);
    win.minSize = initialSize;
    win.size = initialSize;
    win.alignment = Alignment.center;
    win.title = "Axionic";
    win.show();
  });
}

// void main(List<String> args) {
//   debugPrint('args: $args');
//   if (runWebViewTitleBarWidget(args)) {
//     return;
//   }
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(const MyApp());
// }

const borderColor = AppTheme.primaryColor;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _controller = TextEditingController(
    text: 'https://app.axionic.io/app/#',
  );
  String _nativeData = 'Unknown';

  Future<void> _getNativeData() async {
    MethodChannelExample example = MethodChannelExample();
    String data = await example.getNativeData();
    setState(() {
      _nativeData = data;
    });
  }


  Future<String> _getWebViewPath() async {
    final document = await getApplicationDocumentsDirectory();
    return p.join(
      document.path,
      'desktop_webview_window',
    );
  }

  var initalView = true;
  var previousPageLink = "https://app.axionic.io/app/#";
  final _winNotifyPlugin = WindowsNotification(applicationId: "Axionic");
  NotificationMessage message = NotificationMessage.fromPluginTemplate(
      "Axionic",
      "Test Notification",
      "New Message arrived!"
  );

  void _onTap() async {
    var url_main = "";
    _getNativeData();

    final initialTab = await WebviewWindow.create(
      configuration: CreateConfiguration(
          userDataFolderWindows: await _getWebViewPath(),
          titleBarTopPadding: Platform.isMacOS ? 20 : 0,
          title: "Axionic"),
    );

    initialTab
      ..setBrightness(Brightness.dark)
      ..setApplicationNameForUserAgent("Axionic")
      ..launch(_controller.text)
      ..addOnUrlRequestCallback((url) async {
        url_main = url;
        if (url_main.contains('https://app.axionic.io/app/#/Call/CRview/')  || (!url_main.contains('https://app.axionic.io/') && !url_main.contains('https://meet.axionic.io/')) || url_main.contains('https://app.axionic.io/UserUploads')) {
          initialTab.stop();
          if (!await launchUrl(
              Uri.parse(url),
              mode: LaunchMode.externalApplication,
            )) {
              throw Exception('Could not launch $url');
            }

          if(url_main.contains('https://app.axionic.io/app/#/Call/CRview/')) {
            initialTab.back();
          }
        } else {
          // _controller.text = url_main;
        }
      })
      ..onClose.whenComplete(() {
        appWindow.close();
        debugPrint("on close");
      });
  }

  void closeTab() async {
    print('initalView:${initalView}');
    if (initalView == true) {
      _onTap();
      await Future.delayed(const Duration(seconds: 3));
      appWindow.hide();
    }
  }

  @override
  void initState() {
    closeTab();
    sendLocalNotification();
    super.initState();
  }

  sendLocalNotification() {
    Future.delayed(const Duration(seconds: 10));
    _winNotifyPlugin.showNotificationPluginTemplate(message);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
            child: WindowBorder(color: borderColor, child: splashScreen())),
      ),
    );
  }

  Widget splashScreen() {
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            Center(
              child: SizedBox(
                height: 250,
                child: Image.asset(Images.splashBackground),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Get Axionic",
              style: Style.titleTextStyle(AppTheme.whiteBackground, 50.0),
            ),
            const SizedBox(height: 20),
            Text(
              "Work anywhere, with anyone, on any device\nEverything works better together!",
              style: Style.mediumTextStyle(AppTheme.whiteBackground, 18.0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Text(
              "Version 1.0.0",
              style: Style.mediumTextStyle(AppTheme.whiteBackground, 18.0),
            ),
            const SizedBox(height: 50),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Loading Axionic please wait...",
                  style: Style.mediumTextStyle(AppTheme.whiteBackground, 16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
