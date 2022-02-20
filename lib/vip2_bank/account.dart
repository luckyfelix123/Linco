import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:linco/intend_account/signup.dart';
import 'package:linco/main.dart';
import 'package:linco/vip%201%20acct_creating/signup.dart';

import '../tests.dart';

class Account2 extends StatefulWidget {
  Map<String, dynamic> data;
  // String number;
  // String pasword;
  Account2({
    Key key,
  }) : super(key: key);

  @override
  _Account2State createState() => _Account2State();
}

class _Account2State extends State<Account2> {
  final formKey = GlobalKey<FormState>();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController acctcontroller = TextEditingController();
  TextEditingController bankcontroller = TextEditingController();
  bool isloading = false;
  bool isanimated = false;
  bool isDone = false;

  void checkValues() {
    String name = namecontroller.text.trim();
    final email = FirebaseAuth.instance;

    String acct = acctcontroller.text.trim();
    String bank = bankcontroller.text.trim();
    if (name == '' || acct == "" || bank == "") {
      print('Field must not be empty');
    } else {
                  _loading();

      Map<String, dynamic> account = {
        "NAME:": name,
        "Account": acct,
        "Bank": bank,
      };
      FirebaseFirestore.instance
          .collection('Bank2')
          .doc(email.currentUser.email)
          .collection('Bank details')
          .doc(email.currentUser.uid)
          .set(account);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: SingleChildScrollView(
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
                      "YOUR ACCOUNT INFORMATION ",
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
                Row(
                  children: const [
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      "For Nigerians only",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('asset/n.jpeg'),
                      radius: 12,
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                  child: TextFormField(
                    controller: this.namecontroller,
                    style: TextStyle(color: Colors.black),
                    // onTap: this._openBottomSheet,
                    decoration: InputDecoration(
                      hintText: "NAME:",
                    ),
                    validator: (value) =>
                        value.isNotEmpty ? null : "Name is required",
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                  child: TextFormField(
                    controller: this.acctcontroller,
                    // textInputAction: TextInputAction.next,
                    style: TextStyle(color: Colors.black),
                    // onTap: this._openBottomSheet,
                    decoration: InputDecoration(
                      hintText: "ACCOUNT NO",
                    ),
                    validator: (value) =>
                        value.isNotEmpty ? null : "account no is required",
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                  child: TextFormField(
                    controller: this.bankcontroller,
                    // textInputAction: TextInputAction.next,
                    style: TextStyle(color: Colors.black),
                    // onTap: this._openBottomSheet,
                    decoration: InputDecoration(
                      hintText: " BANK",
                    ),
                    validator: (value) =>
                        value.isNotEmpty ? null : "bank no is required",
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                isDone
                    ? GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: StadiumBorder(),
                            side: BorderSide(width: 3, color: Colors.blue[300]),
                          ),
                          child: FittedBox(child: Text('Cancel')),
                        ),
                      )
                    : Container(
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
                              side:
                                  BorderSide(width: 3, color: Colors.blue[300]),
                            ),
                            child: isloading
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // CircularProgressIndicator(
                                      //   color: Colors.red,
                                      // ),
                                      CupertinoActivityIndicator(
                                        animating: true,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text('Loading...'),

                                      // isDone?  Text('data'): isDone==false
                                    ],
                                  )
                                : FittedBox(
                                    child: Text(
                                      ' Done',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.orange),
                                    ),

                                    // : Text('SignUp'),
                                  ),

                            // Center(
                            //     child: Icon(Icons.done),
                            onPressed: () {
                              _onPressed();
                            },
                          ),
                        ),
                      )
              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
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

  _loading() async {
    if (isloading) return;
    setState(() => isloading = true);
    {
      await Future.delayed(Duration(seconds: 3));
      setState(() => isDone = true);
      {
        // await Future.delayed(Duration(seconds: 2));
        // setState(()=> isloading=false);{

        // }

      }
    }
  }
}
