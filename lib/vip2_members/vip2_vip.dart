import 'package:flutter/material.dart';
import 'package:linco/tests.dart';
import 'package:linco/vip.dart/intend.dart';
import 'package:linco/vip.dart/vip1.dart';
import 'package:linco/vip.dart/vip2.dart';
import 'package:linco/vip.dart/vip3.dart';
import 'package:linco/vip.dart/vip4.dart';
import 'package:linco/vip.dart/vip5.dart';
import 'package:linco/vip.dart/vip6.dart';
import 'package:linco/vip.dart/vip7.dart';
import 'package:linco/vip.dart/vip8.dart';

import '../home.dart';

class Vip2Vip extends StatelessWidget {
  const Vip2Vip({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor:  Color.fromRGBO(143, 50, 49,1),
      backgroundColor: Colors.cyan[900],

      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyHomePage(),
                            ),
                          );
                        },
                        child: Icon(Icons.arrow_back_ios))
                  ],
                ),
                SizedBox(
                  height: 70,
                ),
                Text(
                  'VIP LEVELS',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('asset/vip.jpeg'),
                  radius: 60,
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
          
            Vip2(),
            SizedBox(
              height: 10,
            ),
            Vip3(),
            SizedBox(
              height: 10,
            ),
            Vip4(),
            SizedBox(
              height: 10,
            ),
            Vip5(),
            SizedBox(
              height: 10,
            ),
            Vip6(),
            SizedBox(
              height: 10,
            ),
            Vip7(),
            SizedBox(
              height: 10,
            ),
            Vip8()
          ],
        ),
      ),
    );
  }
}
