import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:linco/vip.dart/vip.dart';
import 'package:url_launcher/url_launcher.dart';

class Instagram extends StatefulWidget {
  const Instagram({Key key}) : super(key: key);

  @override
  _InstagramState createState() => _InstagramState();
}

class _InstagramState extends State<Instagram> {
  final DateTime currentPhoneDate = DateTime.now();
  final Timestamp myTimeStamp = Timestamp.fromDate(DateTime.now());
  final name = FirebaseAuth.instance;
  void onSendMessage(BuildContext context) async {
    Map<String, dynamic> messages = {
      'email': name.currentUser.email,
      'Requested': 'Requested: like and follow',
      'Created': currentPhoneDate,
      'amount': 'NGN 850',
      'requested': 'Facebook Task requirment: like and follow',
      "link": "check your task for link",
      "instruction":
          'Take a screenshot  according to what is on the link and send it to this email (intendcheck1@gmail.com),with your own wallet email for confirmation',
      "status": 'reviewing',
      "status2": 'aproved',
      'leading':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQF7yvVv8og44UB3PIHV-phccZKxXt_cckC9Q&usqp=CAU',
      "trailing":
          'https://firebasestorage.googleapis.com/v0/b/linco-4edcf.appspot.com/o/like.jpg?alt=media&token=cde11d06-f359-44d9-bacf-2f0c47faf078',
      'Audit': currentPhoneDate,
    };

    await FirebaseFirestore.instance
        .collection('IntendAudit')
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
        body:  
        Center(
          child: Container(
            alignment: Alignment.center,
            width: 290,
            height: 70,
            decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                SizedBox(height: 20,),
                Row(
                  children: [
                                    SizedBox(width: 10,),

                    Icon(Icons.lock),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Migrate to unlock this feature',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 220,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => Vip(),
                          ),
                        );
                      },
                      child: Text(
                        'Migrate',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )

//         StreamBuilder<QuerySnapshot>(
//             stream: FirebaseFirestore.instance
//                 .collection('Intend Instagram')
//                 .snapshots(),
//             builder:
//                 (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//               if (snapshot.data != null) {
//                 return ListView.builder(
//                     physics: const BouncingScrollPhysics(),
//                     keyboardDismissBehavior:
//                         ScrollViewKeyboardDismissBehavior.onDrag,
//                     itemCount: snapshot.data.docs.length,
//                     itemBuilder: (context, index) {
//                       Map<String, dynamic> map =
//                           snapshot.data.docs[index].data();
//                       return
//                       Column(
//                         children: [
//                           Container(
//                               // height: 130,
//                               decoration: const BoxDecoration(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(15)),
//                                 color: Color.fromRGBO(15, 51, 63, 4),
//                               ),
//                               child:
//                                Column(
//                                 children: [
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Row(
//                                     children: [
//                                       SizedBox(
//                                         width: 10,
//                                       ),
//                                       CircleAvatar(
//                                         backgroundImage:
//                                             NetworkImage(map['leading']),
//                                       ),
//                                       SizedBox(
//                                         width: 10,
//                                       ),
//                                       Text(
//                                         map['requested'],
//                                         style: TextStyle(fontSize: 19),
//                                       ),
//                                       SizedBox(
//                                         width: 30,
//                                       ),
//                                       GestureDetector(
//                                         onTap: () {
//                                           ScaffoldMessenger.of(context)
//                                               .showSnackBar(
//                                             const SnackBar(
//                                               behavior: SnackBarBehavior.fixed,
//                                               duration: Duration(seconds: 1),
//                                               content: Text(
//                                                 'Task added check your record',
//                                                 style: TextStyle(fontSize: 17),
//                                               ),
//                                             ),
//                                           );
//                                           onSendMessage(context);
//                                         },
//                                         child: CircleAvatar(
//                                           backgroundImage:
//                                               NetworkImage(map['trailing']),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                   Row(
//                                     children: [
//                                       SizedBox(
//                                         width: 60,
//                                       ),
//                                       Text(
//                                         map['amount'],
//                                         style: TextStyle(
//                                             fontSize: 17,
//                                             color: Colors.orange[800]),
//                                       ),
//                                     ],
//                                   ),
//                                   Row(
//                                     children: [
//                                       SizedBox(
//                                         width: 60,
//                                       ),
//                                       TextButton(
//                                           onPressed: () {
//                                             launch(map['link']);
//                                           },
//                                           child: Text(
//                                             'Open link',
//                                             style: TextStyle(
//                                               fontSize: 17,color: Colors.white54
//                                             ),
//                                           )),
//                                       SizedBox(
//                                         width: 20,
//                                       ),
//                                       InkWell(
//                                           onTap: () {
//                                             Clipboard.setData(new ClipboardData(
//                                                     text: map['link']))
//                                                 .then((_) {
//                                               ScaffoldMessenger.of(context)
//                                                   .showSnackBar(SnackBar(
//                                                       content: Text(
//                                                           'Copied to your clipboard !')));
//                                             });
//                                           },
//                                           child: Icon(Icons.copy))
//                                     ],
//                                   )
//                                 ],
//                               )

//                               ),

//                           SizedBox(
//                             height: 5,
//                           ),
//                         ],
//                       );

// //
//                     });
//               } else {
//                 return Container();
//               }
//             })
        );
  }
}
