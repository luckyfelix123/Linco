import 'package:flutter/material.dart';
import 'package:marquee_text/marquee_direction.dart';
import 'package:marquee_text/marquee_text.dart';
import 'package:marquee_text/vertical_marquee_text.dart';

class Members extends StatefulWidget {
  // const MyHomePage({Key key}) : super(key: key);

  @override
  _MembersState createState() => _MembersState();
}

class _MembersState extends State<Members> {
  final List<String> _textList = [
    'APPRECIATION',
    'You all are welcome to Linco mobile task app'
  ];

  var firstTextIndex = 0;
  var secondTextIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 5,
        ),
        Row(
          children: <Widget>[
            // / FirstText
            // / 固定宽度的Container
            Container(
              height: 30,
              alignment: Alignment.center,
              color: Color.fromRGBO(143, 50, 49, 1),
              width: 160,
              // height: MediaQuery.of(context).size.height,
              child: MarqueeText(
                  text: TextSpan(
                    text: _textList[firstTextIndex],
                  ),
                  speed: 1,
                  textDirection: TextDirection.rtl,
                  marqueeDirection: MarqueeDirection.rtl),
            ),

            const SizedBox(width: 12),

            /// SecondText
            /// 包含在Expanded中
            Expanded(
              child: Container(
                color: Colors.white70,
                child: MarqueeText(
                  text: TextSpan(
                    text: _textList[secondTextIndex],
                  ),
                  speed: 50,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.green,
                  ),
                  marqueeDirection: MarqueeDirection.rtl,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: MaterialButton(
                color: Color.fromRGBO(143, 50, 49, 1),
                child: const Text(
                  'LINCO',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    firstTextIndex = 1 - firstTextIndex;
                  });
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: MaterialButton(
                color: Colors.orange[300],
                child: const Text(
                  'MEMBERSHIP LIST',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    secondTextIndex = 1 - secondTextIndex;
                  });
                },
              ),
            ),
          ],
        ),
        Expanded(
          child: Container(
            color: Color.fromRGBO(9, 56, 53, 1),
            // width: 160,
            // height:
            // height: 400,
            //  MediaQuery.of(context).size.height,
          
            child: const VerticalMarqueeText(
              marqueeDirection: MarqueeDirection.btt,
              textAlign: TextAlign.start,
              // alwaysScroll: true,
              text: TextSpan(
                children: <InlineSpan>[
                  TextSpan(
                    text: '''TASKS COLLECTORS  FOR THE DAY,
           0806575****                  NGN1400
          0803296****                  NGN3200
          0803725****                  NGN850
          0803294****                  NGN4500
          0803947****                  NGN4300
          0803859****                  NGN3200
          0803945****                  NGN3500
          0806575****                  NGN1400
          0803296****                  NGN3200
          0803725****                  NGN850
          0803294****                  NGN4500
          0803947****                  NGN4300
          0803859****                  NGN3200
          0803945****                  NGN3500
          0806575****                  NGN1400
          0803296****                  NGN3200
          0803725****                  NGN850
          0803294****                  NGN4500
          0803947****                  NGN4300
          0803859****                  NGN3200
          0803945****                  NGN3500
          0806575****                  NGN1400
          0803296****                  NGN3200
          0803725****                  NGN850
          0803294****                  NGN4500
          0803947****                  NGN4300
          0803859****                  NGN3200
          0803945****                  NGN3500
          
          ''',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: '''0806575****       NGN1400,
          
          0806575****                  NGN1400
          0803296****                  NGN3200
          0803725****                  NGN850
          0803294****                  NGN4500
          0803947****                  NGN4300
          0803859****                  NGN3200
          0803945****                  NGN3500
          0806575****                  NGN1400
          0803296****                  NGN3200
          0803725****                  NGN850
          0803294****                  NGN4500
          0803947****                  NGN4300
          0803859****                  NGN3200
          0803945****                  NGN3500
          0806575****                  NGN1400
          0803296****                  NGN3200
          0803725****                  NGN850
          0803294****                  NGN4500
          0803947****                  NGN4300
          0803859****                  NGN3200
          0803945****                  NGN3500
          0806575****                  NGN1400
          0803296****                  NGN3200
          0803725****                  NGN850
          0803294****                  NGN4500
          0803947****                  NGN4300
          0803859****                  NGN3200
          0803945****                  NGN3500
          
          ''',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              speed: 30,
            ),
          ),
        ),
      ],
    );
  }
}
