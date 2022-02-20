import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:linco/tasklist/auto.dart';
import 'package:linco/test.dart';
import 'package:linco/vip.dart/vip.dart';
import 'package:linco/vip1_bank/account.dart';
import 'package:linco/vip1_bank/recharge_container.dart';
import 'package:linco/vip1_bank/settings.dart';
import 'package:url_launcher/url_launcher.dart';

class Vip1SubHomes extends StatefulWidget {
  String randomNumber;
  String counterstatus;
  String TaskRecordRoomId;
  String tst;
  Vip1SubHomes({Key key, this.randomNumber, this.tst, this.counterstatus})
      : super(key: key);

  @override
  _Vip1SubHomesState createState() => _Vip1SubHomesState();
}

class _Vip1SubHomesState extends State<Vip1SubHomes> {
  int counter = 0;
  bool isTap = false;
  bool isfloat = false;
  bool isSeen = false;
  String randomNumber = 'x';
  CollectionReference ref = FirebaseFirestore.instance.collection('Task');
  final email = FirebaseAuth.instance;
  final price = 850;
  double sizeNumber = 40.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Row(
        children: [
          SizedBox(
            width: 355,
          ),
          isfloat
              ? FloatingActionButton(
                  backgroundColor: Color.fromRGBO(15, 51, 63, 4),
                  child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2HCH_1pg6bN6LVBWPOCrCYKCJ1Pt2Bbe0vIgPdLbyb6p80v8AodPq4C-NC8vPEK85vWc&usqp=CAU')),
                  onPressed: () {
                    launch(
                        'https://api.whatsapp.com/send?phone=%2B18137040768&text&app_absent=0');
                  },
                )
              : FloatingActionButton(
                  backgroundColor: Color.fromRGBO(15, 51, 63, 4),
                  child: Icon(
                    Icons.message,
                    size: 35,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _Float();
                  },
                ),
        ],
      ),
      // backgroundColor: Colors.black26,
      backgroundColor: Color.fromRGBO(98, 85, 106, 1),
      body: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                color: Color.fromRGBO(15, 51, 63, 4),
                // borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    isTap
                        ? GestureDetector(
                            onTap: () {
                              _ReTap();
                            },
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQB-TAAnJv1_IwjZT0s9comdMsmNqiR8Xps4g&usqp=CAU'),
                              radius: 40,
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              _Tap();
                            },
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSc15lMeGOW8Hd5ybYSVNg2b_PKAeLUtDGHEQ&usqp=CAU'),
                              radius: 40,
                            ),
                          ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'VIP 1                           ',
                      // email.currentUser.email.trim(),
                      style: TextStyle(fontSize: 23),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AccountInfo(),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.settings,
                        size: 30,
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 5,
                  ),
                  Row(children: [
                    SizedBox(
                      width: 10,
                    ),
                    isTap
                        ? GestureDetector(
                            onTap: () {
                              _ReTap();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 30,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                ' Change',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              _Tap();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 30,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                ' Change',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                            ),
                          )
                  ]),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 70,
                    width: 390,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '0.00',

                          //   "\$${bal['total']}",
                          style: TextStyle(fontSize: 19),
                        ),
                        SizedBox(
                          width: 240,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RechargeContainer(),
                              ),
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 35,
                            width: 70,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(143, 50, 49, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            child: Text(
                              'Wallets',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 40,
              width: 390,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Account();
                          });
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.center_focus_strong,
                        size: 40,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTm4BabRScqSXjQFPblbqjFOX315hzQk5Dj_g&usqp=CAU'),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIQFPnw4FIj9nN9qu-ljQiZkFY51AHmmAhEw&usqp=CAU'),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Row(children: [
              SizedBox(
                width: 10,
              ),
              Text(
                'Expected',
                style: TextStyle(fontSize: 17, color: Colors.black87),
              ),
              SizedBox(
                width: 60,
              ),
              Text(
                "Today's",
                style: TextStyle(fontSize: 17, color: Colors.black87),
              ),
              SizedBox(
                width: 93,
              ),
              Text(
                'Currently',
                style: TextStyle(fontSize: 17, color: Colors.black87),
              ),
              // SizedBox(
              //   width: 70,
              // ),
            ]),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text('next',
                    style: TextStyle(fontSize: 17, color: Colors.black87)),
                SizedBox(
                  width: 60,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Expectation',
                      style: TextStyle(fontSize: 17, color: Colors.black87),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(children: [
              SizedBox(
                width: 5,
              ),
              Text(
                  // '0.00',
                  //  "\$${bal['total']}",

                  '    0.00',
                  style: TextStyle(fontSize: 19, color: Colors.black87)),
              SizedBox(
                width: 70,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '0.00',
                    style: TextStyle(fontSize: 19, color: Colors.black87),
                  ),
                  SizedBox(
                    width: 120,
                  ),
                  Text(
                    '0.00',
                    style: TextStyle(fontSize: 19, color: Colors.black87),
                  ),
                ],
              ),
            ]),
            SizedBox(
              height: 20,
            ),
            Row(children: [
              SizedBox(
                width: 10,
              ),
              Text(
                "This week's",
                style: TextStyle(fontSize: 17, color: Colors.black87),
              ),
              SizedBox(
                width: 40,
              ),
              Text(
                "This month's",
                style: TextStyle(fontSize: 17, color: Colors.black87),
              ),
              SizedBox(
                width: 33,
              ),
              Text(
                'Remaining ',
                style: TextStyle(fontSize: 17, color: Colors.black87),
              ),
              // SizedBox(
              //   width: 70,
              // ),
            ]),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text('Expectations',
                    style: TextStyle(fontSize: 17, color: Colors.black87)),
                SizedBox(
                  width: 30,
                ),
                Row(
                  children: [
                    Text(
                      'Expectations',
                      style: TextStyle(fontSize: 17, color: Colors.black87),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      'Task',
                      style: TextStyle(fontSize: 17, color: Colors.black87),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(children: [
              SizedBox(
                width: 10,
              ),
              Text('   0.00',
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.black87,
                  )),
              SizedBox(
                width: 70,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    '0.00',
                    style: TextStyle(fontSize: 19, color: Colors.black87),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  Text(
                    '0',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 21,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ]),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'Completed ',
                  style: TextStyle(fontSize: 17, color: Colors.black87),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  '0',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (_) => MyApps(),
                    //   ),
                    // );
                  },
                  child: CircleAvatar(
                    backgroundColor: Color.fromRGBO(98, 85, 106, 1),
                    backgroundImage: AssetImage(
                      'asset/credit.jpeg',
                    ),
                    // child: Icon(Icons.),
                    radius: 17,
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Vip()),
                    );
                  },
                  child: CircleAvatar(
                    backgroundColor: Color.fromRGBO(98, 85, 106, 1),
                    backgroundImage: AssetImage('asset/im.jpeg'),
                    radius: 17,
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                              backgroundColor: Colors.blue,
                              content: Container(
                                  height: 70,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {},
                                            child: Text(
                                                'rihfkvkbvbmnbvjbvjkcvckjvv'),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Icon(Icons.copy)
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          'Click',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.yellow),
                                        ),
                                      )
                                    ],
                                  )));
                        });
                  },
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                      'asset/in.png',
                    ),
                    radius: 20,
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.help_center,
                    size: 37,
                    color: Colors.red,
                  ),
                  // child: Icon(Icons.),                                      radius: 20,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                Row(
                  children: [
                    // SizedBox(
                    //   width: 10,
                    // ),
                    Text(
                      'Credit',
                      style: TextStyle(fontSize: 15, color: Colors.black87),
                    ),
                    SizedBox(
                      width: 45,
                    ),
                    Row(
                      children: [
                        Text(
                          'Vip',
                          style: TextStyle(fontSize: 17, color: Colors.black87),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Invite',
                          style: TextStyle(fontSize: 15, color: Colors.black87),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Helper',
                          style: TextStyle(fontSize: 15, color: Colors.black87),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'centres',
                      style: TextStyle(fontSize: 15, color: Colors.black87),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                  ],
                ),
                SizedBox(
                  width: 140,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'book',
                      style: TextStyle(fontSize: 15, color: Colors.black87),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  _Tap() async {
    if (isTap) return;
    setState(() => isTap = true);
    {}
  }

  _ReTap() async {
    if (isTap = false) return;
    setState(() => isTap = false);
    {}
  }

  _Float() async {
    if (isfloat) return;
    setState(() => isfloat = true);
    {}
  }
}
