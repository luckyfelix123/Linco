import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterwave/flutterwave.dart';
import 'package:flutterwave/models/responses/charge_response.dart';
import 'package:linco/tests.dart';
import 'package:linco/vip%201%20acct_creating/signup.dart';
import 'package:linco/vip1%20members/vip1_homepage.dart';
import 'package:linco/vip2_members/vip2_homepage.dart';

class FlutterWavePayment2 extends StatefulWidget {
  FlutterWavePayment2({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _FlutterWavePayment2State createState() => _FlutterWavePayment2State();
}

class _FlutterWavePayment2State extends State<FlutterWavePayment2> {
  final formKey = GlobalKey<FormState>();
  final numberController = TextEditingController();
  final currencyController = TextEditingController();
  final narrationController = TextEditingController();
  final publicKeyController = TextEditingController();
  final encryptionKeyController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

  String selectedCurrency = "";

  bool isDebug = true;
  bool done = false;
final user = FirebaseAuth.instance;
  void checkValues() {
    String email = emailController.text.trim();

    String number = phoneNumberController.text.trim();
    if (email == '' || number == "") {
      print('Field must not be empty');
    } else {
      // _loading();
      _MakePayment(context, email.trim(), number.trim());
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

  Widget build(BuildContext context) {
    this.currencyController.text = this.selectedCurrency;

    return Scaffold(
        backgroundColor: Color.fromRGBO(34, 57, 89, 1),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
        
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 25,
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //   image: AssetImage('asset/a.jpeg'),
                    //   fit: BoxFit.cover,
                    // )
                    ),
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Form(
                  key: this.formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.red),
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                          child: TextFormField(
                            readOnly: true,
                            autofocus: true,
                            // controller: this.amountController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red)),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)),
                                hintText:
                                    "                   You are to pay NGN 34000",
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                                labelStyle: TextStyle(color: Colors.white)),
                            // validator: (value) =>
                            //     value.isNotEmpty ? null : "Amount is required",
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            autofocus: true,
                            controller: phoneNumberController,
                            textInputAction: TextInputAction.next,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: "Phone Number",
                            ),
                            validator: (value) =>
                                value.isNotEmpty ? null : "Phone is required",
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                          child: TextFormField(
                            autofocus: true,
                            keyboardType: TextInputType.number,
                            controller: this.emailController,
                            textInputAction: TextInputAction.next,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                hintText: " Email",
                                hintStyle: TextStyle(
                                  fontSize: 18,
                                )),
                            validator: (value) => value.isNotEmpty
                                ? null
                                : "Your Email is required",
                          ),
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        InkWell(
                          onTap: () {
                            final number = numberController.text;
                            final email = emailController.text;
                            _onPressed();
                          },
                          child: Container(
                              padding: EdgeInsets.all(15),
                              width: 200,
                              height: 50,
                              // margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: Color.fromRGBO(143, 50, 49, 1),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.lock,
                                    color: Color.fromRGBO(34, 57, 89, 1),
                                  ),
                                  Text(
                                    'Make Payment',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ],
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ), // This trailing comma makes auto-formatting nicer f
            ],
          ),
        ));
  }

   void _MakePayment(BuildContext context, String email, String number) async {
    try {
      Flutterwave flutterwave = Flutterwave.forUIPayment(
          context: this.context,
          encryptionKey: "FLWSECK_TEST58792bf0d8e3",
          publicKey: "FLWPUBK_TEST-ffb9078f6c5bd9e3be6af45c504c640a-X",
          currency: "NGN",
          narration: 'Membership Payment',
          amount: '34000',
          email: email,
          fullName: "Linco",
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
                        Navigator.push(context, MaterialPageRoute(builder: (_)=> Vip2HomePage(),),);
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
                        Map<String, dynamic> map = {
                          'email': email,
                          'amount': '34000',
                          'number': number
                        };
                        FirebaseFirestore.instance
                            .collection('Vip2 payments').doc(email).collection(number).add(map);
                           

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => Vip1Signup()),
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
}
