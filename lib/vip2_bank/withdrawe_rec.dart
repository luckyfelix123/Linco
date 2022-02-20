import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WithdrawRec2 extends StatefulWidget {
  const WithdrawRec2({Key key}) : super(key: key);

  @override
  _WithdrawRec2State createState() => _WithdrawRec2State();
}

class _WithdrawRec2State extends State<WithdrawRec2> {
  final user = FirebaseAuth.instance;
  String cdate1 = DateFormat("EEEEE, dd, yyyy,").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Vip2 Withdrawer')
              .doc(user.currentUser.email)
              .collection('Awaiting Payment')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print('Erro:${snapshot.error}');
            }
            if (snapshot.hasData) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> fetch =
                        snapshot.data.docs[index].data();
                    return Column(
                      children: [
                        // SizedBox(height: 10,),
                        Container(
                          height: 90,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            //  borderRadius: BorderRadius.circular(15)
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
                                    // '2021-3484-494-48',
                                    cdate1,
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    // '93000',
                                    fetch['amount'],
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  SizedBox(
                                    width: 230,
                                  ),
                                  Text(
                                    // 'Pending',
                                    fetch['status'],
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.green[900],
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider()
                      ],
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ],
    );
  }
}
