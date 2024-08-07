import 'package:emfdetector/models/magnitudeProvider.dart';
import 'package:emfdetector/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class MeterReading extends StatefulWidget {
  @override
  State<MeterReading> createState() => MeterReadingState();
}

class MeterReadingState extends State<MeterReading> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20,),
        Consumer<MagnitudeProvider>(
          builder: (context, value, child) => SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(
                minimum: 0,
                maximum: 1000,
                labelOffset: 20,
                tickOffset: 20,
                ranges: <GaugeRange>[
                  GaugeRange(
                    startValue: 0,
                    endValue: 200,
                    color: AppColors.green,
                    label: 'SAFE',
                    startWidth: 25,
                    endWidth: 25,
                    labelStyle: GaugeTextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GaugeRange(
                    startValue: 200,
                    endValue: 500,
                    color: AppColors.orange,
                    label: 'MODERATE',
                    startWidth: 25,
                    endWidth: 25,
                    labelStyle: GaugeTextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GaugeRange(
                    startValue: 500,
                    endValue: 1000,
                    color: AppColors.red,
                    label: 'DANGER',
                    startWidth: 25,
                    endWidth: 25,
                    labelStyle: GaugeTextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
                pointers: <GaugePointer>[
                  NeedlePointer(
                    value: value.magnitude, // Dynamic value for the needle
                    needleLength: 0.8, // Adjust the length as needed
                    needleColor: Colors.red, // Customize the needle color
                    knobStyle: KnobStyle(
                      color: Colors.red, // Customize the knob color
                      borderColor: Colors.black, // Customize the knob border color
                      borderWidth: 2, // Customize the knob border width
                    ),
                  ),
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                    angle: 90,
                    positionFactor: 0.5,
                    widget: Container(
                      child: Text(
                        value.magnitude.toStringAsFixed(2),
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
