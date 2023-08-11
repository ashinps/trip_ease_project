import 'package:flutter/material.dart';
import '/Screens/Splash/splashscreen.dart';
main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: 'Trip Ease',
      theme: ThemeData(
        primarySwatch: Colors.red),
      home:const Splash()
    );
    }
}
