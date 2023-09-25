import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
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
    super.initState();
    display();
}

List<String>images=[];


bool isLoading= true;

Future<void>display()async{
  var url = "https://trip-ease-c708e-default-rtdb.firebaseio.com/Destinations.json";
  try{
    final response=await http.get(Uri.parse(url));
    final data=json.decode(response.body) as Map<String, dynamic>;

    data.forEach((key, value) {
      images.add(value['image']);
    });
    setState(() {
      isLoading = false;
    });

  }catch(e){return;}
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isLoading?const CircularProgressIndicator():Center(
          child: GridView.builder(
    itemCount: images.length,
    itemBuilder: (context,index){
        return GridTile(child:Image(image: CachedNetworkImageProvider(images[index]),));
    }, gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,childAspectRatio:  1.5)
          ),
        ),
      ),
    );
  }
}
