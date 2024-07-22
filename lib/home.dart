import 'package:emfdetector/models/magnitudeProvider.dart';

import 'package:emfdetector/utils/colors.dart';
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
       backgroundColor: AppColors.primaryColor,
       body:Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
                    // mainReading(),
                    // XYZReading(),
                    // MeterReading(),
                    Container(
                      height:50,
                      width:200,
                      child:ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                            side: BorderSide(color: Colors.white)
                          )),
                          backgroundColor: MaterialStateProperty.all(AppColors.primaryColor)
                        ),
                        onPressed: (){
                          //Navigator.push(context,MaterialPageRoute(builder: (context)=>Visuals()));
                        }, child: Text("Visualize")
                        ),
                    ),
                    SizedBox(height:10 ),
                    Consumer<MagnitudeProvider>(
                      builder:(context,value,child)=>Container(
                         width: 200,
                         height: 50,
                         child: ElevatedButton(
                          style: ButtonStyle(
                            shape:MaterialStateProperty.all(
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
                                    side: const BorderSide(color: Colors.white),
                                  ),
                                  
                            ),
                              backgroundColor:MaterialStateProperty.all(AppColors.primaryColor)
                                
                          ),
                          onPressed: (){
                           // value.changeValues();
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