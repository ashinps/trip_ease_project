import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trip_ease_project/Screens/Home/homepage.dart';
import 'package:trip_ease_project/Screens/home/maps.dart';
import 'package:trip_ease_project/utils/theme_provider.dart';
import '/Screens/Splash/splashscreen.dart';

main() async{
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(
            create: (_)=> ThemeProvider())],
        child: const MyApp(),)

  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: 'Trip Ease',
    debugShowCheckedModeBanner: false,
    theme: Provider.of<ThemeProvider>(context).themeData,
    home: Splash()
    );
    }
}
