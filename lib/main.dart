import 'package:emfdetector/home.dart';
import 'package:emfdetector/models/magnitudeProvider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) :super(key:key);


  @override
  Widget build(BuildContext context) {

    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=>MagnitudeProvider())
    ],
    child:MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      
        brightness: Brightness.dark,
      ),
      home: Home(),
    ));
  }
}

