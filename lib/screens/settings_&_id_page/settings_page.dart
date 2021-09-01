

import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'dart:io';
//import 'package:utils/utils.dart';
import 'package:oppknocksapp/services/auth.dart';
import 'package:oppknocksapp/screens/settings_&_id_page/settingswidget/icon_widget.dart';
import 'package:oppknocksapp/screens/settings_&_id_page/accountpagesettings.dart';
import 'package:oppknocksapp/shared/constants.dart';

import 'athlete_profile/appbar_widget.dart';
class SettingsPage extends StatefulWidget {
  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) => Scaffold(
    //appBar: buildAppBar(context),
        body: SafeArea(
            child: ListView(
          padding: EdgeInsets.all(24),
          children: [
            SettingsGroup(
              title: "GENERAL",
              children: <Widget>[AccountPage(),buildlogout(), builddeleteAccount()],
            ),
            const SizedBox(height: 32),
            
            /*SettingsGroup(
              title: "FEEDBACK",
              children: <Widget>[
                buildreportbug(),
                buildsendfeedback()
              ],
            ),
            */
          ],
        )),
      );

  Widget buildlogout() => SimpleSettingsTile(
        title: 'Logout',
        subtitle: '',
        leading: IconWidget(icon: Icons.logout, color: Colors.black),
        // just reroute it later.
        //onTap:() =>Utils.showSnackBar(context,'Clicked Logout'),
        onTap:() async{
          await _auth.signOut();
        }
      );

  Widget builddeleteAccount() => SimpleSettingsTile(
        title: 'Delete Account',
        subtitle: '',
        leading: IconWidget(icon: Icons.delete, color: Colors.pink),
      );

  Widget buildreportbug() => SimpleSettingsTile(
        title: "Report A Bug",
        subtitle: '',
        leading:
            IconWidget(icon: Icons.bug_report, color: appColor1),
      );
      Widget buildsendfeedback() => SimpleSettingsTile(
        title: "Send Feedback",
        subtitle: '',
        leading:
            IconWidget(icon: Icons.thumb_up, color: appColor1),
      );
}
