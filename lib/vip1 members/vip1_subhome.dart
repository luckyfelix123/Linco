import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:linco/members.dart';
import 'package:linco/socialmedias/facebook.dart';
import 'package:linco/socialmedias/instagram.dart';
import 'package:linco/socialmedias/youtube.dart';
import 'package:linco/tasklist/tasklist.dart';
import 'package:linco/vip1social_media/vip1facebook.dart';
import 'package:linco/vip1social_media/vip1instagram.dart';
import 'package:linco/vip1social_media/vip1youtube.dart';

import '../image_autoslider.dart';


class Vip1SubHome extends StatefulWidget {
  const Vip1SubHome({Key  key}) : super(key: key);

  @override
  _Vip1SubHomeState createState() => _Vip1SubHomeState();
}

class _Vip1SubHomeState extends State<Vip1SubHome> {
  int Selection =1;
  @override
  Widget build(BuildContext context) {
    return  
    DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(15, 51, 63, 4),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor:Color.fromRGBO(15, 51, 63, 4),
          title: ImageSlider(),
            toolbarHeight: 200,
            bottom: TabBar(
              
              indicatorColor: Colors.white,
              indicatorWeight: 3,
              tabs: [
               Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 35,
                  
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Text(
                    'Collectors',
                    style: TextStyle(fontSize: 12,color: Colors.red),
                  ),
                ),
               
                // OutlinedButton(
                //           style: OutlinedButton.styleFrom(
                //             shape: const StadiumBorder(),
                //             side: BorderSide(width: 3, color: Colors.blue[300]),
                //           ),
                //           child: Text('Collectors'),
                // ),
                Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 35,
                  decoration: BoxDecoration(
                      color: Colors.blue[800],
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Text(
                    'Facebook',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 35,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text(
                    'Instagram',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 35,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text(
                    'Youtube',
                    style: TextStyle(fontSize: 12, color: Colors.red),
                  ),
                ),
              ],
            )),
        body: TabBarView(
        dragStartBehavior: DragStartBehavior.start,
        physics: ScrollPhysics(parent: BouncingScrollPhysics()),
          children: [
            Members(),
            Vip1Facebook(),
            Vip1Instagram(),
            Vip1Youtube(),
          ],
        ),
      ),
    );
  }
}
