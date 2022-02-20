// import 'dart:io';


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_paystack/flutter_paystack.dart';
// import 'package:linco/vip1%20members/vip1_homepage.dart';

// import 'key.dart';

// class MakePayemnet {
//   MakePayemnet({this.ctx, this.price, this.email, int plan});
//   BuildContext ctx;
//   int price;
//   int plan;
//   String email;

//   String _getReference() {
//     String platform;
//     if (Platform.isIOS) {
//       platform = 'iOS';
//     } else {
//       platform = 'Android';
//     }

//     return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
//   }

//   PaymentCard _getCardUI() {
//     return PaymentCard(number: "", cvc: "", expiryMonth: 0, expiryYear: 0,country: "",);
//   }

//   PaystackPlugin paystack = PaystackPlugin();
//   Future initializePlugin() async {
//     await paystack.initialize(publicKey: ConstantKey.PAYSTACK_KEY);
//   }
//   // charging a card

//   chargeCardpluginPayment() async {
//     initializePlugin().then((_) async {
//       Charge charge = Charge();
//       charge.amount = price;
//       charge.email = email;
//       charge.reference = _getReference();
//       charge.card = _getCardUI();

//       CheckoutResponse response = await paystack.checkout(ctx,
//           charge: charge,
//           method: CheckoutMethod.card,
//           fullscreen: false,
          
//           logo: CircleAvatar(
//             backgroundImage: AssetImage('asset/a.jpeg'),
//           ));
//       print(' responds');
// if(response.status==true){  
 
// MyHomePages();
          
         
  
// }  else{  
  
// }
// //       if (response.status == true) {
// //         print('Transaction succefully');
// //         return Center(  
// //           child: GestureDetector(  
// //             onTap: (){        Navigator.push(context, MaterialPageRoute(builder: (_)=> MyHomePages())
// // },
// //           ),
// //         )
// //       } else {
        
// //         print('Transaction Failed');
// //       }
//    });
//   }
//  }


// // void Bottoms() {  
// //   showModalBottomSheet(
// //                 isScrollControlled: true,
// //                 context: (),
// //                 builder: (context) {
// //                   return Column(
// //                     children: [
// //                       Text('Succefulpayment'),
// //                       ElevatedButton(
// //                           onPressed: () {
// //                             Map<String, dynamic> map = {
// //                               'Charge':Charge(),
// //                               'price':charge.amount,
// //                               'email':charge.email,
// //                               'reference':_getReference(),
// //                               'card detail':charge.card
// //                             };
// //                             FirebaseFirestore.instance
// //                                 .collection('collectionPath')
// //                                 .add(map);

// //                             Navigator.push(
// //                               context,
// //                               MaterialPageRoute(builder: (_) => MyHomePages()),
// //                             );
// //                           },
// //                           child: Text('Next'))
// //                     ],
// //                   );
// //                 });

// // }