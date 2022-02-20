import 'package:flutter/material.dart';
import 'package:linco/model_class/task_model.dart';

class Failed extends StatelessWidget {
  bool price =false;
  final  total = TaskModel.task;
  final index;
  
  // final TaskModel task;
  
   Failed({Key key,this.index,this.price,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     String total;

    return Scaffold(
      body:    ListView.builder(  
        itemCount: TaskModel.task.length,
        itemBuilder: (context, index) {   
        final tst = TaskModel.task[index];
          return 
            
      Column(
        children: [
          // SizedBox(
          //   height: 200,
          // ),
          GestureDetector(
            onTap: (){   
              final total = tst.price;
             if ( price==true){  
 tst.price * 10;

             } else {  

               
             }
            },
            child: Container(
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
                        width: 5,
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
                       '${tst.price}',
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
                      width: 5,
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
            // 'No more data',
           '${ tst.price}',
            style: TextStyle(fontSize: 16, ),
          )
        ],
      );
        },
       )
      
    );
  }
}
