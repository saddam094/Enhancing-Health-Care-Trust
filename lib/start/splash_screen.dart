import 'dart:async';

import 'package:enhancing_healthcare_trust/start/home_page.dart';
import 'package:enhancing_healthcare_trust/start/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const String KEYLOGIN = "Login";

  bool isFirst = true;
  int count = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WhereToGo();
  }

  void reload(){
    setState(() {
      if(isFirst){
        isFirst = false;
      }else{
        isFirst = true;
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
          AnimatedCrossFade(
          firstChild: Container(
            width: Get.width*1,
            height:  Get.height*1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.lightBlueAccent, Colors.greenAccent],
                begin: Alignment.topCenter,
              )
            ),
          ),
          secondChild: Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.red, Colors.purpleAccent],
                begin: Alignment.topCenter,
              ),
            ),
          ),
          crossFadeState: isFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: Duration(seconds: 2)
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Enhancing', style: TextStyle(fontSize: 35, fontWeight: FontWeight.w800, color: Colors.white)),
                Text('HealthCare & Trust', style: TextStyle(fontSize: 35, fontWeight: FontWeight.w800, color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void WhereToGo() async{
    var pref = await SharedPreferences.getInstance();
    var isLoggedIn = pref.getBool(KEYLOGIN);

    Timer mytimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if(count == 2){
        if(isLoggedIn != null){
          if(isLoggedIn){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
          }else{
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
          }
        }else{
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
        }
      }else{
        count++;
        reload();
      }

    });

  }
}


