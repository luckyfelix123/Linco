import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:linco/vip%201%20acct_creating/login_acc.dart';
import 'package:linco/vip%201%20acct_creating/splash_screen.dart';
import 'package:linco/vip.dart/vip2.dart';
import 'package:linco/vip1%20members/vip1_homepage.dart';
import 'package:linco/vip2account_creating/vip2_splash_screen.dart';

import 'login_acc.dart';

// enum ButtonState { init, loading, done }

class Vip2Signup extends StatefulWidget {
  Vip2Signup({Key key}) : super(key: key);

  @override
  State<Vip2Signup> createState() => _Vip2SignupState();
}

class _Vip2SignupState extends State<Vip2Signup> {
  TextEditingController usercontroller = TextEditingController();
  TextEditingController numbercontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController paswordcontroller = TextEditingController();
  TextEditingController confirmcontroller = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool validateStructures(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  String _usernameError;
  String _paswordError;

// output:

//     Vignesh123! : true
//     vignesh123 : false
//     VIGNESH123! : false
//     vignesh@ : false
//     12345678? : false

  final DateTime currentPhoneDate = DateTime.now();
  final Timestamp myTimeStamp = Timestamp.fromDate(DateTime.now());

  void Checkvalues() {
    String email = emailcontroller.text.trim();
    String username = usercontroller.text.trim();
    String number = numbercontroller.text.trim();
    String pasword = paswordcontroller.text.trim();
    String confirmpasword = confirmcontroller.text.trim();

    if (email == "" ||
        pasword == "" ||
        username == "" ||
        number == "" ||
        pasword == "" ||
        confirmpasword == "") {
      print('Fields can not be empty');
    }
    if (pasword != confirmpasword) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.fixed,
          duration: Duration(seconds: 1),
          content: Text(
            'Password did not match',
            style: TextStyle(fontSize: 17),
          )));
    } else {
      _loading();
      signUp(username, email, pasword, number, confirmpasword);
      // print('Successful');
    }
  }

  void signUp(String username, String email, String pasword, String number,
      String confirmpasword) async {
    UserCredential credential;

    try {
      credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pasword);
    } on FirebaseException catch (ex) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.fixed,
          duration: Duration(seconds: 2),
          content: Text(
            ex.message.toString(),
            style: TextStyle(fontSize: 17),
          )));
    }
    if (credential != null) {
      String name = credential.user.uid;
      Map<String, dynamic> data = {
        'Name': username,
        "email": email,
        "Number": number,
        'pasword': pasword,
        "confirmpasword": confirmpasword,
        "Created": currentPhoneDate,
      };
      await FirebaseFirestore.instance
          .collection('Vip2 new users')
          .doc(username)
          .collection('Linco')
          .doc(name)
          .collection('NewMember')
          .add(data);

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => Vip2SplashScreen(),
          ));
      //     .set(data)
      //     .then((value) {
      //   print('New User created');
      // });
    }
  }

  bool isloading = false;
  bool isanimated = false;
  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Form(
          key: this.formKey,
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
//               CircleAvatar(
//                 // backgroundImage:NetworkImage('https://image.shutterstock.com/image-vector/luxury-vip-member-badge-composed-260nw-237706195.jpg') ,
// backgroundImage: AssetImage('asset/im.jpeg',),
// foregroundImage: AssetImage('asset/yt.jpg'),
//                 radius: 50,
//               ),
              Container(
                  height: 130,
                  decoration: BoxDecoration(
                      // color: Colors.amber,
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://image.shutterstock.com/image-vector/luxury-vip-member-badge-composed-260nw-237706195.jpg')),
                      shape: BoxShape.circle),
                  child: Text('')),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(width: 90),
                  Text(
                    "it is time to create an account for vip2",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: this.usercontroller,
                  // textInputAction: TextInputAction.next,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      hintText: "UserName",
                      errorText: _usernameError,
                      prefixIcon: Icon(
                        Icons.person,
                        color: Color.fromRGBO(143, 50, 49, 1),
                      )),
                  validator: (value) =>
                      value.isNotEmpty ? null : "UserName is required",
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
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color.fromRGBO(143, 50, 49, 1),
                      )),
                  validator: (value) =>
                      value.isNotEmpty ? null : "Email is required",
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: this.paswordcontroller,
                  // textInputAction: TextInputAction.next,
                  obscureText: true,
                  style: TextStyle(color: Colors.black),
                  // onTap: this._openBottomSheet,
                  decoration: InputDecoration(
                      hintText: "Pasword",
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Color.fromRGBO(143, 50, 49, 1),
                      )),
                  validator: (value) =>
                      value.isNotEmpty ? null : "Pasword is required",
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: this.confirmcontroller,
                  // textInputAction: TextInputAction.next,
                  style: TextStyle(color: Colors.black),
                  obscureText: true,
                  // onTap: this._openBottomSheet,
                  decoration: InputDecoration(
                      hintText: "Confirm Pasword",
                      prefixIcon: Icon(
                        Icons.lock_open,
                        color: Color.fromRGBO(143, 50, 49, 1),
                      )),

                  validator: (value) =>
                      value.isNotEmpty ? null : "ConfirmPasword is required",
//
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Already have an account?',
                    style: TextStyle(fontSize: 17, color: Colors.black54),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await Future.delayed(
                        Duration(seconds: 1),
                      );
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => Vip2Loging(),
                          ),
                        );
                      });
                    },
                    child: Text('Login',
                        style: TextStyle(
                          fontSize: 17,
                          color: Color.fromRGBO(143, 50, 49, 1),
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              isDone
                  ? OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: StadiumBorder(),
                        side: BorderSide(width: 3, color: Colors.blue[300]),
                      ),
                      child: FittedBox(
                          child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.green,
                        child: Icon(
                          Icons.done,
                          color: Colors.white,
                          size: 25,
                        ),
                      )))
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
                            side: BorderSide(width: 3, color: Colors.blue[300]),
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
                                    Text('Please Wait...'),

                                    // isDone?  Text('data'): isDone==false
                                  ],
                                )
                              : FittedBox(
                                  child: Text(
                                    ' SignUp',
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _onPressed() {
    // Checkvalues();
    if (this.formKey.currentState.validate()) {
      Checkvalues();
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
      {}
    }
  }
}
