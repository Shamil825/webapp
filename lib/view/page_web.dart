import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

class Page_web extends StatefulWidget {
  Page_web({Key? key}) : super(key: key);

  @override
  State<Page_web> createState() => _Page_webState();
}

class _Page_webState extends State<Page_web> {
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return const WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: "https://www.amazon.in");
  }
}
