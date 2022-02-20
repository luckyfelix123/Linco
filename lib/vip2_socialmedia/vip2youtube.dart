import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:linco/vip.dart/vip.dart';
import 'package:url_launcher/url_launcher.dart';

class Vip2Youtube extends StatefulWidget {
  const Vip2Youtube({Key key}) : super(key: key);

  @override
  _Vip1YoutubeState createState() => _Vip1YoutubeState();
}

class _Vip1YoutubeState extends State<Vip2Youtube> {
  final DateTime currentPhoneDate = DateTime.now();
  final Timestamp myTimeStamp = Timestamp.fromDate(DateTime.now());
  final name = FirebaseAuth.instance;
  void onSendMessage(BuildContext context) async {
    Map<String, dynamic> messages = {
      'email': name.currentUser.email,
      'Requested': 'Requested: like and subscribe',
      'Created': currentPhoneDate,
      'amount': 'NGN 85',
      'requested': 'Facebook Task requirment: like and follow',
      "link": "check your task for link",
      "instruction":
          'Take a screenshot  according to what is on the link and send it to this email (intendcheck1@gmail.com),with your own wallet email for confirmation',
      "status": 'reviewing',
      "status2": 'aproved',
      'leading':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRno9er_TfM2pFjow4smtUyAMRPFb6EVKN-gQ&usqp=CAU',
      'Audit': currentPhoneDate,
      "trailing":
          'https://firebasestorage.googleapis.com/v0/b/linco-4edcf.appspot.com/o/like.jpg?alt=media&token=cde11d06-f359-44d9-bacf-2f0c47faf078'
    };

    await FirebaseFirestore.instance
        .collection('Vip2 Tasklist')
        .doc(name.currentUser.email)
        .collection('TaskList')
        .doc(name.currentUser.uid)
        .collection('Member')
        .add(messages);

    FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(9, 56, 53, 1),
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Vip2 Youtube')
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
                              // height: 130,
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
                                        backgroundColor:Color.fromRGBO(15, 51, 63, 4) ,
                                        backgroundImage:
                                            NetworkImage(map['Leading']),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        map['Like'],
                                        style: TextStyle(fontSize: 19),
                                      ),
                                      SizedBox(
                                        width: 140,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              behavior: SnackBarBehavior.fixed,
                                              duration: Duration(seconds: 1),
                                              content: Text(
                                                'Task added check your record',
                                                style: TextStyle(fontSize: 17),
                                              ),
                                            ),
                                          );
                                          onSendMessage(context);
                                        },
                                        child: CircleAvatar(
                                          backgroundImage:
                                              NetworkImage(map['Trailing']),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 60,
                                      ),
                                      Text(
                                        map['Amount'],
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
                                      TextButton(
                                          onPressed: () {
                                            launch(map['Link']);
                                          },
                                          child: Text(
                                            'Open link',
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.white54),
                                          )),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            Clipboard.setData(new ClipboardData(
                                                    text: map['Link']))
                                                .then((_) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                          'Copied to your clipboard !')));
                                            });
                                          },
                                          child: Icon(Icons.copy))
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
                    });
              } else {
                return Container();
              }
            }));
  }
}
