import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AboutWebviewPage extends StatefulWidget {
  const AboutWebviewPage({Key? key}) : super(key: key);

  @override
  State<AboutWebviewPage> createState() => _AboutWebviewPageState();
}

class _AboutWebviewPageState extends State<AboutWebviewPage> {

  @override
  void initState() {
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    super.initState();
  }

  var loadingPercentage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us Page"),
      ),
      body:  Stack(
        children: [
          /*=========================================*/
          WebView(
            initialUrl: 'https://www.google.com/',
            onPageStarted: (url){
              setState(() {
                loadingPercentage=0;
              });
            },
            onProgress: (progress) {
              setState(() {
                loadingPercentage = progress;
              });
            },
            onPageFinished: (url) {
              setState(() {
                loadingPercentage = 100;
              });
            },

          ),
          /*=========================================*/
          if (loadingPercentage < 100)
            LinearProgressIndicator(
              value: loadingPercentage / 100.0,
            ),
        ],
      ),
    );
  }
}
