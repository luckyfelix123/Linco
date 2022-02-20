import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Recharge2 extends StatefulWidget {
  final String name;
  final String number;
  const Recharge2({Key key, this.name, this.number}) : super(key: key);

  @override
  _Recharge2State createState() => _Recharge2State();
}

class _Recharge2State extends State<Recharge2> {
  final user =FirebaseAuth.instance;
      final DateTime currentPhoneDate = DateTime.now();
    String cdate1 = DateFormat("EEEEE, dd, yyyy,").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return  
    Column(
      children: [
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
                 .collection('Vip2 recharcge')
                            .doc('EXPLIT')
                            .collection('Deposit')
                            .doc(user.currentUser.email)
                            .collection('From vip2 user')
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
                    return 

Column(
      children: [
        SizedBox(height: 20,),
        Container(
          height: 90,
          decoration: BoxDecoration(
              color: Colors.grey[600],
              //  borderRadius: BorderRadius.circular(15),
               ),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(width: 20,),
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
                   fetch['amount'],
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(
                    width: 230,
                  ),
                  Text(
                    fetch['status'],
                    style: TextStyle(fontSize: 17,color: Colors.yellow[600]),
                  )
                ],
              ),

            ],
          ),
        )
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

