import 'package:flutter/material.dart';
import 'package:oppknocksapp/screens/settings_&_id_page/athlete_profile/appbar_widget.dart';
import 'package:oppknocksapp/shared/search_field.dart';

class AthleteAdPage extends StatefulWidget {
  @override
  AthleteAdPageState createState() => AthleteAdPageState();
}

class AthleteAdPageState extends State<AthleteAdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        children: [
          SearchField(),
          AdvertisementFieldCard(),
        ],
      ),
    );
  }

  Widget AdvertisementFieldCard() {
    return Container(
      padding: EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              //showAboutDialog(context: context)
            },
            child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Stack(
                  children: [
                    Ink.image(
                      image: AssetImage("assets/images/Ali_Baba.png"),
                      height: 240,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 16,
                      right: 16,
                      left: 16,
                      child: Text(
                        "Ali Baba",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.lightBlue,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              //showAboutDialog(context: context)
            },
            child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Stack(
                  children: [
                    Ink.image(
                      image: AssetImage("assets/images/Davis_Creamery.png"),
                      height: 240,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 16,
                      right: 16,
                      left: 16,
                      child: Text(
                        "Davis Creamery",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.lightBlue,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
