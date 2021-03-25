import 'package:flutter/material.dart';
import 'package:flutter_10_network_request/data_services.dart';
import 'package:http/http.dart' as http;


void main()
{
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final _dataService = DataService();

  String _response;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: ListView(
            children: [
              ElevatedButton(onPressed:_makeRequest, child: Text("Make Request")),
              Text(_response!=null?_response: ""),
            ],
          ),
        ),
    );
  }
  void _makeRequest() async
  {
    final response = await _dataService.makeApiRequest();

    setState(() {
      _response = response;
    });
  }
}
