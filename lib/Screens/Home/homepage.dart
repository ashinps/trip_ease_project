import 'package:trip_ease_project/Screens/settings/setting.dart';
import 'package:flutter/material.dart';
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),),

      drawer: const Drawer(child: Settings()),

      body: const Center(
        child: Text('Welcome!'),
      ),
    );
  }
}
