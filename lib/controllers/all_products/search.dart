// // import 'package:get/get.dart';
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class Users {
//   String productName;
//
//   Users({
//     required this.productName
// });
//   factory Users.fromJson(Map<String, dynamic> json) => Users(
//       productName: json["productName"]
//   );
// }
// Future <List<Users>> getUsers() async {
//   final response = await http.get(Uri.parse('https://api.gyros.farm/api/AdminApi/AllSubcategory'));
//   if(response.statusCode == 200){
//     var jsonResponse = json.decode(response.body);
//     List <Users> users  = [];
//     for (var u in jsonResponse){
//       Users user = Users(productName: u['productName']);
//       users.add(user);
//     }
//     return users;
//   }else{
//     throw Exception('Fail to load Post');
//   }
// }
//
//
// class Search extends StatefulWidget {
//   const Search({Key? key}) : super(key: key);
//   @override
//   State<Search> createState() => _SearchState();
// }
// class _SearchState extends State<Search> {
//   //final TextEditingController _controller = TextEditingController();
//   late Future<List<Users>> users;
//   @override
//   initState() {
//     super.initState();
//     users = getUsers();
//     //getApi("name");
//   }
//   List searchingList =[];
//   void getApi(String name) async {
//     var searchingList = await Test(name);
//   }
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Container(
//         child: ListView.builder(
//             padding: const EdgeInsets.all(8),
//             itemCount: searchingList.length,
//             itemBuilder: (BuildContext context, int index) {
//               return Container(
//                 height: 50,
//                 //color: Colors.amber[colorCodes[index]],
//                 child: Center(child:
//                 TextFormField(
//                   controller: _controller,
//                   decoration: const InputDecoration(border: OutlineInputBorder()),
//                 ),
//                // Text("_allProductController.allProductModel!.result![index].productName.toString()")
//                 ),
//               );
//             }
//         )
//       )
//
//       // Container(
//       //   height: 40,
//       //   width: 220,
//       //   child: TextField(
//       //     decoration: InputDecoration(
//       //       hintText: 'Search'
//       //     ),
//       //   ),
//       //   decoration: BoxDecoration(
//       //     border: Border.all(),
//       //     borderRadius: BorderRadius.circular(10)
//       //   ),
//       // ),
//     );
//   }
// }
// Future Test(String name) async {
//   print(name);
//   try {
//     final url = Uri.encodeFull('https://api.gyros.farm/api/AdminApi/AllSubcategory');
//     final response = await http.get(Uri.parse(url));
//     print("hgbjhgbjb"+ response.statusCode.toString());
//     switch (response.statusCode) {
//       case 200:
//         print("3252hgjhgj" +  response.statusCode.toString() + "mnnkl,mnlkj"+ response.body);
//         return json.decode(response.body);
//         default:
//           return null;
//
//     }
//   }
//   on SocketException {
//     return null;
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
//
