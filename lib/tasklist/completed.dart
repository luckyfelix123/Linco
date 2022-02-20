import 'package:flutter/material.dart';

class Completed extends StatelessWidget {
  const Completed({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  
      Column(
        children: [
          // SizedBox(
          //   height: 200,
          // ),
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: Color.fromRGBO(15, 51, 63, 4),

// borderRadius: BorderRadius.all(Radius.circular())
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('asset/fb.jpeg'),
                      radius: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),

                    Text(
                      'Request: Like and follow',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      ' Like and follow',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      width: 20,
                    ),

                    //  SizedBox(  width: 250,),
                    CircleAvatar(
                      backgroundImage: AssetImage('asset/like.jpg'),
                      radius: 20,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 60,
                    ),
                    Text(
                      'NGN:850',
                      style: TextStyle(fontSize: 16),
                    ),
                    //  SizedBox(  width: 250,),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 60,
                    ),

                    Text(
                      'Created:',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '22/08/2022:',
                      style: TextStyle(fontSize: 16),
                    ),
                    //  SizedBox(  width: 250,),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: Color.fromRGBO(15, 51, 63, 4),

// borderRadius: BorderRadius.all(Radius.circular())
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('asset/fb.jpeg'),
                      radius: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),

                    Text(
                      'Request: Like and follow',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      ' Like and follow',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      width: 20,
                    ),

                    //  SizedBox(  width: 250,),
                    CircleAvatar(
                      backgroundImage: AssetImage('asset/like.jpg'),
                      radius: 20,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 60,
                    ),
                    Text(
                      'NGN:850',
                      style: TextStyle(fontSize: 16),
                    ),
                    //  SizedBox(  width: 250,),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 60,
                    ),

                    Text(
                      'Created:',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '22/08/2022:',
                      style: TextStyle(fontSize: 16),
                    ),
                    //  SizedBox(  width: 250,),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Text(
            'No more data',
            style: TextStyle(fontSize: 16, ),
          )
        ],
      ),
    );
  }
}
