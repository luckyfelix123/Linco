import 'package:flutter/material.dart';
import 'package:flutterwave/core/flutterwave.dart';
import 'package:linco/paystack/paystack.dart';
import 'package:linco/vip%201%20acct_creating/splash_screen.dart';
import 'package:linco/vip1%20members/vip1_homepage.dart';

import '../flutter wave.dart';

class Vip1 extends StatelessWidget {
  bool isStretched = false;

  Vip1({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(builder: (_)=> Vip1SplashScreen(),),);

        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Migration to vip 1'),
                content: Text(
                  'You are about paying NGN 17,000',
                  style: TextStyle(fontSize: 17),
                ),
                actions: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(width: 130),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => FlutterWavePayment(),
                          ),
                        );
                      },
                      child: Text(
                        'Continue',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                ],
//  Container(
//   alignment: Alignment.center,
//   width: 40,
//   height: 50,
//   decoration: BoxDecoration(
//     color: Colors.blue,
//     borderRadius: BorderRadius.all(Radius.circular(12))
//   ),
//   child: Text('Proceed'),
// )
              );
            });
      },
      child: Container(
        width: w,
        height: 100,
        decoration: BoxDecoration(
          color: Color.fromRGBO(48, 2, 15, 1),
          borderRadius: BorderRadius.all(
            Radius.circular(1),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  'VIP 1',
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(201, 194, 202, 1)),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Task:10 daily',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(174, 169, 182, 1)),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 10,
                ),
                Text(
                  'NGN85 per task',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(174, 169, 182, 1)),
                ),
                SizedBox(
                  width: 150,
                ),
                Text(
                  'NGN 17,000',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(211, 120, 24, 1),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
