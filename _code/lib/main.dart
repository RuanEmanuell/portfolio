import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import "screens/home.dart";


Future<void> main() async {
  runApp(MaterialApp(
    initialRoute:"/home",
    routes:{
      "/home":(context)=>HomeScreen()
    }
   ) 
  );
}

