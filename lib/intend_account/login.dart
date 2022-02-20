import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:linco/intend_account/signup.dart';
import 'package:linco/main.dart';
import 'package:linco/vip%201%20acct_creating/signup.dart';

import '../tests.dart';

class IntendLoging extends StatefulWidget {
  Map<String, dynamic> data;
  // String number;
  // String pasword;
  IntendLoging({
    Key key,
  }) : super(key: key);

  @override
  _IntendLogingState createState() => _IntendLogingState();
}

class _IntendLogingState extends State<IntendLoging> {
   final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final paswtController = TextEditingController();
  bool isloading = false;
  bool isanimated = false;
  bool isDone = false;


  void checkValues(){  
    String email = emailController.text.trim();
    String pasword =paswtController.text.trim();
    if(email == ''|| pasword==""){  
      print('Field must not be empty');
    }else{  
      _loading();
      login(email,pasword);
    }
  }

  void login(String email,String pasword)async{   
UserCredential credential;
try{   

   credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: pasword);

}on FirebaseException catch(ex){  
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.fixed,
          duration: Duration(seconds: 1),
          content: Text(
            ex.message.toString(),
            style: TextStyle(fontSize: 17),
          )));
} if (credential!=null) {  
  String name = credential.user.uid;

  // DocumentSnapshot userData = await FirebaseFirestore.instance.collection('Vip1 new users').doc(name).collection('NewMember').snapshots();
  await FirebaseFirestore.instance.collection('Intend new users').doc(email).collection('NewMember').get();
  Navigator.push(context, MaterialPageRoute(builder: (_)=> MyHomePage()),);
  print('Login Sucessful');
}
  }


  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
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
                    'LOGIN INTO YOUR ACCOUNT',
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
                  controller: this.emailController,
                  style: TextStyle(color: Colors.black),
                  // onTap: this._openBottomSheet,
                  decoration: InputDecoration(
                      hintText: "Email",
                      prefixIcon: Icon(
                        Icons.call,
                        color: Color.fromRGBO(143, 50, 49, 1),
                      )),
                  validator: (value) =>
                      value.isNotEmpty ? null : "Email is required",
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: this.paswtController,
                  textInputAction: TextInputAction.next,
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
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'You dont have account yet?',
                    style: TextStyle(fontSize: 17, color: Colors.black54),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () async {
                      Future.delayed(
                        Duration(seconds: 1),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => Signup(),
                        ),
                      );
                    },
                    child: Text('SignUp',
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
                          child: Icon(
                        Icons.arrow_forward,
                        size: 30,
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
                                    Text('Loading...'),

                                    // isDone?  Text('data'): isDone==false
                                  ],
                                )
                              : FittedBox(
                                  child: Text(
                                    ' LogIn',
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
