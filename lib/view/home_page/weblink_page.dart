import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webLink extends StatefulWidget {
  final  String weblinkget;
   webLink({ Key? key ,required this.weblinkget}) : super(key: key);

  @override
  _webLinkState createState() => _webLinkState();
}

class _webLinkState extends State<webLink> {
  
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }
  @override
  Widget build(BuildContext context) {
    return  WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl:widget.weblinkget );
  }
}