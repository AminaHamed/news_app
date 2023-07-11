import 'dart:async';

import 'package:flutter/material.dart';

import 'home_view/home_view.dart';
class SplashScreen extends StatefulWidget {
static const String routeName='SplashScreen';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed(HomeView.routeName);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: Image.asset('assets/images/pattern.png'
            ,fit: BoxFit.fill,),
        ),
        Scaffold(

          backgroundColor: Colors.transparent,
          body: Center(child: Image.asset('assets/images/logo.png')
          ),
        )
      ],
    );
  }
}
