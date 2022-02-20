import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
// import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../members.dart';

class Vip1Task extends StatefulWidget {
  String TaskRecordRoomId;

  Vip1Task({Key key, this.TaskRecordRoomId}) : super(key: key);

  @override
  State<Vip1Task> createState() => _Vip1TaskState();
}

class _Vip1TaskState extends State<Vip1Task> {
  double amount = 85;
  int dec = 10;
  int inc = 0;
  int counter = 85;
  bool counters = false;
  void counterstatus() {
    setState(() {
      counter++;
    });
  }

  final email = FirebaseAuth.instance;
  void Audition(BuildContext, context) async {
    Map<String, dynamic> audit;

    FirebaseFirestore.instance
        .collection('Vip1 audition')
        .doc(email.currentUser.email)
        .collection('awaiting aproval')
        .add({
      "leading":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkBID9Fih7-sURQoZlBYnPmjiQAvnH0JzLsw&usqp=CAU",
      "trailing":
          "https://firebasestorage.googleapis.com/v0/b/linco-4edcf.appspot.com/o/like.jpg?alt=media&token=cde11d06-f359-44d9-bacf-2f0c47faf078",
      "amount": amount,
      "price":'NGN 85',
      "created": currentPhoneDate,
      "status": "pending",
      "email": email.currentUser.email,
      "today": 85*5,
      "week":85 * 35,
      "month": 85 * 155,
      "test": FieldValue.increment(
        amount += 85,
      ),
      "dec": FieldValue.increment(dec-=1),
      "inc": FieldValue.increment(inc+=1),
      
    });
  }

  @override
  void initState() {
    super.initState();
    //  counter = 850*2;
    Future.delayed(Duration(milliseconds: 5));
    // counter= *2;
  }

  final DateTime currentPhoneDate = DateTime.now();
  final Timestamp myTimeStamp = Timestamp.fromDate(DateTime.now());
  // CollectionReference taskRef = FirebaseFirestore.instance.collection('Task').doc().collection('TaskRecord');
  bool isloading = false;
  bool isDone = false;
  final name = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    String cdate1 = DateFormat("EEEEE, dd, yyyy,").format(DateTime.now());

    // final String  firestore = FirebaseFirestore.instance.collection
    CollectionReference task =
        FirebaseFirestore.instance.collection(' balance');
    bool isloading = false;
    final email = FirebaseAuth.instance;
    return Scaffold(
        backgroundColor: Color.fromRGBO(9, 56, 53, 1),
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Vip1 Tasklist')
                .doc(name.currentUser.email)
                .collection('TaskList')
                .doc(name.currentUser.uid)
                .collection('Member').limit(10)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.data != null) {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> map =
                          snapshot.data.docs[index].data();
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    // height: 400,
                                    // width: 410,
                                    decoration: const BoxDecoration(
                                      color: Color.fromRGBO(15, 51, 63, 4),
                                      // borderRadius: BorderRadius.all(
                                      //   Radius.circular(8),
                                      // ),
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 10,
                                            ),
                                            CircleAvatar(
                                              backgroundImage:
                                                  NetworkImage(map['leading']),
                                              // radius: 25,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            // Text(map['Requested']),
                                            Text(map['Requested']),
                                            SizedBox(
                                              width: 10,
                                            ),

                                            GestureDetector(
                                              onTap: () async {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    behavior:
                                                        SnackBarBehavior.fixed,
                                                    duration:
                                                        Duration(seconds: 1),
                                                    content: Text(
                                                      ' check your Audition',
                                                      style: TextStyle(
                                                          fontSize: 17),
                                                    ),
                                                  ),
                                                );

////e
                                                Audition(BuildContext, context);
                                              },
                                              child: Text(
                                                ' Done',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.orange),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 60,
                                            ),
                                            Text(
                                              map['amount'],
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.orange[800]),
                                            ),
                                          
                                          ],
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 60,
                                            ),
                                            Text(
                                              cdate1,
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.white60),
                                            )
                                          ],
                                        ),
                                        // SizedBox(
                                        //   height: 10,
                                        // ),
                                      
                                        // SizedBox(
                                        //   height: 10,
                                        // ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 60,
                                            ),
                                            Text(
                                              map['link'],
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.white60),
                                            ),
                                          ],
                                        ),
                                        // SizedBox(
                                        //   height: 10,
                                        // ),
                                        Text(
                                          map['instruction'],
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        // SizedBox(
                                        //   height: 40,
                                        // ),
                                        // SizedBox(
                                        //   height: 30,
                                        // ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              } else {
                return Container(
                  child: const Center(
                    child: CupertinoActivityIndicator(
                      animating: true,
                    ),
                  ),
                );
              }
            }));
  }
}
