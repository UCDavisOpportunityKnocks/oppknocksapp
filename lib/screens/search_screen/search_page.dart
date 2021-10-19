import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SearchPageState();
  }
}

class SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: Container(
          child: CupertinoSearchTextField(
            padding: EdgeInsets.all(10),
            style: TextStyle(fontSize: 20),
          ),
          margin: EdgeInsets.all(15),
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
