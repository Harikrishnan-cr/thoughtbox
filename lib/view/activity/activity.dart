import 'package:flutter/material.dart';

class ActivityScreen extends StatelessWidget {
  ActivityScreen({Key? key}) : super(key: key);
  int length = 5;

  @override
  Widget build(BuildContext context) {
    int c = 7; 
    return Scaffold(
        body: Center( 
          child: Column(  
      children: [
          Column(
            children: List.generate(length, (index) {
                
              return Text('*' * (index * 2 - 1),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),);
            }),
          ),
          Column(
            children: List.generate(length, (index) { 
              c = c - 2;

              return Text('*' * c,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30)); 
            }),
          ),
      ],
    ),
        ));
  }
}
