import 'package:emfdetector/models/magnitudeProvider.dart';
import 'package:emfdetector/pages/visuals.dart';

import 'package:emfdetector/utils/colors.dart';
import 'package:emfdetector/widgets/mainReading.dart';
import 'package:emfdetector/widgets/meterReading.dart';
import 'package:emfdetector/widgets/xyzReading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text("EMF Detector"),),
       backgroundColor: AppColors.primaryColor,
       body:Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
                    MainReading(),
                    XYZReading(),
                  MeterReading(),
                    Container(
                      height:50,
                      width:200,
                      child:ElevatedButton(
                        style: ButtonStyle(
                          shape: WidgetStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                            side: BorderSide(color: Colors.white),
                          )),
                          backgroundColor: WidgetStateProperty.all(AppColors.primaryColor)
                        ),
                        onPressed: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>visuals()));
                        }, child: Text("Visualize"),
                        ),
                    ),
                    SizedBox(height:10 ),
                    Consumer<MagnitudeProvider>(
                      builder:(context,value,child)=>Container(
                         width: 200,
                         height: 50,
                         child: ElevatedButton(
                          style: ButtonStyle(
                            shape:WidgetStateProperty.all(
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
                                    side: const BorderSide(color: Colors.white),
                                  ),
                                  
                            ),
                              backgroundColor:WidgetStateProperty.all(AppColors.primaryColor)
                                
                          ),
                          onPressed: (){
                            value.changeValues();
                          }, child: Text("Start"),
                         ),
                      )
                    )

 
          ],
          ),
          ))
    );
  }
}