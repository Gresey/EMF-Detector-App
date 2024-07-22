import 'package:emfdetector/models/magnitudeProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class MainReading extends StatefulWidget{
  const MainReading({super.key});

  @override
  State<MainReading> createState() => _MainReadingState();
}

class _MainReadingState extends State<MainReading> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20),
          Consumer<MagnitudeProvider>(builder:
          (context,value,child)=>Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            
            children: [
              Container(
                width: MediaQuery.of(context).size.width/2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text(value.magnitude.toStringAsFixed(2),
                  style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),
                  )],
                ),

              ),
              Container(
               width: MediaQuery.of(context).size.width/2,
               child: Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [Text("uTesla",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
                ],),
              )
            ],) )

       
      ],
    );
  }
}