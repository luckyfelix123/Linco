// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterwave/core/flutterwave.dart';
import 'package:flutterwave/models/responses/charge_response.dart';
import 'package:linco/tests.dart';
import 'dart:io';
import 'dart:math';

class SavingWithdraw extends StatefulWidget {
  SavingWithdraw({Key key}) : super(key: key);

  @override
  State<SavingWithdraw> createState() => _SavingWithdrawState();
}

class _SavingWithdrawState extends State<SavingWithdraw> {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailcontroller = TextEditingController();

  TextEditingController numbercontroller = TextEditingController();

  TextEditingController amountcontroller = TextEditingController();

  bool isloading = false;
  bool isanimated = false;
  bool isDone = false;
  bool back = false;
  bool isTap = false;
  bool isSeen = false;
  final user = FirebaseAuth.instance;

  void checkValues() {
    String email = emailcontroller.text.trim();

    String number = numbercontroller.text.trim();
    String amount = amountcontroller.text.trim();
    if (email == '' || amount == "" || number == "") {
      print('Field must not be empty');
    } else {
      _loading();
      Map<String, dynamic> map = {
        "number": number,
        "amount": amount,
        "email": email,
        "status": 'Unpaid'
        // "ref":setRefs
      };

      FirebaseFirestore.instance
          .collection('Vip1 Invest Withdrawer')
          .doc(user.currentUser.email)
          .collection('Awaiting Investment Payment')
          .add(map);
    }
  }

  void setRefs() {
    Random rand = Random();
    int numbers = rand.nextInt(2000);
    if (Platform.isAndroid) {
      _ref = "AdftS1267$numbers";
      setState(() {
        _ref = "FalaiyTRef1654$numbers";
      });
    } else {
      setState(() {
        _ref = "IosRef123456789";
      });
    }
  }

  String _ref;
  void setRef() {
    Random rand = Random();
    int numbers = rand.nextInt(2000);
    if (Platform.isAndroid) {
      _ref = "Android1267$numbers";
      setState(() {
        _ref = "AndroidRef1654$numbers";
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
    setRefs();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final email = FirebaseAuth.instance;

    return Scaffold(
        backgroundColor: Colors.grey[400],
        body: StreamBuilder<QuerySnapshot>(
          stream:
           FirebaseFirestore.instance
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
            if (snapshot.hasData) {
              return isSeen
                  ? ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> accts =
                            snapshot.data.docs[index].data();
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
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
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
                                      // readOnly: true,
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
                                      // textInputAction: TextInputAction.next,
                                      style: TextStyle(color: Colors.black),
                                      // onTap: this._openBottomSheet,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          labelText:
                                              '\    ${accts['Account']} ',
                                          labelStyle: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold)),
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
                                      readOnly: true,
                                      // textInputAction: TextInputAction.next,
                                      style: TextStyle(color: Colors.black),
                                      // onTap: this._openBottomSheet,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          labelText: '\    ${accts['Bank']} ',
                                          labelStyle: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 350,
                                    margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                                    decoration: BoxDecoration(
                                        // color: Colors.white,
                                        // borderRadius: BorderRadius.all(
                                        //   Radius.circular(15),
                                        // ),
                                        ),
                                    child: TextFormField(
                                      controller: this.emailcontroller,
                                      // textInputAction: TextInputAction.next,
                                      style: TextStyle(color: Colors.black),
                                      // onTap: this._openBottomSheet,
                                      decoration: InputDecoration(
                                          // border: InputBorder.none,
                                          labelText: '    Email',
                                          labelStyle: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold)),

                                      validator: (value) => value.isNotEmpty
                                          ? null
                                          : "email  is required",
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 350,
                                    margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                                    decoration: BoxDecoration(
                                        // color: Colors.white,
                                        // borderRadius: BorderRadius.all(
                                        //   Radius.circular(15),
                                        // ),
                                        ),
                                    child: TextFormField(
                                      controller: this.numbercontroller,
                                      keyboardType: TextInputType.number,
                                      // textInputAction: TextInputAction.next,
                                      style: TextStyle(color: Colors.black),
                                      // onTap: this._openBottomSheet,
                                      decoration: InputDecoration(
                                          // border: InputBorder.none,
                                          labelText: '    Number',
                                          labelStyle: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold)),

                                      validator: (value) => value.isNotEmpty
                                          ? null
                                          : "number  is required",
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 350,
                                    margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                                    decoration: BoxDecoration(
                                        // color: Colors.white,
                                        // borderRadius: BorderRadius.all(
                                        //   Radius.circular(15),
                                        // ),
                                        ),
                                    child: TextFormField(
                                      controller: this.amountcontroller,
                                      keyboardType: TextInputType.number,

                                      // textInputAction: TextInputAction.next,
                                      style: TextStyle(color: Colors.black),
                                      // onTap: this._openBottomSheet,
                                      decoration: InputDecoration(
                                          // border: InputBorder.none,
                                          labelText: '    Amount',
                                          labelStyle: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold)),

                                      validator: (value) => value.isNotEmpty
                                          ? null
                                          : "amount  is required",
                                      onChanged: (value) {
                                        if (amountcontroller.text.isNotEmpty) {
                                          setState(() {
                                            isTap = true;
                                          });
                                        } else {
                                          setState(() {
                                            isTap = false;
                                          });
                                        }
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  isDone
                                      ? CircleAvatar(
                                          backgroundColor: Colors.green,
                                          child: Icon(
                                            Icons.done,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                        )
                                      : back
                                          ? Container(
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.all(32),
                                              child: AnimatedContainer(
                                                alignment: Alignment.center,
                                                duration:
                                                    Duration(minutes: 300),
                                                curve: Curves.bounceInOut,
                                                // onEnd: ()=> isAnimating() =!isAnimating(),
                                                child: OutlinedButton(
                                                    style: OutlinedButton
                                                        .styleFrom(
                                                      shape: StadiumBorder(),
                                                      side: BorderSide(
                                                          width: 3,
                                                          color:
                                                              Colors.blue[300]),
                                                    ),
                                                    child: FittedBox(
                                                      child: Text(
                                                        ' Back',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Colors.orange),
                                                      ),

                                                      // : Text('SignUp'),
                                                    ),

                                                    // Center(
                                                    //     child: Icon(Icons.done),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    }),
                                              ),
                                            )
                                          : isloading
                                              ? Container(
                                                  alignment: Alignment.center,
                                                  padding: EdgeInsets.all(32),
                                                  child: AnimatedContainer(
                                                    alignment: Alignment.center,
                                                    duration:
                                                        Duration(minutes: 300),
                                                    curve: Curves.bounceInOut,
                                                    // onEnd: ()=> isAnimating() =!isAnimating(),
                                                    child: OutlinedButton(
                                                        style: OutlinedButton
                                                            .styleFrom(
                                                          shape:
                                                              StadiumBorder(),
                                                          side: BorderSide(
                                                              width: 3,
                                                              color: Colors
                                                                  .blue[300]),
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            CupertinoActivityIndicator(
                                                              animating: true,
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                              'Loading...',
                                                              style: TextStyle(
                                                                  fontSize: 17),
                                                            )
                                                          ],
                                                        )),
                                                  ),
                                                )
                                              : Container(
                                                  alignment: Alignment.center,
                                                  padding: EdgeInsets.all(32),
                                                  child: AnimatedContainer(
                                                      alignment:
                                                          Alignment.center,
                                                      duration: Duration(
                                                          minutes: 300),
                                                      curve: Curves.bounceInOut,
                                                      // onEnd: ()=> isAnimating() =!isAnimating(),
                                                      child: isTap
                                                          ? OutlinedButton(
                                                              style:
                                                                  OutlinedButton
                                                                      .styleFrom(
                                                                shape:
                                                                    StadiumBorder(),
                                                                side: BorderSide(
                                                                    width: 3,
                                                                    color: Colors
                                                                            .blue[
                                                                        300]),
                                                              ),
                                                              child: FittedBox(
                                                                  child: Text(
                                                                ' Proceed',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    color: Colors
                                                                        .orange),
                                                              )

                                                                  // : Text('SignUp'),
                                                                  ),

                                                              // Center(
                                                              //     child: Icon(Icons.done),
                                                              onPressed: () {
                                                                _onPressed();
                                                                setState(() {
                                                                  emailcontroller
                                                                      .clear();
                                                                  numbercontroller
                                                                      .clear();
                                                                  amountcontroller
                                                                      .clear();
                                                                });
                                                                // _onPressed(
                                                                // Navigator.push(
                                                                //   context,
                                                                //   MaterialPageRoute(
                                                                //     builder: (_) => MyHomePage(),
                                                                //   ),
                                                                // );
                                                              })
                                                          : Container())),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Column(
                      children: [
                        // Container(
                        //   child: Image(
                        //     image: NetworkImage(''),
                        //   )
                        // )
                        SizedBox(
                          height: 50,
                        ),
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRLP7j9sKgBWOgHcfjxTooMSUNvh3QojUi0Uz-QKaFK96YCk2De9rKlbjJBnNyWf5dHPU&usqp=CAU'),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'This field is Empty,go to your bank settings and place your bank details there',
                          style: TextStyle(fontSize: 17),
                        )
                      ],
                    ));
            } else {
              return Center(child: CupertinoActivityIndicator());
            }
          },
        ));
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
      {
        await Future.delayed(Duration(seconds: 16));
        // setState(()=> isloading=false);{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: Duration(seconds: 1),
            content: Text('Your withdrawer is pending check your transactions'),
          ),
        );
      }
      await Future.delayed(Duration(seconds: 4));
      setState(() => back = true);
    }
  }
}
