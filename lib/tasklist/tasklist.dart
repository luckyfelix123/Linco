import 'package:flutter/material.dart';
import 'package:linco/members.dart';
import 'package:linco/socialmedias/facebook.dart';
import 'package:linco/socialmedias/instagram.dart';
import 'package:linco/socialmedias/youtube.dart';
import 'package:linco/tasklist/completed.dart';
import 'package:linco/tasklist/failed.dart';
import 'package:linco/tasklist/task.dart';

import 'audition.dart';

class TaskList extends StatefulWidget {
  const TaskList({Key  key}) : super(key: key);

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Task'),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(15, 51, 63, 4),
            // backgroundColor: Color.fromRGBO(143, 50, 49, 1),
            toolbarHeight: 100,
            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 5,
              tabs: [
                Text('Task',style: TextStyle(fontSize: 15,),),
                Text('Audition',style: TextStyle(fontSize: 15,),),
                // Text('Completed',style: TextStyle(fontSize: 14,),),
                // Text('Failed',style: TextStyle(fontSize: 15,),),
              ],
            )),
        body: TabBarView(
          children: [
            Task(),
            Audition(),
            // CardProduct(),
                        // Completed(),

            // Failed(),
           
          ],
        ),
      ),
    );
  }
}
