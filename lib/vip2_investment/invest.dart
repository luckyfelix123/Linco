import 'package:flutter/material.dart';
import 'package:linco/investment/saving_transc_bottom.dart';
import 'package:linco/investment/saving_withdrawer.dart';
import 'package:linco/vip1%20members/vip1_homepage.dart';
import 'package:linco/vip2_investment/saving_withdrawer.dart';
import 'package:linco/vip2_members/vip2_homepage.dart';

import 'savings.dart';

class Investment2 extends StatefulWidget {
  const Investment2({Key key}) : super(key: key);

  @override
  _Investment2State createState() => _Investment2State();
}

class _Investment2State extends State<Investment2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(196, 151, 64, 1),
      body: Column(children: [
        SizedBox(
          height: 24,
        ),
        Container(
          height: 60,
          decoration: BoxDecoration(color: Colors.blue[100]),
          child: Row(
            children: [
              Text(
                '    INVEST TODAY IF YOU WANT TO CHILL WITH THE BIG BOYS',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Vip2HomePage()),
                );
              },
              child: Container(
                alignment: Alignment.center,
                width: 90,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    )),
                child: Text(
                  'Back',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              width: 160,
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    isDismissible: false,
                    enableDrag: false,
                    context: context,
                    builder: (context) {
                      return Container(
                        child: SavingBottom(),
                      );
                    });
              },
              child: Container(
                alignment: Alignment.center,
                width: 130,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    )),
                child: Text(
                  'Transactions',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            SizedBox(
              width: 5,
            ),
            Container(
              height: 170,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.green[200],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Your Savings',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Text(
                        'ACTIVE',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[500]),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'CURRENT BALANCE',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text('NGN 34,5566.76',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.green)),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'UE98373ddddd97',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
            height: 100,
            width: 400,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                color: Colors.white),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 40,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(98, 85, 106, 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Savings2();
                              });
                        },
                        child: Text(
                          'View details',
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return SavingWithdraw2();
                            });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(98, 85, 106, 1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            )),
                        child: Text(
                          '\$CASHOUT',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            )),
      ]),
    );
  }
}
