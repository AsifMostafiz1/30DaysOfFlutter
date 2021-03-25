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
  @override
  List<String> restaurants = [
    'Burger Express',
    'Sultan Dine',
    'Kacchi Vai',
    'KFC Chicken',
    'La Meridian',
    'Chillox'
  ];

  int currentIndex;

  Widget build(BuildContext context) {
    return MaterialApp(

      title: "Flutter Demo",
      home: Scaffold(

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                currentIndex != null ? restaurants[currentIndex] : "Click Down",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: FlatButton(
                  onPressed: () {
                    _randomVariable();
                  },
                  child: Text("Pick a restaurant"),
                  color: Colors.deepPurple,
                  textColor: Colors.white,
                ),
              )
            ],
          ),
        ),

      ),
    );
  }

  void _randomVariable() {
    final random = Random();
    final index = random.nextInt(6);

    setState(() {
      currentIndex = index;
    });
  }
}



