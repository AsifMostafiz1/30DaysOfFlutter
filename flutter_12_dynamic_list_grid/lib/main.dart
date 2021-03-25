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
  final _list = List.filled(100, "Asif");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          home: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                bottom: TabBar(tabs: [Text("List",style: TextStyle(fontSize: 30)),Text("Grid",style: TextStyle(fontSize: 30))],),
              ),
              body: TabBarView(
                children: [_ListViewContent(),_gridViewContent()],
              ),
            ),
          ),
    );
  }
  Widget _ListViewContent(){

    return ListView.builder(
      itemCount: _list.length,
      itemBuilder: (context,index) =>Card(
        elevation: 5,
        child: ListTile(
          title: Text((index+1).toString()),
          onTap:() => print(index+1),
        ),
      ),
    );
  }

  Widget _gridViewContent()
  {
    return GridView.builder(
        itemCount: _list.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context,index) => Card(
          elevation: 5,
          child: Center(
            child: GridTile(
                child: Text(_list[index])),
          ),
        ));
  }

}
