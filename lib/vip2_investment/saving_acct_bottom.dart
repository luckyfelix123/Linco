import 'package:flutter/material.dart';
import 'package:linco/investment/credits.dart';
import 'package:linco/investment/saving_transaction.dart';
import 'package:linco/vip2_investment/saving_transaction.dart';

import 'credits.dart';


class SavingBottom2 extends StatefulWidget {
  const SavingBottom2({Key  key}) : super(key: key);

  @override
  _SavingBottom2State createState() => _SavingBottom2State();
}

class _SavingBottom2State extends State<SavingBottom2> {
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
            Debits2(),
           vip2Credits(),
            // CardProduct(),
                        // Completed(),

            // Failed(),
           
          ],
        ),
      ),
    );
  }
}
