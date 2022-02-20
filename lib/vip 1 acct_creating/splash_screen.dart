import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linco/tests.dart';
import 'package:linco/vip%201%20acct_creating/signup.dart';
import 'package:linco/vip1%20members/vip1_homepage.dart';

class Vip1SplashScreen extends StatefulWidget {
  Map<String, dynamic> data;
  String number;
  String username;
  String name;
  Vip1SplashScreen({
    Key key,this.name,this.number,this.username
    
  }) : super(key: key,);

  @override
  State<Vip1SplashScreen> createState() => _Vip1SplashScreenState();
}

class _Vip1SplashScreenState extends State<Vip1SplashScreen> {

  bool isSeen = false;


  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () async {
       
      if ( 
       FirebaseAuth.instance.currentUser == null)
          {
        ///navigate to auth page
       if (mounted)
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => Vip1Signup(),
              ),
              (route) => false);
      } else {
        if (mounted)
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Vip1HomePage()),
              (route) => false);
      }
    });
    return   Scaffold(  
      backgroundColor: Colors.grey[400],
      body: Center(  
      child: Container(   
        child: Image(  
          image: NetworkImage('https://i.gifer.com/3pJd.gif'),
        ),
      )
    ),
    );
    

  }
}
