import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'dart:math';
import 'package:intl/intl.dart';

class Vip1Audition extends StatefulWidget {
  const Vip1Audition({Key key}) : super(key: key);

  @override
  State<Vip1Audition> createState() => _Vip1AuditionState();
}

class _Vip1AuditionState extends State<Vip1Audition> {
  String _timeString;

  String cdate1 = DateFormat("EEEEE, dd, yyyy,").format(DateTime.now());

  final DateTime currentPhoneDate = DateTime.now();

  String randomNumber = 'x';
  final email = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(9, 56, 53, 1),
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Vip1 audition')
                .doc(email.currentUser.email)
                .collection('awaiting aproval').limit(5)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.data != null) {
                return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> map =
                          snapshot.data.docs[index].data();
                      return Column(
                        children: [
                          Container(
                              height: 130,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                color: Color.fromRGBO(15, 51, 63, 4),
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
                                      CircleAvatar(
                                        backgroundImage:
                                            NetworkImage(map['leading']),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        width: 150,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 60,
                                      ),
                                      Text(
                                        // "\$${map['amount']}",
                                        map['price'],

                                        // map['amount'],
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.orange[800]),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 60,
                                      ),
                                      Text(
                                        cdate1,
                                        // // map['created'],
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.white54),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 60,
                                      ),
                                      Text(
                                        map['status'], // // map['created'],
                                        style: TextStyle(
                                            fontSize: 17, color: Colors.orange),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                    ],
                                  )
                                ],
                              )),
                          SizedBox(
                            height: 5,
                          ),
//
                        ],
                      );

//
                    });
              } else {
                return Container();
              }
            }));
  }
}
