// import 'dart:html';
import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterwave/flutterwave.dart';
import 'package:flutterwave/models/responses/charge_response.dart';
import 'package:linco/tests.dart';
import 'package:linco/vip1%20members/vip1_homepage.dart';
import 'package:linco/vip2_bank/recharge_container.dart';

class RechargeT2 extends StatefulWidget {
  RechargeT2({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _RechargeT2State createState() => _RechargeT2State();
}

class _RechargeT2State extends State<RechargeT2> {
  final formKey = GlobalKey<FormState>();
  final numberController = TextEditingController();

  final amountController = TextEditingController();
  final nameController = TextEditingController();

  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

  String selectedCurrency = "";

  bool isDebug = true;
  bool done = false;
                         final user = FirebaseAuth.instance;
  final DateTime currentPhoneDate = DateTime.now();

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
    // this.currencyController.text = this.selectedCurrency;

    return Scaffold(
      //      backgroundColor: Color.fromRGBO(34, 57, 89, 1),

      appBar: AppBar(
        backgroundColor: Color.fromRGBO(34, 57, 89, 1),
      ),
      body: Container(
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
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  autofocus: true,
                  // keyboardType: TextInputType.number,
                  controller: this.nameController,
                  textInputAction: TextInputAction.next,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      hintText: " Name",
                      hintStyle: TextStyle(
                        fontSize: 18,
                      )),
                  validator: (value) =>
                      value.isNotEmpty ? null : " Name is required",
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  autofocus: true,
                  // keyboardType: TextInputType.number,
                  controller: this.emailController,
                  textInputAction: TextInputAction.next,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      hintText: " Email",
                      hintStyle: TextStyle(
                        fontSize: 18,
                      )),
                  validator: (value) =>
                      value.isNotEmpty ? null : " Email is required",
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  autofocus: true,
                  controller: this.numberController,
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
                  controller: this.amountController,
                  textInputAction: TextInputAction.next,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      hintText: " Amount",
                      hintStyle: TextStyle(
                        fontSize: 18,
                      )),
                  validator: (value) =>
                      value.isNotEmpty ? null : " Amount is required",
                ),
              ),
              SizedBox(
                height: 200,
              ),
              InkWell(
                onTap: () async {
                  final number = numberController.text;
                  final email = emailController.text;
                  final name = nameController.text;

                  final amount = amountController.text;

                  if (this.formKey.currentState.validate() ||
                      amount.contains(',') != true) {
                    // _loading();
                    // checkValues();
                    await Future.delayed(Duration(seconds: 1));
                    setState(() {
                      _MakePayment(context, email.trim(), amount.trim(),
                          name.trim(), number.trim());
                    });
                  } else {
                    print('commALucky');
                  }
                },
                child: Container(
                    padding: EdgeInsets.all(15),
                    width: 8,
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
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _MakePayment(BuildContext context, String email, String amount,
      String number, String name) async {
    try {
      Flutterwave flutterwave = Flutterwave.forUIPayment(
          context: this.context,
          encryptionKey: "FLWSECK_TEST58792bf0d8e3",
          publicKey: "FLWPUBK_TEST-ffb9078f6c5bd9e3be6af45c504c640a-X",
          currency: "NGN",
          amount: amountController.text,
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
                  title: Text('Awaiting Aproval'),
                  actions: [
                    SizedBox(width: 130),
                    GestureDetector(
                      onTap: () {
                        Map<String, dynamic> map = {
                          'name': name,
                          'email': email,
                          'amount': amount,
                          'number': number,
                          "status": 'Pending',
                          "date":currentPhoneDate,
                          // "ref":Random(8477463633737774)
                        };
                        FirebaseFirestore.instance
                            .collection('Vip2 recharcge')
                            .doc('EXPLIT')
                            .collection('Deposit')
                            .doc(user.currentUser.email)
                            .collection('From vip1 user')
                            .add(map);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => RechargeContainer2()),
                        );
                        setState(() {
                          nameController.clear();
                          emailController.clear();
                          nameController.clear();
                          amountController.clear();
                        });
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
}
