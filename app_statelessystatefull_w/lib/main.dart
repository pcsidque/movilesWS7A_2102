import 'package:flutter/material.dart';

void main() {
  runApp(MyStatefullApp());
}

/*
class MyStatelessApp extends StatelessWidget {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Ejm de StateLess W."),
        ),
        body: Center(
          child: Text(counter.toString(),
          style: TextStyle(fontSize: 90)
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.plus_one),
          onPressed: (){
            counter++;
            print(counter);
          },
        ),
      ),
    );
  }
}
 */

//st para generar
class MyStatefullApp extends StatefulWidget {
  @override
  _MyStatefullAppState createState() => _MyStatefullAppState();
}

class _MyStatefullAppState extends State<MyStatefullApp> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Ejm de StateFull W."),
        ),
        body: Center(
          child: Text(counter.toString(),
              style: TextStyle(fontSize: 90)
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.plus_one),
          onPressed: (){

            print(counter);
            setState(() {
              counter++;
            });
          },
        ),
      ),
    );
  }
}

