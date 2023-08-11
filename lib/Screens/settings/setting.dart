import 'package:flutter/material.dart';
import 'package:trip_ease_project/Screens/profile/profie.dart';
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


           ListTile(
            title: Text('Account'),leading: Icon(Icons.account_circle_sharp) ,
            onTap: () {Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ProfileSettings()),);
          }),


          const ListTile(
            title: Text('Privacy Policy'),leading: Icon(Icons.privacy_tip) ,
          ),


          ListTile(
            title: const Text('Notifications'),leading: const Icon(Icons.notifications) ,trailing: Switch(value: notifications, onChanged: (bool value){
              setState(() {
                notifications = !notifications;
              });
          }),
          ),


          ListTile(
            title: const Text('Dark/Light'),leading: const Icon(Icons.light_mode_outlined) ,trailing: Switch(value: darkLight,onChanged: (bool value){
              setState(() {
                darkLight = !darkLight;
              });
          },),
          ),


           ListTile(
            title: Text('Language'),leading: Icon(Icons.language) ,
            trailing: DropdownButton(
              value: language,
              items:  [
                DropdownMenuItem<String>(
                child: Text('English'), value: 'english',),
                DropdownMenuItem<String>(
                  child: Text('Malayalam'), value: 'malayalam',)],
              onChanged: (String? value) {
                setState(() {
                  language= value;
                });
            },),
          ),


          const ListTile(
            title: Text('Change Password'),leading: Icon(Icons.password) ,
          ),


          const ListTile(
            title: Text('Delete Account'),leading: Icon(Icons.delete) ,
          ),


          const ListTile(
            title: Text('Log Out'),leading: Icon(Icons.logout) ,
          ),
        ],
      ),
    );
  }
}
