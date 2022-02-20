import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linco/tasklist/auto.dart';
import 'package:linco/test.dart';
import 'package:linco/vip.dart/vip.dart';

import 'image_autoslider.dart';

class Vip1Homes extends StatefulWidget {
  String randomNumber;
  String counterstatus;
  String TaskRecordRoomId;
  String tst;
  Vip1Homes({Key key, this.randomNumber, this.tst, this.counterstatus})
      : super(key: key);

  @override
  _HomesState createState() => _HomesState();
}

class _HomesState extends State<Vip1Homes> {
  int counter = 0;
  bool isTap = false;

  String randomNumber = 'x';
  CollectionReference ref = FirebaseFirestore.instance.collection('Task');
  final email = FirebaseAuth.instance;
  final price = 850;
  double sizeNumber = 40.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black26,
        // backgroundColor: Color.fromRGBO(15, 51, 63, 4),
        body: Container(
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('audition')
                      .doc(email.currentUser.email)
                      .collection('awaiting aproval')
                      .limit(1)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Erro while loading'),
                      );
                    }
                    if (snapshot.hasData) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (context, index) {
                            Map<String, dynamic> bal =
                                snapshot.data.docs.first.data();
                            return Column(
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
                                      Row(
                                        children: [
                                          isTap
                                              ? GestureDetector(
                                                  onTap: () {
                                                    _ReTap();
                                                  },
                                                  child: CircleAvatar(
                                                    backgroundImage: NetworkImage(
                                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDjJ7C5DlPqIatYG2mgnPMMZ7TaFujUp9fFw&usqp=CAU'),
                                                    radius: 40,
                                                  ),
                                                )
                                              : GestureDetector(
                                                  onTap: () {
                                                    _Tap();
                                                  },
                                                  child: CircleAvatar(
                                                    backgroundImage: NetworkImage(
                                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzDnSOrDNV-3o4uk40lo3ljBRpGpZJi16RDA&usqp=CAU'),
                                                    radius: 40,
                                                  ),
                                                ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            email.currentUser.email,
                                            style: TextStyle(fontSize: 17),
                                          ),
                                          SizedBox(
                                            width: 100,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      backgroundColor:
                                                          Colors.blueGrey,
                                                      actions: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        Vip(),
                                                              ),
                                                            );
                                                          },
                                                          child: Text(
                                                            'Migrate',
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .yellow),
                                                          ),
                                                        )
                                                      ],
                                                      content: Container(
                                                        width: 300,
                                                        height: 30,
                                                        decoration: BoxDecoration(
                                                            color: Colors.teal,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        14)),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons.lock,
                                                              color: Colors
                                                                  .red[800],
                                                            ),
                                                            SizedBox(width: 5),
                                                            Text(
                                                                "Migrate to unlock this feature")
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  });
                                            },
                                            child: Icon(
                                              Icons.settings,
                                              size: 30,
                                            ),
                                          ),
                                        ],
                                      ),
                                      // Row(children: [
                                      //   SizedBox(
                                      //     width: 50,
                                      //   ),
                                      //   Text('Balance(NGN)')
                                      // ]),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Container(
                                          height: 70,
                                          width: 370,
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
                                                "\$${bal['total']}",
                                                style: TextStyle(fontSize: 17),
                                              ),
                                              SizedBox(
                                                width: 250,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                    showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      backgroundColor:
                                                          Colors.blueGrey,
                                                      actions: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            Navigator.push(context, MaterialPageRoute(builder: (context) => Vip(),),);
                                                          },
                                                          child: Text(
                                                            'Migrate',
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .yellow),
                                                          ),
                                                        )
                                                      ],
                                                      content: Container(
                                                        width: 300,
                                                        height: 30,
                                                        decoration: BoxDecoration(
                                                            color: Colors.teal,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        14)),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons.lock,
                                                              color: Colors
                                                                  .red[800],
                                                            ),
                                                            SizedBox(width: 5),
                                                            Text(
                                                                "Migrate to unlock this feature")
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  });
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  height: 35,
                                                  width: 70,
                                                  decoration: BoxDecoration(
                                                      color: Color.fromRGBO(
                                                          143, 50, 49, 1),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  12))),
                                                  child: Text(
                                                    'Wallet',
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              )
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  width: 370,
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
                                          // showModalBottomSheet(
                                          //     context: context,
                                          //     builder: (context) {
                                          //       return Account();
                                          //     });

                                            showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      backgroundColor:
                                                          Colors.blueGrey,
                                                      actions: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            Navigator.push(context, MaterialPageRoute(builder: (context) => Vip(),),);
                                                          },
                                                          child: Text(
                                                            'Migrate',
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .yellow),
                                                          ),
                                                        )
                                                      ],
                                                      content: Container(
                                                        width: 300,
                                                        height: 30,
                                                        decoration: BoxDecoration(
                                                            color: Colors.teal,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        14)),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons.lock,
                                                              color: Colors
                                                                  .red[800],
                                                            ),
                                                            SizedBox(width: 5),
                                                            Text(
                                                                "Migrate to unlock this feature")
                                                          ],
                                                        ),
                                                      ),
                                                    );
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
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white70),
                                  ),
                                  SizedBox(
                                    width: 60,
                                  ),
                                  Text(
                                    "Today's",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white70),
                                  ),
                                  SizedBox(
                                    width: 93,
                                  ),
                                  Text(
                                    'Currently',
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white70),
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
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.white70)),
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
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.white70),
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

                                      "\ ${bal['test']}",
                                      style: TextStyle(
                                          fontSize: 19, color: Colors.white70)),
                                  SizedBox(
                                    width: 70,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "\ ${bal['today']}",
                                        style: TextStyle(
                                            fontSize: 19,
                                            color: Colors.white70),
                                      ),
                                      SizedBox(
                                        width: 120,
                                      ),
                                      Text(
                                        // '0.00',
                                        "\ ${bal['amount']}",
                                        style: TextStyle(
                                            fontSize: 19,
                                            color: Colors.white70),
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
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white70),
                                  ),
                                  SizedBox(
                                    width: 70,
                                  ),
                                  Text(
                                    "This month's",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white70),
                                  ),
                                  SizedBox(
                                    width: 33,
                                  ),
                                  Text(
                                    'Remaining ',
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white70),
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
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.white70)),
                                    SizedBox(
                                      width: 60,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Expectations',
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.white70),
                                        ),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        Text(
                                          'Task',
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.white70),
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
                                  Text(
                                      // '0.00',
                                      "\ ${bal['week']}",
                                      style: TextStyle(
                                          fontSize: 19, color: Colors.white70)),
                                  SizedBox(
                                    width: 70,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 40,
                                      ),
                                      Text(
                                        "\ ${bal['month']}",
                                        style: TextStyle(
                                            fontSize: 19,
                                            color: Colors.white70),
                                      ),
                                      SizedBox(
                                        width: 100,
                                      ),
                                      Text(
                                        "\ ${bal['dec']}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 21, color: Colors.white),
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
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.white70),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "\ ${bal['inc']}",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white70),
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
                                    CircleAvatar(
                                      radius: 17,
                                      backgroundColor: Colors.grey[400],
                                      backgroundImage: AssetImage(
                                        'asset/search.png',
                                      ),
                                      // child: Icon(Icons.),                                      radius: 20,
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => Table(),
                                          ),
                                        );
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: Colors.grey,
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
                                          MaterialPageRoute(
                                              builder: (_) => Vip()),
                                        );
                                      },
                                      child: CircleAvatar(
                                        backgroundImage:
                                            AssetImage('asset/im.jpeg'),
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
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .yellow),
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
                                    Text('Promotion ',
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black87)),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Row(
                                      children: [
                                        // SizedBox(
                                        //   width: 10,
                                        // ),
                                        Text(
                                          'Credit',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black87),
                                        ),
                                        SizedBox(
                                          width: 45,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Vip',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.black87),
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
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black87),
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
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black87),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 80,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          'centres',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black87),
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
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black87),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            );
                          });
                    } else {
                      return Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Loading...'),
                            CupertinoActivityIndicator()
                          ],
                        ),
                      );
                    }
                  }),
            ],
          ),
        ));
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
}
