import 'package:flutter/material.dart';

class Vip7 extends StatelessWidget {
  const Vip7({Key  key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Container(
      width: w,
      height: 100,
      decoration: BoxDecoration(
        color: Color.fromRGBO(48, 2, 15, 1),
        borderRadius: BorderRadius.all(
          Radius.circular(1),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                'VIP 7',
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(201, 194, 202, 1)),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                'Task:400 daily',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(174, 169, 182, 1)),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: const [
              SizedBox(
                width: 10,
              ),
              Text(
                'NGN120 per task',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(174, 169, 182, 1)),
              ),
              SizedBox(
                width: 120,
              ),
              Text(
                'NGN 696,000',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(211, 120, 24, 1),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
