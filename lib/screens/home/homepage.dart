import 'package:flutter/material.dart';

import 'package:trip_ease_project/screens/settings/setting.dart';
import 'package:trip_ease_project/screens/home/grid.dart';
import 'package:trip_ease_project/screens/home/maps.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0;

  final tabs = [
    const Home(),
    const Maps(),
  ];

  String selectedItem = 'Settings';

  _dropDownItem(String value){
    setState(() {
      selectedItem = value;
      switch(selectedItem){
        case 'Settings':
      Navigator.push(context,
        MaterialPageRoute(builder: (context) => const Settings()),);
      break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trip Ease'),
        actions: <Widget>[
          PopupMenuButton<String>(
              onSelected: _dropDownItem,
              itemBuilder:(BuildContext context){
            return <PopupMenuEntry<String>>[
              const PopupMenuItem(value:'Settings',child: Text('Settings')),
            ];
          } )
        ],),

      // drawer: Drawer(
      //   child: Scaffold(
      //     body:Column(
      //         children:
      //     <Widget>[
      //       //settings
      //       ListTile(
      //           leading: Icon(Icons.settings),
      //           title: Text("Settings"),
      //           onTap:  () async {
      //             Navigator.pop(context);
      //             await Navigator.push(context,
      //             MaterialPageRoute(builder: (context) => Settings()),);
      //
      //
      //           }
      //       ),
      //     ]) ,
      //   ),
      // ),

      body: tabs[_currentIndex],


      bottomNavigationBar:BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: const IconThemeData(size: 30,),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
           ),

          BottomNavigationBarItem(
            icon: Icon(Icons.map_rounded),
            label: 'Maps',
            ),
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      )
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //SearchBar
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17)
                    ),
                    suffixIcon: const Icon(Icons.search),
                    hintText: 'Search Destination',

                ),
                  ),
              ),

              Padding(padding: const EdgeInsets.all(0.0),
                child:Container(
                  height: 440,
                  color: Colors.black,
                  child: const Grid(),
                ),)



            ],
          )),
    );
  }
}

