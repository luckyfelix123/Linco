import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Debits2 extends StatefulWidget {
  const Debits2({Key key}) : super(key: key);

  @override
  _Debits2State createState() => _Debits2State();
}

class _Debits2State extends State<Debits2> {
  final user = FirebaseAuth.instance;
  String cdate1 = DateFormat("EEEEE, dd, yyyy,").format(DateTime.now());
bool isSeen=  false;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:    FirebaseFirestore.instance
          .collection('Vip2 Invest Withdrawer')
          .doc(user.currentUser.email)
          .collection('Awaiting Investment Payment').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('Erro:${snapshot.error}');
        }
        if (snapshot.hasData) {
          return isSeen? ListView.builder(
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
              }):
               Center(  
               child: Text('No transactions yet'),
             );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
