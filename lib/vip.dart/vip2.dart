import 'package:flutter/material.dart';
import 'package:linco/flutter%20wave.dart';
import 'package:linco/vip2account_creating/flutterwave.dart';
import 'package:linco/vip2account_creating/signup.dart';

class Vip2 extends StatelessWidget {
  const Vip2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
         showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Migration to vip 2'),
                content: Text(
                  'You are about paying NGN 34,000',
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
                            builder: (_) => Vip2Signup(),
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
                  'VIP 2',
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
                  'Task:20 daily',
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
                  width: 140,
                ),
                Text(
                  'NGN 34,000',
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
