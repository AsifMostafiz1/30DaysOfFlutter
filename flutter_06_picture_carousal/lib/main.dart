import 'package:carousel_slider/carousel_slider.dart';
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
  final _imagePath =[
      'assets/img1.jpg',
      'assets/img2.jpg',
      'assets/img3.jpg',
      'assets/img4.jpg',
      'assets/img5.jpg',

  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: SafeArea(
            child: CarouselSlider(
                options: CarouselOptions(autoPlay: true),
                items: _imagePath.map((imagePath) {
                  return Builder(builder: (context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        child: Image.asset(imagePath));
                  });
                }).toList()),
          ),
        ));
  }
}