import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewNewsScreen extends StatefulWidget {
  const WebViewNewsScreen({super.key, required this.url, required this.name});
  final String url;
  final String name;
  @override
  State<WebViewNewsScreen> createState() => _WebViewNewsScreenState();
}

class _WebViewNewsScreenState extends State<WebViewNewsScreen> {
  late WebViewController controller;
  void initWebViewController(){
    controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setNavigationDelegate(
    NavigationDelegate(
      onProgress: (int progress) {
        // Update loading bar.
      },
      onPageStarted: (String url) {},
      onPageFinished: (String url) {},
      onHttpError: (HttpResponseError error) {},
      onWebResourceError: (WebResourceError error) {},
      onNavigationRequest: (NavigationRequest request) {
        if (request.url.startsWith('https://www.youtube.com/')) {
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    ),
  )
  ..loadRequest(Uri.parse(widget.url));
  }
  @override
  void initState() {
    initWebViewController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    appBar: AppBar(title: Text(widget.name)),
    body: WebViewWidget(controller: controller),
  );
  }
}