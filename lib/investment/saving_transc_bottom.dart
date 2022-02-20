import 'package:flutter/material.dart';
import 'package:linco/investment/credits.dart';
import 'package:linco/investment/saving_transaction.dart';
import 'package:linco/members.dart';
import 'package:linco/socialmedias/facebook.dart';
import 'package:linco/socialmedias/instagram.dart';
import 'package:linco/socialmedias/youtube.dart';
import 'package:linco/tasklist/audition.dart';
import 'package:linco/tasklist/completed.dart';
import 'package:linco/tasklist/failed.dart';
import 'package:linco/tasklist/task.dart';
import 'package:linco/vip1%20members/vip1_audition.dart';
import 'package:linco/vip1%20members/vip1_task.dart';


class SavingBottom extends StatefulWidget {
  const SavingBottom({Key  key}) : super(key: key);

  @override
  _SavingBottomState createState() => _SavingBottomState();
}

class _SavingBottomState extends State<SavingBottom> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          
          title: Text('Transactions'),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(196, 151, 64, 1),
            // backgroundColor: Color.fromRGBO(143, 50, 49, 1),
            toolbarHeight: 100,
            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 5,
              tabs: [
                Text('Debits',style: TextStyle(fontSize: 15,),),
                Text('Credits',style: TextStyle(fontSize: 15,),),
                // Text('Completed',style: TextStyle(fontSize: 14,),),
                // Text('Failed',style: TextStyle(fontSize: 15,),),
              ],
            )),
        body: TabBarView(
          children: [
            Debits(),
           Credits(),
            // CardProduct(),
                        // Completed(),

            // Failed(),
           
          ],
        ),
      ),
    );
  }
}
