// // import 'package:http/http.dart' as http;
// //
// // class ApiProvider {
// //   static getVastuMallApi() async {
// //     var url = "https://api.gyros.farm/api/AdminApi/AllSubcategory";
// //     http.Response r = await http.get(Uri.parse(url));
// //     print(r.body.toString());
// //     return r;
// //   }
//
// import 'package:get/get.dart';
// import 'package:gyros_app/widgets/circular_loader.dart';
// import 'package:http/http.dart' as http;
//
// import 'getProductModel.dart';
// import 'models/productDetailsModel.dart';
// // import 'package:nike_shoe/Model/getProductModel.dart';
//
// class ApiProviders {
//   static var baseUrl = 'https://api.gyros.farm/';
//
//   static getAllProduct() async {
//     var url = baseUrl + 'api/AdminApi/AllSubcategory';
//     try {
//       http.Response r = await http.get(Uri.parse(url));
//       print(r.statusCode);
//       print(r.body);
//       if (r.statusCode == 200) {
//         GetProductModel getProductModel = getProductModelFromJson(r.body);
//         return getProductModel;
//       } else {}
//     } catch (error) {
//       return error;
//     }
//   }
//
//
//   static getProductDetails(var id) async {
//     var url = baseUrl + 'api/AdminApi/FlaseSaleSubList/$id';
//     try {
//       http.Response r = await http.get(Uri.parse(url));
//       print(r.body);
//       print(r.statusCode);
//
//       if (r.statusCode == 200) {
//         GetProductDetailModel getProductDetailModel =
//         getProductDetailModelFromJson(r.body);
//         return getProductDetailModel;
//       }
//     } catch (error) {
//       return error;
//     }
//   }
//
//   static postReview(
//       var name,
//       var email,
//       var title,
//       var description,
//       var mobile,
//       var rating1,
//       var rating2,
//       var rating3,
//       var rating4,
//       var rating5,
//       var imagePath) async {
//     var headers = {
//       'productid': '98',
//       'Name': '$name',
//       'Email': '$email',
//       'Description': '$description',
//       'Mobile': '$mobile',
//       'Title': '$title',
//       'Rating1': '$rating1',
//       'Rating2': '$rating2',
//       'Rating3': '$rating3',
//       'Rating4': '$rating4',
//       'Rating5': '$rating5'
//     };
//
//     print(name);
//     print(email);
//     print(title);
//     print(description);
//     print(mobile);
//     print(rating1);
//     print(rating2);
//     print(rating3);
//     print(rating4);
//     print(rating5);
//     print(imagePath);
//     try {
//       var url = baseUrl + '/api/FileUpload/Upload';
//       var request = http.MultipartRequest('POST', Uri.parse(url));
//       request.files.add(await http.MultipartFile.fromPath('image', imagePath));
//       request.headers.addAll(headers);
//       http.StreamedResponse response = await request.send();
//       http.Response r = await http.Response.fromStream(response);
//       print(r.statusCode);
//       print(r.body);
//       if (r.statusCode == 200) {
//         return r;
//       } else {
//         CallLoader.hideLoader();
//         Get.snackbar('Error', r.body);
//         return r;
//       }
//     } catch (e) {
//       print('Error');
//       print(e.toString());
//     }
//   }
// }