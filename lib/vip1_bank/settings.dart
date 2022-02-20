import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linco/tests.dart';

class AccountInfo extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController acctcontroller = TextEditingController();
  TextEditingController bankcontroller = TextEditingController();
  bool isloading = false;
  bool isanimated = false;
  bool isDone = false;

  void checkValues() {
    String name = namecontroller.text.trim();

    String acct = acctcontroller.text.trim();
    String bank = bankcontroller.text.trim();
    if (name == '' || acct == "" || bank == "") {
      print('Field must not be empty');
    } else {
      print('good');
    }
  }

  bool isEmpty = false;
  AccountInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final email = FirebaseAuth.instance;

    return Scaffold(
        backgroundColor: Colors.grey[400],
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Bank')
              .doc(email.currentUser.email)
              .collection('Bank details')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error:${snapshot.error}'),
              );
            }
            if (snapshot.connectionState == ConnectionState.active) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> accts = snapshot.data.docs[index].data();
                  return SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Form(
                        key: this.formKey,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 50,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 40,
                                ),
                                const Text(
                                  "ACCOUNT INFORMATION",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                ),
                                const SizedBox(
                                  height: 100,
                                ),
                              ],
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 350,
                              margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: TextFormField(
                                readOnly: true,
                                controller: this.namecontroller,
                                style: TextStyle(color: Colors.black),

                                // onTap: this._openBottomSheet,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: '\    ${accts['NAME:']} ',
                                    labelStyle: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold)
                                    // hintText: accts['NAME:' ]
                                    ),
                                validator: (value) => value.isNotEmpty
                                    ? null
                                    : "Name is required",
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 350,
                              margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: TextFormField(
                                controller: this.acctcontroller,
                                // textInputAction: TextInputAction.next,
                                style: TextStyle(color: Colors.black),
                                // onTap: this._openBottomSheet,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: '\    ${accts['Account']} ',
                                    labelStyle: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold)),
                                validator: (value) => value.isNotEmpty
                                    ? null
                                    : "account no is required",
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 350,
                              margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: TextFormField(
                                controller: this.bankcontroller,
                                // textInputAction: TextInputAction.next,
                                style: TextStyle(color: Colors.black),
                                // onTap: this._openBottomSheet,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: '\    ${accts['Bank']} ',
                                    labelStyle: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold)),

                                validator: (value) => value.isNotEmpty
                                    ? null
                                    : "bank no is required",
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(32),
                              child: AnimatedContainer(
                                alignment: Alignment.center,
                                duration: Duration(minutes: 300),
                                curve: Curves.bounceInOut,
                                // onEnd: ()=> isAnimating() =!isAnimating(),
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    shape: StadiumBorder(),
                                    side: BorderSide(
                                        width: 3, color: Colors.blue[300]),
                                  ),
                                  child: FittedBox(
                                    child: Text(
                                      ' Back',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.orange),
                                    ),

                                    // : Text('SignUp'),
                                  ),

                                  // Center(
                                  //     child: Icon(Icons.done),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => MyHomePage(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            if (snapshot.connectionState == ConnectionState.none) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text(
                        'NO DATA YET,GO TO ACCOUNT INFO AND ACTIVATE HERE',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: 160,),
                  ElevatedButton(onPressed: (){  
                    Navigator.pop(context);
                  }, 


                   child: Text('Back')
                  
                  )
                ],
              );
              //  Container(
              //    child: Center(
              //      child: Text('NO DATA YET,GO TO ACCOUNT INFO AND ACTIVATE HERE'),
              //    ),
              //  );
            }
            if (snapshot.connectionState == ConnectionState.none) {
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('No data'),
                ],
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }

  _onPressed() {
    // Checkvalues();
    if (this.formKey.currentState.validate()) {
      // _loading();
      checkValues();
    } else {
      print('failed');
    }
  }
}
