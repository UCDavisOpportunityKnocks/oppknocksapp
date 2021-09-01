import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:oppknocksapp/models/businessprofileuser.dart';


class BUserService{


  final CollectionReference businessUserCollection=
  FirebaseFirestore.instance.collection('businessUsers');



}

