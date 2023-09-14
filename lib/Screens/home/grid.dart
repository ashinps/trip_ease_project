import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class Grid extends StatefulWidget {
  const Grid({super.key});

  @override
  State<Grid> createState() => _GridState();
}

class _GridState extends State<Grid> {
  @override
  void initState(){
    display();
}

List<String>Images=[];


bool isLoading= true;

Future<void>display()async{
  var url = "https://flutterproject1-76fff-default-rtdb.firebaseio.com/"+"Destinations.json";
  try{
    final response=await http.get(Uri.parse(url));
    final data=json.decode(response.body) as Map<String, dynamic>;

    if(data == null){return;}
    data.forEach((key, value) {
      Images.add(value['image']);
    });
    setState(() {
      isLoading = false;
    });

  }catch(e){print('$e');};
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isLoading?const CircularProgressIndicator():Center(
          child: GridView.builder(
    itemCount: Images.length,
    itemBuilder: (context,index){
        return GridTile(child:Image(image: NetworkImage(Images[index]),));
    }, gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,childAspectRatio:  1.5)
          ),
        ),
      ),
    );
  }
}
