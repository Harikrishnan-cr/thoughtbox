


import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:datas/view/login%20screen/login_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';




class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        canvasColor: const Color.fromARGB(155, 166, 210, 246)
      ),
        title: 'Clean Code',
        home: AnimatedSplashScreen(
            duration: 3000,
            splash: Icons.home,
            nextScreen:LoginScreen(), 
            splashTransition: SplashTransition.fadeTransition,
          
            backgroundColor: Colors.blue));
  }
}

