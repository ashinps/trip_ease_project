
import 'package:trip_ease_project/utils/sign_in.dart';
import 'package:flutter/material.dart';

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
          height: 550,width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              )],
            color:Colors.white,

          ),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              const SizedBox(height: 20,),
              CircleAvatar(
                backgroundImage: NetworkImage(imageUrl!), radius: 60,
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(height:40 ,),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children:[
                    const Text('Name:',),
                    const SizedBox(width: 20,),
                    Text(name!)
                  ],),
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(children:
                [const Text('Email:',),
                  const SizedBox(width: 20,),
                  Text(email!)],),
              ),


            ],
          ),
        ),
      ),

    );
  }
}
