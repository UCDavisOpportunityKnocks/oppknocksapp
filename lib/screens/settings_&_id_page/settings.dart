//import 'dart:html';  
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'accountpagesettings.dart';
import 'dart:io';
import 'package:io/io.dart';
import 'usernameandpasswordsettings.dart';
//import 'package:path_provider/path_provider.dart';
class userSettings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return userSettingsState();
  }
}

class userSettingsState extends State<userSettings> {
  PickedFile? _image;
  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(title:Text("Settings"),),
        body: Container(
      padding: EdgeInsets.only(left: 16, top: 25, right: 16),
      child: ListView(
        children: [
          Text(
            "Settings\n",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
          //imageProfile(),
          accountProfile(),
        ],
      ),
    ));
  }
/*
  Widget imageProfile() {
    return Center(
        child: Stack(
      children: <Widget>[
        CircleAvatar(
          radius: 80.0,
          backgroundImage:
              AssetImage("assets/images/athleteprof.jpg"), // a display for now.
          // need to debug this part in image file. setting up the images
          
              //backgroundImage:_image=FileImage(_image.path);
  
              
        ),
        // for the icon
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (builder) => bottomSheet(),
              );
            },
            child: Icon(
              Icons.camera_alt,
              color: Colors.white,
              size: 28.0,
            ),
          ),
        ),
      ],
    ));
  }

  // this is for choosing the options of the camera
  Widget bottomSheet() {
    return Container(
        height: 100.0,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: <Widget>[
            Text(
              'Choose Profile photo',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton.icon(
                  icon: Icon(Icons.camera),
                  onPressed: () {
                    takePhoto(ImageSource.camera);
                  },
                  label: Text("Camera"),
                ),
                TextButton.icon(
                  icon: Icon(Icons.image),
                  onPressed: () {
                    takePhoto(ImageSource.gallery);
                  },
                  label: Text("Gallery"),
                ),
              ],
            )
          ],
        ));
  }

  void takePhoto(ImageSource sources) async {
    final mypickedFile = await imagePicker.getImage(
      source: sources,
    );
    setState(() {
      _image = mypickedFile;
    });
  }
*/




  Widget accountProfile() {
    return Container(
      padding: EdgeInsets.only(left: 16, top: 25, right: 16),
     
      child: Column(
        children:<Widget> [
          

         Row(
            children: [
              Icon(
                Icons.person,
                color: Colors.lightBlue,
              ),
              Text(
                "Account",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
     
          Divider(
            height: 20,
            thickness: 1,
          ),
          buildAccountOption(context,"Username and Password"),
          //buildAccountOption(context, "Change Password"),
          buildAccountOption(context, "Content Settings"),
          //buildAccountOption(context, "Language"),
          buildAccountOption(context, "Privacy and Security")
        ],
      ),
    );
  }
GestureDetector buildAccountOption(BuildContext context, String title)
{
  Color arrow_color=const Color(0xff1A3F65);

  int _selectedaccount=0;
  final _accountOptions =
  [
    UsernameAndPassword(),
  ];
  return GestureDetector(
    onTap: ()
    {
      Navigator.push(context, new MaterialPageRoute(builder: (context) => UsernameAndPassword(),));
    },
    child:Padding(
      padding: const EdgeInsets.symmetric(vertical:8,horizontal:20),
      child:Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title,style:TextStyle (
            fontSize:20,
            fontWeight:FontWeight.w500,
            color:Colors.grey[600]
          )),
          Icon(Icons.arrow_forward_ios,color:arrow_color)
        ],
      )
    )
  );
}
}
