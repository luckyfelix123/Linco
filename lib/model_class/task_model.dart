import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {   

  final String  request;
  final String like;
  final int price;
 final  String status;
  final int  time;
 String  imageUrl;

 TaskModel({this.request,this.time,this.imageUrl,this.like,this.price,this.status});





 static  List<TaskModel> task =[   
TaskModel(  
request: 'Request',
like: 'Like and folllow',
price: 850,
status: 'Pending',
time: Timestamp.now().toDate().day.toInt(),
),

];



}
