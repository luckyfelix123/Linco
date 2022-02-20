import 'package:flutter/material.dart';

import 'package:linco/intend_account/login.dart';
import 'package:linco/vip1_bank/recharget.dart';
import 'package:linco/vip1_bank/withdraw.dart';
import 'package:linco/vip1_bank/withdraw_rec.dart';

import '../recharget.dart';


class RechargeContainer extends StatefulWidget {
  const RechargeContainer({Key key}) : super(key: key);

  @override
  _RechargeContainerState createState() => _RechargeContainerState();
}

class _RechargeContainerState extends State<RechargeContainer> {
    final DateTime currentPhoneDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(15, 51, 63, 4),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: (){  
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Text(
            'My Wallet',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 150,
            width: 390,
            decoration: BoxDecoration(
                color: Colors.teal, borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  '1000.00',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.yellow[700],
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Balance',
                  style: TextStyle(fontSize: 17, color: Colors.white70),
                ),
                Divider(
                  color: Colors.white,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 40,
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(context: context, builder: (context){  
                          return RechargeT();
                        });
                      },
                      child: Text(
                        'Recharge',
                        style: TextStyle(
                            fontSize: 19,
                            color: Colors.yellow[700],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      '|',
                      style: TextStyle(fontSize: 30, color: Colors.grey[400]),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return  Withdrawer();
                              
                            });
                      },
                      child: Text(
                        'Withdrawal',
                        style: TextStyle(
                            fontSize: 19,
                            color: Colors.green[300],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                'Recharge record',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white54),
              ),
              SizedBox(
                width: 100,
              ),
              GestureDetector(
                onTap: () {
                  //  Navigator.push(context, MaterialPageRoute(builder: (_)=>)
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SingleChildScrollView(
                            child: Container(
                          height: 1000,
                          child: WithdrawRec(),
                        ));
                      });
                },
                child: Text(
                  'Withdraw record',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white54),
                ),
              ),
            ],
          ),
          Recharge()
        ],
      ),
    );
  }
}
