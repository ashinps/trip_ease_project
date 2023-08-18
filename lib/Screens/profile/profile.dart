import 'package:flutter/material.dart';

import '../Login/sign_in.dart';
class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: Center(
        child: Container(
          height: 570,width: 450,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              )],
            color:Colors.white,

          ),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              SizedBox(height: 20,),

              CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(imageUrl!),
                radius: 60,
              ),
              SizedBox(height:40 ,),

              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(children: [Text('Name:',style: TextStyle(fontSize: 20),),],),
              ),

              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(children: [Text('Email:',style: TextStyle(fontSize: 20),),],),
              ),


            ],
          ),
        ),
      ),

    );
  }
}
