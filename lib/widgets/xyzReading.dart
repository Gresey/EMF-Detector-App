import 'package:emfdetector/models/magnitudeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'textWidget.dart';

class XYZReading extends StatefulWidget{
  const XYZReading({super.key});

  @override
  State<XYZReading> createState() => _XYZReadingState();
}

class _XYZReadingState extends State<XYZReading> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10,),
        Text("Update Intervals"),
        Consumer<MagnitudeProvider>(builder: (context,value,child)=>Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Radio(value: 1, groupValue: value.groupValue, 
            onChanged:(dynamic value)=>value.setUpdateInterval(
              1,Duration.microsecondsPerSecond ~/ 1),
            ),
            Text("1 FPS"),
            Radio(value: 2, groupValue: value.groupValue,
             onChanged: (dynamic value)=>value.setUpdateInterval(
              2,Duration.microsecondsPerSecond ~/ 30),
            ),
            Text("30 FPS"),
            Radio(value: 3, groupValue: value.groupValue, 
            onChanged: (dynamic value)=>value.setUpdateInterval(
              3,Duration.microsecondsPerSecond ~/ 60),
            ),
            Text("60 FPS"),
          ],
        )),
        SizedBox(height: 20,),
        Consumer<MagnitudeProvider>(builder: (context,value,child)=>Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            textWidget('x:${value.x.toStringAsFixed(2)}'),
            
            textWidget('y:${value.y.toStringAsFixed(2)}'),
          
            textWidget('z:${value.z.toStringAsFixed(2)}'),
          ],
        ))

      ],
    );
  }
}