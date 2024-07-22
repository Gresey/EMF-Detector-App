import 'package:emfdetector/models/magnitudeProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class visuals extends StatefulWidget{
  const visuals({super.key});

  @override
  State<visuals> createState() => _visualsState();
}

class _visualsState extends State<visuals> {
  late ChartSeriesController _chartSeriesController;

  @override
  void initState(){
     super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(title: Text("Visuals"),),
      body: Container(
           child: SingleChildScrollView(
            child:Column(children: [
              Container(
                 margin: EdgeInsets.all(5),
                 child: Card(
                  color: Colors.grey.shade800,
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                    child:Consumer<MagnitudeProvider>(
                      builder:(context,value,child)=>
                      SfCartesianChart(
                        title:const ChartTitle(text: 'x,y,z with Time'),
                        legend:const Legend(isVisible: true,
                        title: LegendTitle(text: 'Legend'),),
                        series:<LineSeries<LiveData,int>> [
                          //x
                          LineSeries<LiveData, int>(
                              legendItemText:'x',
                          onRendererCreated:(ChartSeriesController controller){
                            _chartSeriesController=controller;
                          },
                          dataSource: value.values,color: Colors.red,
                           xValueMapper: (LiveData value1,_ )=>value1.time,
                            yValueMapper: (LiveData  value2, _) =>value2.x,
                          ),


                          //y
                          LineSeries<LiveData, int>(
                              legendItemText:'y',
                          onRendererCreated:(ChartSeriesController controller){
                            _chartSeriesController=controller;
                          },
                          dataSource: value.values,color: Colors.blue,
                           xValueMapper: (LiveData value1,_ )=>value1.time,
                            yValueMapper: (LiveData  value2, _) =>value2.y,
                          ),


                          //z
                          LineSeries<LiveData, int>(
                              legendItemText:'z',
                          onRendererCreated:(ChartSeriesController controller){
                            _chartSeriesController=controller;
                          },
                          dataSource: value.values,color: Colors.green,
                           xValueMapper: (LiveData value1,_ )=>value1.time,
                            yValueMapper: (LiveData  value2, _) =>value2.z,
                          ),
                        
                        ],
                        primaryXAxis: NumericAxis(
                          isVisible: true,
                          majorGridLines: const MajorGridLines(width: 0),
                          edgeLabelPlacement: EdgeLabelPlacement.shift,
                          interval: 3,
                          title: AxisTitle(text: 'Time(s)'),
                        ),
                        primaryYAxis: NumericAxis(
                          axisLine: const AxisLine(
                            width: 0
                          ),
                          majorTickLines: const MajorTickLines(size:0),
                          title: AxisTitle(text: 'uTesla'),
                        ),

                      )) ,
                      
                 ),
              ),
              
                      
            ],) ,),
      ),
    );
  }
}