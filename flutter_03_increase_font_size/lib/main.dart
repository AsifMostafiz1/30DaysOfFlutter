import 'dart:math';

import 'package:flutter/material.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _fontSize = 20;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: TextField(
                    textInputAction: TextInputAction.done,
                    style: TextStyle(fontSize:_fontSize),
                    maxLines: null,
                  ),
                ),
                Slider(value: _fontSize, onChanged: (newSize){
                  setState(() => _fontSize=newSize);
                },
                min: 20,
                  max: 100,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
