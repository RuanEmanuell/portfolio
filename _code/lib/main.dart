import 'package:flutter/material.dart';


import "screens/home.dart";


Future<void> main() async {
  runApp(MaterialApp(
    themeMode: ThemeMode.light,
    initialRoute:"/home",
    routes:{
      "/home":(context)=>HomeScreen()
    }
  ));
}

