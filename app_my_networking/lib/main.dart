import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyContactList(),
    );
  }
}

class MyContactList extends StatefulWidget {
  @override
  _MyContactListState createState() => _MyContactListState();
}

class _MyContactListState extends State<MyContactList> {
  String url = "https://randomuser.me/api/?results=15";
  List data = [];

  Future<String> makeRequest() async{
    var response = await http.get(Uri.parse(url),
    headers: {'Accept': 'aplication/json'});

    setState(() {
      var extractdata = json.decode(response.body);
      data = extractdata['results'];
    });

    //print(response.body);
    print('Name: ' + data[0]["name"]["first"]);
    print('Last Name: ' + data[0]["name"]["last"]);
    print('Email: ' + data[0]["email"]);
    return response.body;
  }

  @override
  void initState(){
    this.makeRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Contact List!"),
      ),
      body: ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, i){
            return ListTile(
              title: Text(data[i]["name"]["first"]),
              subtitle: Text(data[i]["cell"]),
              leading: CircleAvatar(
                backgroundImage:
                NetworkImage((data[i]["picture"]["thumbnail"])),
              ),
              onTap: (){
                Navigator.push(
                    context,
                MaterialPageRoute(builder: (BuildContext context) => ContactDetails(data[i])));
              },
            );
          })
    );
  }
}

class ContactDetails extends StatelessWidget {
  final index;
  ContactDetails(this.index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My contacts details"),
      ),
      body: Center(
        child: Container(
          width: 190,
          height: 190,
          decoration: BoxDecoration(
            color: Colors.red,
            image: DecorationImage(
              image: NetworkImage(index["picture"]["large"]),
              fit: BoxFit.cover,
            ),
            border: Border.all(
              color: Colors.deepOrange,
              width: 5,
            ),
              borderRadius: BorderRadius.all(Radius.circular(90)),
          ),
        ),
      ),

    );
  }
}
