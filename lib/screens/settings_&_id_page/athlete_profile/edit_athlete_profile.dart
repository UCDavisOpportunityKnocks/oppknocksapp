import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oppknocksapp/models/athleteprofileuser.dart';
import 'package:oppknocksapp/screens/settings_&_id_page/athlete_profile/appbar_widget.dart';
import 'package:oppknocksapp/screens/settings_&_id_page/athlete_profile/textfield_widget.dart';
import 'package:oppknocksapp/services/dbcollection.dart';
import 'package:oppknocksapp/utils/user_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'athlete_profile_widget.dart';
import 'button_widget.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'athleteprofilewidget2.dart';
import 'package:oppknocksapp/models/okuser.dart';
import 'package:oppknocksapp/services/auth.dart';


class EditAthleteProfile extends StatefulWidget {
  @override
  EditAthleteProfileState createState() => EditAthleteProfileState();
}

class EditAthleteProfileState extends State<EditAthleteProfile> {
    //AthleteUser user = UserPreferences.myathleteUser; //, this is for constant only.

  // loading it into whatever it is saved. 
late AthleteUser user;
@override 
void initState(){
  super.initState();
  user=UserPreferences.getUser(); // change to getUser later once fixed. 
}



  chooseImage(ImageSource source) async {
    final image = await ImagePicker().getImage(source: source);
    
     if (image != null) {
      final directory = await getApplicationDocumentsDirectory();
      final name = basename(image.path);
      final imageFile = File('${directory.path}/$name');
      final newImage = await File(image.path).copy(imageFile.path);
      setState(() => user = user.copy(imagePath: newImage.path));
    }
  }



  @override
  Widget build(BuildContext context) {
    final users = Provider.of<OKUser?>(context); // This has the uid in users.uid


  return Scaffold(
    
        appBar: buildAppBar(context),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          children: [
         
            AthleteProfileWidget2(
              imagePath: user.imagePath,
              isEdit: true,

              onClicked: () async {
                if (Platform.isIOS) {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (context) => CupertinoActionSheet(actions: [
                            CupertinoActionSheetAction(
                                child: Text('Camera'),
                                onPressed: () {
                                  Navigator.pop(context);
                                  chooseImage(ImageSource.camera);
                                }),
                            CupertinoActionSheetAction(
                                child: Text('Gallery'),
                                onPressed: () {
                                  Navigator.pop(context);
                                  chooseImage(ImageSource.gallery);
                                }),
                          ]));
                }
                // for android devices.
                else {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Wrap(
                      children: [
                        ListTile(
                            leading: Icon(Icons.camera_alt),
                            title: Text('Camera'),
                            onTap: () {
                              Navigator.pop(context);
                              chooseImage(ImageSource.camera);
                            }),
                        ListTile(
                            leading: Icon(Icons.photo_album),
                            title: Text('Gallery'),
                            onTap: () {
                              Navigator.pop(context);
                              chooseImage(ImageSource.gallery);
                            }),
                      ],
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: "Name",
              text: user.name,
              onChanged: (name) => user = user.copy(name: name),
            ),

            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'College/University',
              text: user.college,
              onChanged: (college) => user = user.copy(college: college),
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Sports (College Athletes Only)',
              text: user.sports,
              onChanged: (sports) => user = user.copy(sports: sports),
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Username',
              text: user.username,
              onChanged: (username) => user = user.copy(username: username),
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Bio',
              text: user.bio,
              maxLines: 5,
              onChanged: (bio) => user = user.copy(bio: bio),
            ),
            const SizedBox(height: 24),


const SizedBox(height: 24,),
            ButtonWidget(
              text: 'Save',
              onClicked: () async {
               // big problem is setup the uid from authentication.
                Map <String,dynamic> data=
              {
                "image":user.imagePath,
                "name":user.name,
                "username":user.username,
                "sports":user.sports,
               "college":user.college,
              "bio":user.bio
              };
               FirebaseFirestore.instance.collection("athleteUserCollection").doc(users?.uid).set(data);
                UserPreferences.setUser(user);
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      );

  }

}





/*
Future ?saves(User fuser) async{
Map <String,dynamic> data=
              {
                "image":user.imagePath,
                "name":user.name,
                "username":user.username,
                "sports":user.sports,
               "college":user.college,
              "bio":user.bio
              };
  
  FirebaseFirestore.instance.collection("athleteProfile").doc(fuser.uid).collection("Profiles").add(data);
}
*/


    // social media
/*
           Divider(thickness: 3,color: Colors.black,),

           Text("Linked Accounts",style: TextStyle(fontSize: 25),), // this is more of a signed in page to any account you want. No idea 

          Card(
        child:ListTile(
          leading: Icon(Icons.add),
          title:Text("Instagram"),
        ),
      ),
      Card(
        child:ListTile(
          leading: Icon(Icons.add),
          title:Text("Facebook"),
        ),
      ),
      Card(
        child:ListTile(
          leading: Icon(Icons.add),
          title:Text("LinkedIn"),
        ),
      ),
  Card(
        child:ListTile(
          leading: Icon(Icons.add),
          title:Text("Twitter"),
        ),
      ),
*/