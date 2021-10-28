import 'dart:ffi';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../shared/constants.dart';
import 'package:oppknocksapp/screens/details_screen/details_screen.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SearchPageState();
  }
}

class SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  List _allResults = [];
  List _resultsList = [];
  late Future resultsLoaded;

  // When page is loaded, event listener added to listen to when search text is changed
  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  // Get rid of listener when search page isn't up
  @override
  void dispose() {
    // TODO: implement dispose
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    print(_searchController.text);
  }

  getDiscounts() async {
    final uid = await Provider.of(context).auth.getCurrentUID();
    var data = await FirebaseFirestore.instance
        .collection("deals")
        .orderBy("createdAt", descending: true)
        .get();
    setState(() {
      _allResults = data.docs;
    });

    return data.docs;
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    // Flag that confirms if data is loaded
    resultsLoaded = getDiscounts();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[100],
          title: Container(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search",
                hintStyle: TextStyle(fontSize: 18),
                alignLabelWithHint: true,
              ),
              style: TextStyle(fontSize: 18),
            ),
            margin: EdgeInsets.all(15),
          ),
        ),
        body: ListView.builder(
            itemCount: _allResults.length,
            itemBuilder: (context, index) {
              return Container();
            }));
  }
}
