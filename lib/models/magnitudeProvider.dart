import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:vector_math/vector_math_64.dart';

class MagnitudeProvider extends ChangeNotifier {
  double x = 0;
  double y = 0;
  double z = 0;
  double magnitude = 0;
  int time = 0;
  List<LiveData> values = [];

  Vector3 magnetometer = Vector3.zero();
  Vector3 _accelerator = Vector3.zero();
  Vector3 _absoluteOrientation2 = Vector3.zero();
  int? groupValue = 2;
  
  Timer? _timer;
  int _updateInterval=100;

  MagnitudeProvider() {
    changeValues();
  }

  changeValues() {
    magnetometerEventStream().listen((MagnetometerEvent event) {
      magnetometer.setValues(event.x, event.y, event.z);

      var matrix = getRotationMatrix(_accelerator, magnetometer);
      _absoluteOrientation2.setFrom(getOrientation(matrix));

      x = magnetometer.x;
      y = magnetometer.y;
      z = magnetometer.z;
      magnitude = sqrt((pow(magnetometer.x, 2)) + (pow(magnetometer.y, 2)) + (pow(magnetometer.z, 2)));
      values.add(LiveData(x, y, z, time++));
      if (values.length > 40) {
        values.removeAt(0);
      }
      notifyListeners();
    });
  }

  setUpdateInterval(int? groupValue, int interval) {
  _updateInterval = interval;
     this.groupValue = groupValue;
    print(this.groupValue);
    notifyListeners();
  }

  List<List<double>> getRotationMatrix(Vector3 acc, Vector3 mag) {
    return [
      [1.0, 0.0, 0.0],
      [0.0, 1.0, 0.0],
      [0.0, 0.0, 1.0]
    ];
  }

  Vector3 getOrientation(List<List<double>> matrix) {
    return Vector3(0.0, 0.0, 0.0);
  }
}

class LiveData {
  LiveData(this.x, this.y, this.z, this.time);
  final double x;
  final double y;
  final double z;
  final int time;
}
