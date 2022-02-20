import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileInformarion extends StatefulWidget {
  const ProfileInformarion({Key  key}) : super(key: key);

  @override
  _ProfileInformarionState createState() => _ProfileInformarionState();
}

class _ProfileInformarionState extends State<ProfileInformarion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
          ),
          CircleAvatar(
            backgroundImage: AssetImage('asset/ava.jpeg'),
            radius: 70,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              height: 70,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.cyan[900],
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Text(
                'Change photo',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Expanded(
            child: Container(
              width: 400,
              alignment: Alignment.center,
              height: 140,
              decoration: const BoxDecoration(
                  // color:  Color.fromRGBO(143, 50, 49,1),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'NAME:',
                  // labelText: 'What is your bank name?',
                  labelStyle: TextStyle(
                      fontSize: 19,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  // border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  isCollapsed: true,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          Expanded(
            child: Container(
              width: 400,
              height: 60,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(143, 50, 49, 1),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'ACCOUNT NO:',
                  // labelText: 'What is your bank name?',
                  labelStyle: TextStyle(
                      fontSize: 19,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),

                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  isCollapsed: true,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'BANK NAME:',

                  // labelText: 'What is your bank name?',
                  labelStyle: TextStyle(
                      fontSize: 19,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  isCollapsed: true,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 200,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              width: 80,
              height: 35,
              decoration: BoxDecoration(
                // image: DecorationImage(image: AssetImage('asset/key.jpeg'),),
                color: Colors.cyan[900],
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: const Text(
                'DONE',
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
