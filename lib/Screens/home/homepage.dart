import 'package:flutter/material.dart';
import 'package:trip_ease_project/Screens/settings/setting.dart';
import 'package:trip_ease_project/Screens/home/grid.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0;

  final tabs = [
    Home(),
    Maps(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trip Ease'),),
      drawer: Drawer(
        child: Scaffold(
          appBar: AppBar(

          ),
          body:Column(
              children:
          <Widget>[
            //settings
            ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
                onTap:  () async {
                  Navigator.pop;
                  await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Settings()),);

                }
            ),
          ]) ,
        ),
      ),

      body: tabs[_currentIndex],


      bottomNavigationBar:BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.white,
        backgroundColor: Colors.red,
        selectedIconTheme: const IconThemeData(size: 30,),
        items: [
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
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(17),
                      boxShadow: [BoxShadow(
                        color: Colors.black.withOpacity(.09),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(0,3),
                      )]),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(17)
                        ),
                        suffixIcon: Icon(Icons.search),
                        hintText: 'Search Destination',

                    ),
                  ),
                ),
              ),

              Padding(padding: EdgeInsets.all(0.0),
                child:Container(
                  child: Grid(),
                  height: 440,
                  color: Colors.black,
                ),)



            ],
          )),
    );
  }
}

class Maps extends StatelessWidget {
  const Maps ({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text('Maps is here')),
    );
  }
}