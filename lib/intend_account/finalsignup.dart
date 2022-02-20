
import 'package:flutter/material.dart';

class FinalSignup extends StatefulWidget {
  const FinalSignup({ Key key }) : super(key: key);

  @override
  _FinalSignupState createState() => _FinalSignupState();
}

class _FinalSignupState extends State<FinalSignup> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: const Color.fromRGBO(143, 50, 49, 1),
        body:  
        Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 90,
            ),
            Row(
              children: [
                SizedBox(
                  width: 150,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage("asset/emoji.jpeg"),
                  radius: 50,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Text('Thank you for signing up to Linco /n',
                style: TextStyle(
                    color: Color.fromRGBO(211, 167, 167, 1),
                    fontSize: 17,
                    fontWeight: FontWeight.bold)),

           

           
          ],
        ));
  }
}