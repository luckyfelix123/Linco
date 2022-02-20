import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linco/intend_account/login.dart';

import '../tests.dart';

// enum ButtonState { init, loading, done }

class Signup extends StatefulWidget {
  Signup({Key key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController usercontroller = TextEditingController();
  TextEditingController numbercontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController paswordcontroller = TextEditingController();
  TextEditingController confirmcontroller = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final DateTime currentPhoneDate = DateTime.now();
  final Timestamp myTimeStamp = Timestamp.fromDate(DateTime.now());

  void  Checkvalues() {
    String email = emailcontroller.text.trim();

    String pasword = paswordcontroller.text.trim();
    String confirmpasword = confirmcontroller.text.trim();

    if (email == "" || pasword == "" || confirmpasword == "") {
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
      signUp(email, pasword, confirmpasword);
      // print('Successful');
    }
  }

  void signUp(String email, String pasword, String confirmpasword) async {
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
        "email": email,
        'pasword': pasword,
        "confirmpasword": confirmpasword,
        "Created": currentPhoneDate,
      };
      await FirebaseFirestore.instance
          .collection('Intend new users')
          .doc(email)
          .collection('Linco')
          .doc(name)
          .collection('NewMember')
          .add(data);

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MyHomePage(),
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
      backgroundColor:const  Color.fromRGBO(9, 56, 53, 1),
      body: Container(
        width: double.infinity,
        margin:const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Form(
          key: this.formKey,
          child: ListView(
            children: <Widget>[
           const   SizedBox(
                height: 50,
              ),
              Container(
                  height: 130,
                  decoration:const BoxDecoration(
                      // color: Colors.amber,
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSre5c1QsIGb5Bql2uUOxMIwABLjvMgHOQzKA&usqp=CAU')),
                      shape: BoxShape.circle),
                  child:const Text('')),
           const   SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const[
                  // SizedBox(width: 90),
                  Text(
                    'Create an account',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
           const   SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:const [
                  // SizedBox(width: 90),
                  Text(
                    'YOUR FIRST STEP BEGINGS WITH INTEND',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
          const    SizedBox(
                height: 10,
              ),
              Container(
                margin:const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: this.emailcontroller,
                  keyboardType: TextInputType.emailAddress,
                  style:const TextStyle(color: Colors.black),
                  // onTap: this._openBottomSheet,
                  decoration:const InputDecoration(
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
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child:  TextFormField(
                  controller: this.paswordcontroller,
                  keyboardType:  TextInputType.name,

                  textInputAction: TextInputAction.next,
                  obscureText: true,
                  style:const  TextStyle(color: Colors.black),
                  // onTap: this._openBottomSheet,
                  decoration:const  InputDecoration(
                      hintText: "Password",
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Color.fromRGBO(143, 50, 49, 1),
                      )),
                  validator: (value) =>
                      value.isNotEmpty ? null : "Pasword is required",
                ),
              ),
              Container(
                margin:const  EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: this.confirmcontroller,
                  keyboardType: TextInputType.name,

                  textInputAction: TextInputAction.next,
                  style:const TextStyle(color: Colors.black),
                  obscureText: true,
                  // onTap: this._openBottomSheet,
                  decoration:const InputDecoration(
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
                const  SizedBox(
                    width: 30,
                  ),
               const   Text(
                    'Already have an account?',
                    style: TextStyle(fontSize: 17, color: Colors.black54),
                  ),
                const  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await Future.delayed(
                    const    Duration(seconds: 1),
                      );
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => IntendLoging(),
                          ),
                        );
                      });
                    },
                    child: const Text('Login',
                        style: TextStyle(
                          fontSize: 17,
                          color: Color.fromRGBO(143, 50, 49, 1),
                        )),
                  ),
                ],
              ),
            const  SizedBox(
                height: 40,
              ),
              isDone 
                  ? OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape:const StadiumBorder(),
                        side: BorderSide(width: 3, color: Colors.blue[300]),
                      ),
                      child: const FittedBox(
                          child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.green,
                        child: Icon(
                          Icons.done,
                          color: Colors.white,
                          size: 25,
                        ),
                      )))
                  : 
                   Container(
                      alignment: Alignment.center,
                      padding:const  EdgeInsets.all(32),
                      child: AnimatedContainer(
                        alignment: Alignment.center,
                        duration:const Duration(minutes: 300),
                        curve: Curves.bounceInOut,
                        // onEnd: ()=> isAnimating() =!isAnimating(),
                        child: 
                         OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape:const StadiumBorder(),
                            side: BorderSide(width: 3, color: Colors.blue[300]),
                          ),
                          child: isloading
                              ?  
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:const [
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
                              : const FittedBox(
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
