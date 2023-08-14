import 'package:flutter/material.dart';
import 'package:trip_ease_project/Screens/Login/login_page.dart';
import 'package:trip_ease_project/screens/profile/profile.dart';
import 'package:trip_ease_project/screens/login/sign_in.dart';
class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool notifications = true;
  bool darkLight = true;
  String? language='english';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children:  [


          //Account Tile
           ListTile(
            title: const Text('Account'),leading: const Icon(Icons.account_circle_sharp) ,
            onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context) => const ProfileSettings()),);
          }),

          //Privacy Policy Tile
          const ListTile(
            title: Text('Privacy Policy'),leading: Icon(Icons.privacy_tip) ,
          ),

          //Notifications Tile
          ListTile(
            title: const Text('Notifications'),leading: const Icon(Icons.notifications) ,trailing: Switch(value: notifications, onChanged: (bool value){
              setState(() {
                notifications = !notifications;
              });
          }),
          ),

          //Dark/Light Tile
          ListTile(
            title: const Text('Dark/Light'),leading: const Icon(Icons.light_mode_outlined) ,trailing: Switch(value: darkLight,onChanged: (bool value){
              setState(() {
                darkLight = !darkLight;
              });
          },),
          ),

           //Languages Tile
           ListTile(
            title: const Text('Language'),leading: const Icon(Icons.language) ,
            trailing: DropdownButton(
              value: language,
              items:  const [
                DropdownMenuItem<String>(
                value: 'english',
                child: Text('English'),),
                DropdownMenuItem<String>(
                  value: 'malayalam',
                  child: Text('Malayalam'),)],
              onChanged: (String? value) {
                setState(() {
                  language= value;
                });
            },),
          ),

          //Change Password Tile
          const ListTile(
            title: Text('Change Password'),leading: Icon(Icons.password) ,
          ),

          //Delete Account Tile
           const ListTile(
            title: Text('Delete Account'), leading: Icon(Icons.delete) ,
          ),

          //Log Out Tile
          ListTile(
            title: const Text('Log Out'),leading: const Icon(Icons.logout),
            onTap:() {
              signOutGoogle();
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {
                return const Welcomepage();}), ModalRoute.withName('/'));
            }),
        ],
      ),
    );
  }
}
