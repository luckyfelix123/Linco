// import 'package:flutter/material.dart';
// import 'package:spreadsheet_table/spreadsheet_table.dart';

// class MyApps extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(),
//         body: SpreadsheetTable(
        
  
  
          
//           cellBuilder: (_, int rows, int col) =>
//               Center(child:   Column(  
//                 children: [  
//                   Row(  
//                     children: [  
//                        Text(
//                 // 'test $rows/$col' 
//                 'yes'
//                 ),
//                     ],
//                   ),
                  
//                 ],
//               )
//               // Text(
//               //   // 'test $rows/$col' 
//               //   'trivj'
//               //   ),
              
//               ),
//           legendBuilder: (_) => Center(child: Text('Legend')),
//           rowHeaderBuilder: (_, index) => Center(child: Text('VIP $index')),
//           colHeaderBuilder: (_, index) => Center(child: Text('Col $index')),
//           rowsCount: 100,
//           colCount: 15,
//         ),
//       ),
//     );
//   }
// }