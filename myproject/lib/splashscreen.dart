import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myproject/language.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    super.initState();
    Timer(Duration(seconds: 2), (){
      Navigator.pushReplacement(
          context,
      MaterialPageRoute(
          builder: (context) => homepage(),
      ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Container(
            height: 150,
              width: 150,
              child: Image.asset('assets/images/1.webp'))
        ),
      ),
    );
  }
}
