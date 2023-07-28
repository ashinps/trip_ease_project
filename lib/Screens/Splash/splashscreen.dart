import 'dart:async';

import 'package:flutter/material.dart';
import '/Screens/Login/login_page.dart';
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    Timer(
      const Duration(seconds: 2),(){
      Navigator.pushReplacement(context,
      MaterialPageRoute(
      builder: (context) => const Loginpage(),
      ));
    });
  }
  
  
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: CircleAvatar(
                  radius: 150.0,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/images/logo.jpg'),
                ),),
           Padding(
             padding: EdgeInsets.all(60.0),
             child: CircularProgressIndicator(
               strokeWidth:3,
             ),
           ),
          ],
        ),
      ),
    );
  }
}
