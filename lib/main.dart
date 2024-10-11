import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';  // For checking the platform

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WebViewContainer(),
    );
  }
}

class WebViewContainer extends StatefulWidget {
  @override
  _WebViewContainerState createState() => _WebViewContainerState();
}

class _WebViewContainerState extends State<WebViewContainer> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the platform for WebView
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();  // Correct platform initialization
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Web Page View"),
      ),
      body: WebView(
        initialUrl: 'https://salamat724.com',
        javascriptMode: JavascriptMode.unrestricted,  // Corrected JavascriptMode usage
        onWebViewCreated: (controller) {
          _controller = controller;
        },
      ),
    );
  }
}
