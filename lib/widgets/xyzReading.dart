import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:emfdetector/models/magnitudeProvider.dart';
import 'textWidget.dart';

class XYZReading extends StatefulWidget {
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
        const Text("Update Intervals"),
        Consumer<MagnitudeProvider>(
          builder: (context, magnitudeProvider, child) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Radio(
                value: 2,
                groupValue: magnitudeProvider.groupValue,
                onChanged: (int? newValue) {
                  magnitudeProvider.setUpdateInterval(2, Duration.microsecondsPerSecond ~/ 30);
                },
              ),
              const Text("30 FPS"),
             
            ],
          ),
        ),
        const SizedBox(height: 20,),
        Consumer<MagnitudeProvider>(
          builder: (context, value, child) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              textWidget('x:${value.x.toStringAsFixed(2)}'),
              const SizedBox(width: 15,),
              textWidget('y:${value.y.toStringAsFixed(2)}'),
              const SizedBox(width: 15,),
              textWidget('z:${value.z.toStringAsFixed(2)}'),
            ],
          ),
        ),
      ],
    );
  }
}
