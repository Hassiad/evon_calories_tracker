import 'dart:async';

import 'package:evon_calories_tracker/utils/constants.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // implement initState
    super.initState();
    // Timer(duration, callback)
    Timer(const Duration(milliseconds: 4000), () async {
      Navigator.pushReplacementNamed(context, LOGIN_ROUTE);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff423869),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/evon_calories_tracker.jpg',
                height: 100, width: 200, fit: BoxFit.fitWidth),
            SizedBox(height: 16.0),
            Center(child: CircularProgressIndicator(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
