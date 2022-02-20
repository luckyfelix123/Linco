import 'package:flutter/material.dart';
class Intend extends StatelessWidget {
  const Intend({ Key  key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return 
          Container(
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
                        'Intend',
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(201, 194, 202, 1),),
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
                        'Task:5 daily',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(174, 169, 182, 1)),
                      ),
                    ],
                  ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      SizedBox(
                        width: 10,
                      ),
                    
                    
                      SizedBox(
                        width: 170,
                      ),
                      Text(
                        'Last for only 3 days',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(211, 120, 24,1),
                            ),
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
                        'NGN85 per task',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(174, 169, 182, 1),),
                      ),
                      SizedBox(
                        width: 170,
                      ),
                      Text(
                        'NGN 00.0',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(211, 120, 24,1),
                            ),
                      ),
                    ],
                  ),
                
                ],
              ),

            
             
              


             
    );
  }
}