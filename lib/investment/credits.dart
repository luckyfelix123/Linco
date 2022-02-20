import 'dart:convert';
import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Credits extends StatefulWidget {
  final String name;
  final String number;
  const Credits({Key key, this.name, this.number}) : super(key: key);

  @override
  _CreditsState createState() => _CreditsState();
}

class _CreditsState extends State<Credits> {
  final user = FirebaseAuth.instance;
  final DateTime currentPhoneDate = DateTime.now();
  String cdate1 = DateFormat("EEEEE, dd, yyyy,").format(DateTime.now());
  bool isSeen = false;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('Vip1 Invest')
          .doc(user.currentUser.email)
          .collection('Investment')
          .doc(user.currentUser.uid)
          .collection('From vip 1')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          Center (  
            child: Text('Erro:${snapshot.error}')
          );
        }
        if (snapshot.hasData) {
          return isSeen
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> fetch =
                        snapshot.data.docs[index].data();
                    return Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 90,
                          decoration: BoxDecoration(
                            color: Colors.grey[600],
                            //  borderRadius: BorderRadius.circular(15),
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
                                    '095848485884',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  SizedBox(
                                    width: 70,
                                  ),
                                  Text(
                                    cdate1,
                                    //  "\  ${fetch['date']}",
                                    style: TextStyle(fontSize: 17),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    fetch['Amount'],
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  SizedBox(
                                    width: 230,
                                  ),
                                  Text(
                                    fetch['Status'],
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.yellow[600]),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  })
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text('No transactions yet'),
                    )
                  ],
                );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: Color.fromRGBO(15, 51, 63, 4),
            ),
          );
        }
      },
    );
  }
}
