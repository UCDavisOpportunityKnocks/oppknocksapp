//import 'dart:html';
//import 'dart:html';
//import 'dart:html';  
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oppknocksapp/screens/settings_&_id_page/athlete_profile/edit_athlete_profile.dart';
import 'package:oppknocksapp/models/athleteprofileuser.dart';
import 'package:provider/provider.dart';




class ConsumerProfile extends StatefulWidget{
  @override
 ConsumerProfileState createState() => ConsumerProfileState();
}

class ConsumerProfileState extends State<ConsumerProfile>{

  @override
  
  
  @override 
  Widget build(BuildContext context){
    return Scaffold(
     body:Center(
        child:StreamBuilder(stream:FirebaseFirestore.instance.collection("athleteUserCollection").snapshots(),
        
        builder:(context,AsyncSnapshot<QuerySnapshot> snapshot) {
          return ListView(
            children: 
              snapshot.data!.docs.map((athlete){
                  return Center(
                    child:ListView(
                      children: [
                        Text(athlete['name']),

                        
                      ],
                    ),
                  );
              }).toList(),

          );
        })
       
     )
    );
  }

  
}


/*

Future<void> getcollection() async{
    FirebaseFirestore ?_instance=FirebaseFirestore.instance;
    CollectionReference collection=_instance.collection("athleteUserCollection");

  DocumentSnapshot snapshot= await collection.doc("mNmge4vBEpXiSg1aWo6p5Ur4VW32").get();
  var data= snapshot.data() as Map;

  var name=data['name'];
   


  }
*/