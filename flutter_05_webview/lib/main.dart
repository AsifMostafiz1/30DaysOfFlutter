import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


void main()
{
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _controllar = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: new AppBar(
          title: Text("WebView"),
          centerTitle: true,
        ),
        body: WebView(
          initialUrl: "https://www.facebook.com/",
          onWebViewCreated: (controller) => _controllar,
        ),

        bottomNavigationBar: Container(
          color: Theme.of(context).accentColor,
          child: ButtonBar(
            children: [
                navigationButton(Icons.chevron_left, () => null),
                navigationButton(Icons.chevron_right, () => null),
            ],
          ),
        ),
      ),
    );
  }

  Widget navigationButton(IconData icon, Function() onPressed)
  {
    return IconButton(icon: Icon(icon), onPressed: onPressed);
  }
}
