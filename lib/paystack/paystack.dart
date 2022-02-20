// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:linco/paystack/payment.dart';


// class PayStack extends StatefulWidget {
//   const PayStack({Key key}) : super(key: key);

//   @override
//   _PayStackState createState() => _PayStackState();
// }

// ScrollController scrollController = ScrollController();

// final _controller = TextEditingController();

// class _PayStackState extends State<PayStack> {
//   int selectedIndex;
//   int price = 0;
//   int prices = 0;
//   String email = 'luckyfelix.o.505@gmail.com';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
    
//       backgroundColor: Color.fromRGBO(34, 57, 89, 1),
//       body: Container(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           children: [
//             SizedBox(
//               height: 20,
//             ),
// Row(  
//   children: [  
//     GestureDetector(  
//       onTap: (){  
//         // Navigator.push(context, MaterialPageRoute(builder: (_)=> PaymentGateWay(),),);
//       },
//       child: Icon(Icons.arrow_back,size: 25,))
//   ],
// ),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
//               alignment: Alignment.center,
//               child: Text(
//                 'Note: you will be charge 30% per transaction',
//                 style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             // Expanded(
//             //   child: GridView(
//             //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             //         crossAxisCount: 2,
//             //         crossAxisSpacing: 5,
//             //         mainAxisSpacing: 10),
//             //     children: List.generate(plans.length, (index) {
//             //       final data = plans[index];
//             //       return GestureDetector(
//             //         onTap: () {
//             //           setState(() {
//             //             selectedIndex = index;
//             //             price = data['price'];
//             //           });
//             //         },
//             //         child: Card(
//             //           shadowColor: Colors.red,
//             //           elevation: 5,
//             //           child: Container(
//             //             decoration: BoxDecoration(
//             //                 color: selectedIndex == null
//             //                     ? null
//             //                     : selectedIndex == index
//             //                         ? Colors.red
//             //                         : null),
//             //             padding: EdgeInsets.all(49),
//             //             child: Column(
//             //               children: [
//             //                 Text(
//             //                   "N${data['price']}",
//             //                   style: TextStyle(
//             //                       fontSize: 20, fontWeight: FontWeight.bold),
//             //                 ),
//             //                 // Text("${data['product']}")
//             //               ],
//             //             ),
//             //           ),
//             //         ),
//             //       );
//             //     }),
//             //   ),
//             // ),

//             SizedBox(
//               height: 10,
//             ),
//             Container(
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(16), color: Colors.grey),
//               child: TextFormField(
//                 keyboardType: TextInputType.phone,
//                 controller: _controller,
//                 autofocus: true,
//                 decoration: InputDecoration(
//                     prefixIcon: Icon(
//                       Icons.money,
//                       size: 24,
//                       color: Color.fromRGBO(34, 57, 89, 1),
//                     ),
//                     border: InputBorder.none,
//                     hintText: '    Selected the amount you want'),
//               ),
//             ),
//             Text(''),
//             Text(''),
//             Text(''),
//             Text(''),
//             Text(''),
//             Container(
//               child: Text(''),
//             ),
//             Text(''),
//             GestureDetector(
//                 onTap: () {
//                   if (_controller.text.isEmpty) {
//                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                       content: Text(
//                         'You cant leave it empty,Please select amount',
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, color: Colors.white),
//                       ),
//                     ));
//                   } else {
//                     Center(
//                       child: CupertinoActivityIndicator(),
//                     );

//                     MakePayemnet(
//                       ctx: context,
//                       email: email,
//                       plan: price,
//                       price: int.parse(_controller.text.toString()) * 100,
//                     ).chargeCardpluginPayment();
//                   }
//                   _controller.clear();
//                   setState(() {
                    
//                   });
//                 },
//                 child: Container(
//                   padding: EdgeInsets.all(15),
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(18),
//                       color: Colors.red[200]),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(
//                         Icons.security_sharp,
//                         color: Color.fromRGBO(34, 57, 89, 1),
//                       ),
//                       Text('Proceed to Payment')
//                     ],
//                   ),
//                 ))
//           ],
//         ),
//       ),
//     );
//   }

//   final plans = [
//     {'price': 500, 'itmes': 4, 'product': 4},
//     {'price': 100, 'itmes': 4, 'product': 4},
//     {'price': 3000, 'itmes': 4, 'product': 4},
//     {'price': 4000, 'itmes': 4, 'product': 4},
//     {'price': 4000, 'itmes': 4, 'product': 4},
//     {'price': 4000, 'itmes': 4, 'product': 4},
//     {'price': 4000, 'itmes': 4, 'product': 4},
//     {'price': 4000, 'itmes': 4, 'product': 4},
//     {'price': 4000, 'itmes': 4, 'product': 4},
//     {'price': 4000, 'itmes': 4, 'product': 4},
//   ];
// }
