import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:oppknocksapp/screens/details_screen/details_screen.dart';
import 'package:oppknocksapp/shared/constants.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            "All Deals",
            style: TextStyle(fontSize: 20),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection("deals").snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Center(
                      child: const Text("Loading...",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18)),
                    );
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemExtent: 90,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot deal = snapshot.data!.docs[index];
                        return Container(
                          decoration: new BoxDecoration(
                              border: new Border(
                                  bottom: new BorderSide(
                                      color: Colors.grey.shade400))),
                          child: Theme(
                              data: ThemeData(
                                splashColor: appColor1,
                                highlightColor: Colors.grey.withOpacity(.5),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: ListTile(
                                  leading: Image.network(deal['img']),
                                  title: Text(deal['deal']),
                                  subtitle: Text(deal['business']),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            DetailScreen(item: deal),
                                      ),
                                    );
                                  },
                                ),
                              )),
                        );
                      });
                }),
          )
        ],
      ),
    );
  }
}
