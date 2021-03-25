import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';


void main()
{
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _screenShotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Screenshot(
            controller: _screenShotController,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('images/x.png'),
                Text("Hello! Buddy "),

                TextButton(onPressed: _takeScreenShoot,
                    child: Text("Take a screenshot")),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _takeScreenShoot() async
  {
    final imageFile = await _screenShotController.capture();
    Share.shareFiles([imageFile.path]);
  }
}
