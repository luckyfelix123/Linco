import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linco/tests.dart';
import 'package:linco/vip%201%20acct_creating/signup.dart';
import 'package:linco/vip1%20members/vip1_homepage.dart';
import 'package:linco/vip2_members/vip2_homepage.dart';
import 'package:linco/vip2account_creating/signup.dart';

class Vip2SplashScreen extends StatefulWidget {
  Map<String, dynamic> data;
  String number;
  String username;
  String name;
  Vip2SplashScreen({
    Key key,this.name,this.number,this.username
    
  }) : super(key: key,);

  @override
  State<Vip2SplashScreen> createState() => _Vip2SplashScreenState();
}

class _Vip2SplashScreenState extends State<Vip2SplashScreen> {

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
                builder: (context) => Vip2Signup(),
              ),
              (route) => false);
      } else {
        if (mounted)
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Vip2HomePage()),
              (route) => false);
      }
    });
    return   Scaffold(  
      backgroundColor: Colors.grey[400],
      body: Center(  
      child: Container(   
        child: Image(  
          image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSV3s8CLXQO6vizujBSE0mIPJUxIt9Hd8KRJw&usqp=CAU'),
        ),
      )
    ),
    );
    

  }
}
