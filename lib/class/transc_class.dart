// import 'package:http/http.dart' as http;
// import 'package:linco/model/transc_model.dart';

//  Future<Transaction> fetchAlbum() async {
//   // final _key = "fcccc2028e0006a39055337bee1ebac452041293";

//   final response = await http.get(Uri.parse(
//       // 'https://api.nomics.com/v1/currencies/ticker?key=$_key&interval=1d,30d&convert=EUR&per-page=100&page=1' 
//       "https://plaid.com/docs/api/products/#transfer-beta"
//       ));

//   print(response.statusCode);

//   if (response.statusCode == 200) {
//     ///success
//      final transaction = transactionFromJson(response.body);

//     return transaction;
//   } else {
//     ///Error
//     print(response.body);
//      final transaction = transactionFromJson(response.body);

//     return transaction;
//   }
// }