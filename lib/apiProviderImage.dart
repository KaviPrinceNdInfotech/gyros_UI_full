// ignore_for_file: avoid_print, file_names

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gyros_app/widgets/circular_loader.dart';
import 'package:http/http.dart' as http;


import '../models/productDetailsModel.dart';
import 'getProductModel.dart';

class ApiProviders {
  static var baseUrl = 'https://api.gyros.farm/';

  static getAllProduct() async {
    var url = baseUrl + 'api/AdminApi/AllSubcategory';
    try {
      http.Response r = await http.get(Uri.parse(url));

      if (r.statusCode == 200) {
        GetProductModel getProductModel = getProductModelFromJson(r.body);
        return getProductModel;
      } else {}
    } catch (error) {
      return error;
    }
  }

  static getProductDetails(var id) async {
    var url = baseUrl + 'api/AdminApi/FlaseSaleSubList/$id';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body);
      print(r.statusCode);

      if (r.statusCode == 200) {
        GetProductDetailModel getProductDetailModel =
        getProductDetailModelFromJson(r.body);
        return getProductDetailModel;
      }
    } catch (error) {
      return error;
    }
  }

  // static postReview(
  //     var name,
  //     var email,
  //     var title,
  //     var description,
  //     var mobile,
  //     var rating1,
  //     var rating2,
  //     var rating3,
  //     var rating4,
  //     var rating5,
  //     var imagePath
  //     )async {
  //   var headers = {
  //     'productid': '98',
  //     'Name': '$name',
  //     'Email': '$email',
  //     'Description': '$description',
  //     'Mobile': '$mobile',
  //     'Title': '$title',
  //     'Rating1': '$rating1',
  //     'Rating2': '$rating2',
  //     'Rating3': '$rating3',
  //     'Rating4': '$rating4',
  //     'Rating5': '$rating5'
  //   };
  //
  //   print(name);
  //   print(email);
  //   print(title);
  //   print(description);
  //   print(mobile);
  //   print(rating1);
  //   print(rating2);
  //   print(rating3);
  //   print(rating4);
  //   print(rating5);
  //   print(imagePath);
  //   try {
  //     var url = baseUrl + '/api/FileUpload/Upload';
  //     var request = http.MultipartRequest('POST', Uri.parse(url));
  //     request.files.add(await http.MultipartFile.fromPath('image', imagePath));
  //     request.headers.addAll(headers);
  //     http.StreamedResponse response = await request.send();
  //     http.Response r = await http.Response.fromStream(response);
  //     print(r.statusCode);
  //     print(r.body);
  //     if (r.statusCode == 200) {
  //       return r;
  //
  //     } else {
  //       CallLoader.hideLoader();
  //       Get.snackbar('Error', r.body);
  //       return r;
  //     }
  //   } catch (e) {
  //     print('Error');
  //     print(e.toString());
  //   }
  // }

  static postReview(
      var name,
      var mobile,
      var email,
      var description,
      var title,
      var rating1,
      var rating2,
      var rating3,
      var rating4,
      var rating5,
      var imagePath,
      var imagebase,

      )async {
    var headers = {
      'Name': '$name',
      'Mobile': '$mobile',
      'Email': '$email',
      'Description': '$description',
      'Title': '$title',
      'Rating1': '$rating1',
      'Rating2': '$rating2',
      'Rating3': '$rating3',
      'Rating4': '$rating4',
      'Rating5': '$rating5',
      'imagePath': '$imagePath',
      'imagebase': '$imagebase'

    };

    print(name);
    print(email);
    print(title);
    print(description);
    print(mobile);
    print(rating1);
    print(rating2);
    print(rating3);
    print(rating4);
    print(rating5);
    print(imagePath);
    try {
      var url = baseUrl + '/api/AdminApi/AddReview';
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.files.add(await http.MultipartFile.fromPath('image', imagePath));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      http.Response r = await http.Response.fromStream(response);
      print(r.statusCode);
      print(r.body);
      if (r.statusCode == 200) {
        return r;

      } else {
        CallLoader.hideLoader();
        Get.snackbar('Error', r.body);
        return r;
      }
    } catch (e) {
      print('Error');
      print(e.toString());
    }
  }


 }
