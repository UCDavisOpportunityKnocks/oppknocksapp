import 'package:flutter/material.dart';

import 'package:oppknocksapp/screens/dashboard_screen/dashboard.dart';
import 'package:oppknocksapp/screens/settings_&_id_page/athlete_profile/athleteprofile.dart';
import 'package:oppknocksapp/shared/constants.dart';
import 'package:oppknocksapp/screens/settings_&_id_page/settings_page.dart';
import 'screens/dashboard_screen/dashboard.dart';
import 'package:oppknocksapp/screens/Discount_Receipts/discountreceipt.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  //final AuthService _auth = AuthService();

  int _selectedPage = 0;
  final _pageOptions = [
    Dashboard(),
    Profile(), // put back Profile later
    DiscountRecipts(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectedPage],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
            width: 35, child: Image.asset("assets/images/OKlogo.png")),
        centerTitle: true,
        /*actions: <Widget>[
            ElevatedButton.icon(
              onPressed: () async {
                //await _auth.signOut();
                await Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              },
              style: ElevatedButton.styleFrom(primary: Colors.white),
              icon: Icon(
                Icons.message_outlined,
                color: Colors.black,
              ),
              label: Text(
                'messages',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () async {
                //await _auth.signOut();
                 await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => SettingsPage()));
              },
              style: ElevatedButton.styleFrom(primary: Colors.white),
              icon: Icon(
                Icons.settings_applications_outlined,
                color: Colors.black,
              ),
              label: Text(
                'settings',
                style: TextStyle(color: Colors.black),
              ),
            ),
          
          ]*/
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: appColor1,
        unselectedItemColor: Colors.grey[350],
        //showSelectedLabels: true,
        //showUnselectedLabels: false,
        currentIndex: _selectedPage,
        onTap: (int index) {
          setState(() {
            _selectedPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.receipt_sharp,
            ),
            label: 'Receipts',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
