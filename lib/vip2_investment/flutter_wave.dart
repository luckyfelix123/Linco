import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterwave/core/flutterwave.dart';
import 'package:flutterwave/models/responses/charge_response.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:linco/intend_account/signup.dart';
import 'package:linco/investment/savings.dart';
import 'package:linco/main.dart';
import 'package:linco/vip%201%20acct_creating/signup.dart';
import 'package:linco/vip1%20members/vip1_homepage.dart';
import 'dart:io';
import 'dart:math';
import '../tests.dart';

class InvestFlutterWave2 extends StatefulWidget {
  Map<String, dynamic> data;
  // String number;
  // String pasword;
  InvestFlutterWave2({
    Key key,
  }) : super(key: key);

  @override
  _InvestFlutterWave2State createState() => _InvestFlutterWave2State();
}

class _InvestFlutterWave2State extends State<InvestFlutterWave2> {
  final formKey = GlobalKey<FormState>();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController numcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
    TextEditingController amountcontroller = TextEditingController();

  bool isloading = false;
  bool isanimated = false;
  bool isDone = false;

  void checkValues() {
    String name = namecontroller.text.trim();
    final email = FirebaseAuth.instance;

    String number = numcontroller.text.trim();
    String emails = emailcontroller.text.trim();
        String amount = amountcontroller.text.trim();

    if (name == '' || emails == "" || number == ""||amount=="") {
      print('Field must not be empty');
    } else {
                  _loading();
      _MakePayment(context, emails.trim() ,number.trim(),name.trim(),amount.trim());

      Map<String, dynamic> account = {
        "NAME:": name,
        "EMAIL": emails,
        "NUMBER": number,
        "AMOUNT":amount,
        "Status":'Confirmed'
      };
      FirebaseFirestore.instance
          .collection('Vip2 Invest')
          .doc(email.currentUser.email)
          .collection('Investment')
          .doc(email.currentUser.uid).collection('From vip 2') 
          .add(account);
         
    }
  }

  String _ref;
  void setRef() {
    Random rand = Random();
    int number = rand.nextInt(2000);
    if (Platform.isAndroid) {
      _ref = "Android1267$number";
      setState(() {
        _ref = "AndroidRef1654$number";
      });
    } else {
      setState(() {
        _ref = "IosRef123456789";
      });
    }
  }

  @override
  void initState() {
    setRef();

    super.initState();
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
                    controller: this.emailcontroller,
                    // textInputAction: TextInputAction.next,
                    style: TextStyle(color: Colors.black),
                    // onTap: this._openBottomSheet,
                    decoration: InputDecoration(
                      hintText: "Email",
                    ),
                    validator: (value) =>
                        value.isNotEmpty ? null : "email no is required",
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                  child: TextFormField(
                    controller: this.numcontroller,
                                        keyboardType: TextInputType.number,

                    // textInputAction: TextInputAction.next,
                    style: TextStyle(color: Colors.black),
                    // onTap: this._openBottomSheet,
                    decoration: InputDecoration(
                      hintText: " Number",
                    ),
                    validator: (value) =>
                        value.isNotEmpty ? null : "number no is required",
                  ),
                ),
                 Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                  child: TextFormField(
                    controller: this.amountcontroller,
                    keyboardType: TextInputType.number,
                    // textInputAction: TextInputAction.next,
                    style: TextStyle(color: Colors.black),
                    // onTap: this._openBottomSheet,
                    decoration: InputDecoration(
                      hintText: " Amount",
                    ),
                    validator: (value) =>
                        value.isNotEmpty ? null : "amount no is required",
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
                            side: BorderSide(width: 3, color: Colors.white),
                          ),
                          child: FittedBox(child: CircleAvatar(  
                            backgroundColor: Colors.green,
                            child: Icon(Icons.done,color: Colors.white,),
                          )
                          
                          ),
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


   void _MakePayment(BuildContext context, String amount, String number,String emails,String name) async {
    try {
      Flutterwave flutterwave = Flutterwave.forUIPayment(
          context: this.context,
          encryptionKey: "FLWSECK_TEST58792bf0d8e3",
          publicKey: "FLWPUBK_TEST-ffb9078f6c5bd9e3be6af45c504c640a-X",
          currency: "NGN",
          amount: amountcontroller.text,
          email: emails,
          fullName: "Linco",
          narration: "Investment",
          txRef: _ref,
          isDebugMode: true,
          phoneNumber: number,
          acceptCardPayment: true,
          acceptUSSDPayment: false,
          acceptAccountPayment: false,
          acceptFrancophoneMobileMoney: false,
          acceptGhanaPayment: false,
          acceptMpesaPayment: false,
          acceptRwandaMoneyPayment: false,
          acceptUgandaPayment: false,
          acceptZambiaPayment: false);

      final ChargeResponse response =
          await flutterwave.initializeForUiPayments();
      if (response == null) {
        // print('transaction failed');
        setState(() {
          // Center(
          //   child: Text('failed'),
          // );
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Transaction was canceled'),
                );
              });
        });
      } else {
        setState(() {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Transaction Suceesful'),
                  actions: [
                    GestureDetector(
                      onTap: () {
                        // Navigator.pop(context);
                         Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => Vip1HomePage()),
                        );
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 130),
                    GestureDetector(
                      onTap: () {
                        // Map<String, dynamic> map = {
                        //   'email': email,
                        //   'amount': amount,
                        //   'number': number,

                        // };
                        // FirebaseFirestore.instance
                        //     .collection('Vip1 payments').doc(email).collection(number).add(map);
                           

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => Savings()),
                        );
                      },
                      child: Text(
                        'Continue',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                );
              });
        });

        print(response.message);
      }
// Navigator.push(context, MaterialPageRoute(builder: (_)=> MyHomePage()),);

    } catch (error) {
      print(error);
    }
   }

  _onPressed() {
    // Checkvalues();
    if (this.formKey.currentState.validate()) {
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

      }
    }
  }
}
