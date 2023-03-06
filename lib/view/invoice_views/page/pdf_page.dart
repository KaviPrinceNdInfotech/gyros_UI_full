




import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:invoice1/api/pdf_api.dart';
// import 'package:invoice1/api/pdf_invoice_api.dart';
// import 'package:invoice1/main.dart';
// import 'package:invoice1/model/customer.dart';
// import 'package:invoice1/model/invoice.dart';
// import 'package:invoice1/model/my_invoice.dart';
// import 'package:invoice1/model/supplier.dart';
// import 'package:invoice1/widget/button_widget.dart';
// import 'package:invoice1/widget/title_widget.dart';
import 'package:http/http.dart' as http;

import '../../../controllers/get_profile/get_profile_controller.dart';
import '../../../controllers/invoice_controller/invoice_controller.dart';
import '../../../controllers/pdf_invoice_controller/pdf_controller.dart';
import '../../../main.dart';
import '../../home_page/home_page_controller.dart';
import '../api/pdf_api.dart';
import '../api/pdf_invoice_api.dart';
import '../model/customer.dart';
import '../model/invoice.dart';
import '../model/my_invoice.dart';
import '../model/supplier.dart';
import '../widget/button_widget.dart';
import '../widget/title_widget.dart';

class PdfPage extends StatelessWidget {
   PdfPage({Key? key}) : super(key: key);
 // HomePageController _homePageController = Get.put(HomePageController());
   InvoiceController _invoiceController = Get.put(InvoiceController());
   GetProfileController _getProfileController = Get.put(GetProfileController());
  @override

  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return  Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(

          MyApp.title,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body:


         Container(
            padding: EdgeInsets.all(32),
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TitleWidget(
                      icon: Icons.picture_as_pdf,
                      text: 'Generate Invoice',
                    ),
                    const SizedBox(height: 48),
                    //     () => (_invoiceController.isLoading.value)
                    //     ? Center(child: CircularProgressIndicator())
                    //     :_invoiceController.getinvoidelist!.result!.isEmpty
                    //     ? Center(
                    //   child: Text('No List'),
                    // )



              ButtonWidget(
                text: 'Invoice PDF',
                onClicked: () async {
                   print("jkijmbjobmo: ${_invoiceController.getinvoidelist?.result?.first.invoice.toString()}");

                  final date = DateTime.now();
                  final dueDate = date.add(Duration(days: 7));

                  final invoice = Invoice(
                    supplier: Supplier(
                      // name: "${ _getProfileController.orderHistoryModel!.result[0].productName.toString()}",
                      name: "${_invoiceController.getinvoidelist?.name.toString()}",
                      email: "${_invoiceController.getinvoidelist?.email.toString()}",
                      address: "${_invoiceController.getinvoidelist?.address.toString()}",
                      mobile: "${_invoiceController.getinvoidelist?.mobile.toString()}",
                      pin: "${_invoiceController.getinvoidelist?.pinCode.toString()}",
                      returnPolicy:
                      'If the item is defective or not as described,you may return it during delivery directly or you may request for'
                          'return within 10 days of delivery for items that are defective or are different from what you ordered.'
                          ' items must be complete, free from damages and for items returned for being different from what you '
                          'ordred, they must be unopened as well.',
                      office:
                      'Gyros private limited,2nd floor,plot No. 82,Noida,UttarPradesh',
                    ),
                    customer: Customer(
                        order: "${_invoiceController.getinvoidelist
                            ?.result?.first.orderStatus
                            .toString()}",
                        invoiceNumber:
                        "${_invoiceController.getinvoidelist?.result?.first.invoice.toString()}",
                        paymentMethod:
                        "${_invoiceController.getinvoidelist?.result
                            ?.first.paymentMode.toString()}",
                        totalItems:
                        "${_invoiceController.getinvoidelist?.result
                            ?.first.totalItem.toString()}"
                      /* name: 'Apple Inc.',
                                       address: 'Apple Street, Cupertino, CA 95014',*/
                    ),
                    info: InvoiceInfo(
                      // orderDate: items.date,
                      // invoiceDate: items.date,
                      orderDate: DateTime.now(),
                      invoiceDate: DateTime.now(),
                      orderStatus: "${_invoiceController.getinvoidelist?.result?.first.orderStatus.toString()}",
                      paymentStatus: "${_invoiceController.getinvoidelist?.result?.first.paymentStatus.toString()}",
                    ),
                    items: [
                      InvoiceItem(
                        // description: "${_invoiceController.getinvoidelist?.result?.first.productName.toString()}",
                        description: "${_invoiceController.getinvoidelist!.result![0].productName.toString()}",
                        // date: DateTime.now(),
                        quantity: 0,
                        vat: 0,
                        unitPrice: 0,

                      ),
                      // InvoiceItem(
                      //   description: 'Mango',
                      //   // date: DateTime.now(),
                      //   quantity: 3,
                      //   vat: 0.19,
                      //   unitPrice: 2.99.toDouble(),
                      // ),
                      // InvoiceItem(
                      //   description: 'Onion',
                      //   // date: DateTime.now(),
                      //   quantity: 8,
                      //   vat: 0.19,
                      //   unitPrice: 3.99.toDouble(),
                      // ),
                      // InvoiceItem(
                      //   description: 'Carrot',
                      //   // date: DateTime.now(),
                      //   quantity: 1,
                      //   vat: 0.19,
                      //   unitPrice: 1.59.toDouble(),
                      // ),
                      // InvoiceItem(
                      //   description: 'Papaya',
                      //   //date: DateTime.now(),
                      //   quantity: 5,
                      //   vat: 0.19,
                      //   unitPrice: 0.99.toDouble(),
                      // ),
                      // InvoiceItem(
                      //   description: 'Pumpkin',
                      //   //date: DateTime.now(),
                      //   quantity: 4,
                      //   vat: 0.19,
                      //   unitPrice: 1.29.toDouble(),
                      // ),
                    ],
                  );

                  final pdfFile = await PdfInvoiceApi.generate(
                      invoice);

                  PdfApi.openFile(pdfFile);
                },
              )





                    ///old code
                    // FutureBuilder<Result2>(
                    //     future: _getData(),
                    //     builder: (context, snapshot) {
                    //       if (snapshot.hasData) {
                    //         var items = snapshot.data;
                    //         return ButtonWidget(
                    //           text: 'Invoice PDF',
                    //           onClicked: () async {
                    //             final date = DateTime.now();
                    //             final dueDate = date.add(Duration(days: 7));
                    //
                    //             final invoice = Invoice(
                    //               supplier: Supplier(
                    //                 name: 'Name: ${items!.name.toString()}',
                    //                 email: 'Email: ${items.email}',
                    //                 address: 'Address: ${items.address}',
                    //                 mobile: 'Mobile no: ${items.mobile}',
                    //                 pin: 'Pin: ${items.pinCode}',
                    //                 returnPolicy:
                    //                     'If the item is defective or not as described,you may return it during delivery directly or you may request for'
                    //                     'return within 10 days of delivery for items that are defective or are different from what you ordered.'
                    //                     ' items must be complete, free from damages and for items returned for being different from what you '
                    //                     'ordred, they must be unopened as well.',
                    //                 office:
                    //                     'Gyros private limited,2nd floor,plot No. 82,Noida,UttarPradesh',
                    //               ),
                    //               customer: Customer(
                    //                   order: 'OrderId: ${items.id.toString()}',
                    //                   invoiceNumber:
                    //                       'Invoice number: ${items.userId.toString()}',
                    //                   paymentMethod:
                    //                       'Payment method: ${items.paymentMode}',
                    //                   totalItems:
                    //                       'Total items: ${items.totalItem.toString()}'
                    //                   /* name: 'Apple Inc.',
                    //                address: 'Apple Street, Cupertino, CA 95014',*/
                    //                   ),
                    //               info: InvoiceInfo(
                    //                 // orderDate: items.date,
                    //                 // invoiceDate: items.date,
                    //                 orderDate: DateTime.now(),
                    //                 invoiceDate: DateTime.now(),
                    //                 orderStatus: items.orderStatus.toString(),
                    //                 paymentStatus: items.paymentStatus.toString(),
                    //               ),
                    //               items: [
                    //                 InvoiceItem(
                    //                   description: items.productName.toString(),
                    //                   // date: DateTime.now(),
                    //                   quantity: 8,
                    //                   vat: 0.19,
                    //                   unitPrice: items.price!.toDouble(),
                    //                 ),
                    //                 InvoiceItem(
                    //                   description: 'Mango',
                    //                   // date: DateTime.now(),
                    //                   quantity: 3,
                    //                   vat: 0.19,
                    //                   unitPrice: 2.99.toDouble(),
                    //                 ),
                    //                 InvoiceItem(
                    //                   description: 'Onion',
                    //                   // date: DateTime.now(),
                    //                   quantity: 8,
                    //                   vat: 0.19,
                    //                   unitPrice: 3.99.toDouble(),
                    //                 ),
                    //                 InvoiceItem(
                    //                   description: 'Carrot',
                    //                   // date: DateTime.now(),
                    //                   quantity: 1,
                    //                   vat: 0.19,
                    //                   unitPrice: 1.59.toDouble(),
                    //                 ),
                    //                 InvoiceItem(
                    //                   description: 'Papaya',
                    //                   //date: DateTime.now(),
                    //                   quantity: 5,
                    //                   vat: 0.19,
                    //                   unitPrice: 0.99.toDouble(),
                    //                 ),
                    //                 InvoiceItem(
                    //                   description: 'Pumpkin',
                    //                   //date: DateTime.now(),
                    //                   quantity: 4,
                    //                   vat: 0.19,
                    //                   unitPrice: 1.29.toDouble(),
                    //                 ),
                    //               ],
                    //             );
                    //
                    //             final pdfFile = await PdfInvoiceApi.generate(invoice);
                    //
                    //             PdfApi.openFile(pdfFile);
                    //           },
                    //         );
                    //       } else if (snapshot.hasError) {
                    //         return Text(
                    //           "${snapshot.error}",
                    //           style: GoogleFonts.roboto(
                    //             fontWeight: FontWeight.w300,
                    //           ),
                    //         );
                    //       }
                    //       return Center(child: CircularProgressIndicator());
                    //     })
                  ],
                )),
          ),


    );
  }
}







// class PdfPage extends StatefulWidget {
//   @override
//   _PdfPageState createState() => _PdfPageState();
// }
//
// class _PdfPageState extends State<PdfPage> {
//   static String Id = ''.toString();
//   static String invoice = ''.toString();
//   var prefs = GetStorage();
//   Future<Result2>? list;
//
//   @override
//   void initState() {
//     super.initState();
//     list = _getData();
//   }

  // Future<Result2> _getData() async {
  //   var prefs = GetStorage();
  //   //saved id..........
  //   //prefs.write("Id".toString(), json.decode(r.body)['Id']);
  //   invoice = prefs.read("invoice").toString();
  //   print('&&&&&&&&&&&&&&&&&&&&&&:${Invoice}');
  //   // String url = 'https://api.gyros.farm/api/Order/Invoice/$Id';
  //   String url = 'https://api.gyros.farm/api/Order/InvoiceV1/$invoice ';
  //   final response = await http.get(Uri.parse(url));
  //   if (response.statusCode == 200) {
  //     final data = json.decode(response.body) as Map<String, dynamic>;
  //     var myData = Result2.fromJson(data['result']);
  //     print('&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&: ${myData.id.toString()}');
  //     return myData;
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }

  // @override
  // Widget build(BuildContext context) {
  //   Size size = MediaQuery.of(context).size;
    // return  Scaffold(
    //   backgroundColor: Colors.black,
    //   appBar: AppBar(
    //     title: Text(
    //
    //       MyApp.title,
    //       style: GoogleFonts.roboto(
    //         fontWeight: FontWeight.w600,
    //       ),
    //     ),
    //     centerTitle: true,
    //   ),
    //   body: Container(
    //     padding: EdgeInsets.all(32),
    //     child: Center(
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: <Widget>[
    //             TitleWidget(
    //               icon: Icons.picture_as_pdf,
    //               text: 'Generate Invoice',
    //             ),
    //             const SizedBox(height: 48),
    //             ///Test
    //           //  "Save:${_homePageController.getflashsellproduct!.result![index].discountPercentage.toString()}%"
    //
    //       ButtonWidget(
    //         text: 'Invoice PDF',
    //         onClicked: () async {
    //           final date = DateTime.now();
    //           final dueDate = date.add(Duration(days: 7));
    //
    //           final invoice = Invoice(
    //             supplier: Supplier(
    //               name: "Save:${_homePageController.getflashsellproduct!.result![index].discountPercentage.toString()}%",
    //               email: 'singhricha0902@gmail.com',
    //               address: 'Modinagar',
    //               mobile: '7456889457',
    //               pin: '201204',
    //               returnPolicy:
    //               'If the item is defective or not as described,you may return it during delivery directly or you may request for'
    //                   'return within 10 days of delivery for items that are defective or are different from what you ordered.'
    //                   ' items must be complete, free from damages and for items returned for being different from what you '
    //                   'ordred, they must be unopened as well.',
    //               office:
    //               'Gyros private limited,2nd floor,plot No. 82,Noida,UttarPradesh',
    //             ),
    //             customer: Customer(
    //                 order: '5',
    //                 invoiceNumber:
    //                 '5',
    //                 paymentMethod:
    //                 'cod',
    //                 totalItems:
    //                 '2'
    //               /* name: 'Apple Inc.',
    //                            address: 'Apple Street, Cupertino, CA 95014',*/
    //             ),
    //             info: InvoiceInfo(
    //               // orderDate: items.date,
    //               // invoiceDate: items.date,
    //               orderDate: DateTime.now(),
    //               invoiceDate: DateTime.now(),
    //               orderStatus: 'done',
    //               paymentStatus: 'done',
    //             ),
    //             items: [
    //               InvoiceItem(
    //                 description: 'done',
    //                 // date: DateTime.now(),
    //                 quantity: 8,
    //                 vat: 0.19,
    //                 unitPrice: 2,
    //               ),
    //               InvoiceItem(
    //                 description: 'Mango',
    //                 // date: DateTime.now(),
    //                 quantity: 3,
    //                 vat: 0.19,
    //                 unitPrice: 2.99.toDouble(),
    //               ),
    //               InvoiceItem(
    //                 description: 'Onion',
    //                 // date: DateTime.now(),
    //                 quantity: 8,
    //                 vat: 0.19,
    //                 unitPrice: 3.99.toDouble(),
    //               ),
    //               InvoiceItem(
    //                 description: 'Carrot',
    //                 // date: DateTime.now(),
    //                 quantity: 1,
    //                 vat: 0.19,
    //                 unitPrice: 1.59.toDouble(),
    //               ),
    //               InvoiceItem(
    //                 description: 'Papaya',
    //                 //date: DateTime.now(),
    //                 quantity: 5,
    //                 vat: 0.19,
    //                 unitPrice: 0.99.toDouble(),
    //               ),
    //               InvoiceItem(
    //                 description: 'Pumpkin',
    //                 //date: DateTime.now(),
    //                 quantity: 4,
    //                 vat: 0.19,
    //                 unitPrice: 1.29.toDouble(),
    //               ),
    //             ],
    //           );
    //
    //           final pdfFile = await PdfInvoiceApi.generate(invoice);
    //
    //           PdfApi.openFile(pdfFile);
    //         },
    //       )
    //
    //
    //
    //             ///old code
    //             // FutureBuilder<Result2>(
    //             //     future: _getData(),
    //             //     builder: (context, snapshot) {
    //             //       if (snapshot.hasData) {
    //             //         var items = snapshot.data;
    //             //         return ButtonWidget(
    //             //           text: 'Invoice PDF',
    //             //           onClicked: () async {
    //             //             final date = DateTime.now();
    //             //             final dueDate = date.add(Duration(days: 7));
    //             //
    //             //             final invoice = Invoice(
    //             //               supplier: Supplier(
    //             //                 name: 'Name: ${items!.name.toString()}',
    //             //                 email: 'Email: ${items.email}',
    //             //                 address: 'Address: ${items.address}',
    //             //                 mobile: 'Mobile no: ${items.mobile}',
    //             //                 pin: 'Pin: ${items.pinCode}',
    //             //                 returnPolicy:
    //             //                     'If the item is defective or not as described,you may return it during delivery directly or you may request for'
    //             //                     'return within 10 days of delivery for items that are defective or are different from what you ordered.'
    //             //                     ' items must be complete, free from damages and for items returned for being different from what you '
    //             //                     'ordred, they must be unopened as well.',
    //             //                 office:
    //             //                     'Gyros private limited,2nd floor,plot No. 82,Noida,UttarPradesh',
    //             //               ),
    //             //               customer: Customer(
    //             //                   order: 'OrderId: ${items.id.toString()}',
    //             //                   invoiceNumber:
    //             //                       'Invoice number: ${items.userId.toString()}',
    //             //                   paymentMethod:
    //             //                       'Payment method: ${items.paymentMode}',
    //             //                   totalItems:
    //             //                       'Total items: ${items.totalItem.toString()}'
    //             //                   /* name: 'Apple Inc.',
    //             //                address: 'Apple Street, Cupertino, CA 95014',*/
    //             //                   ),
    //             //               info: InvoiceInfo(
    //             //                 // orderDate: items.date,
    //             //                 // invoiceDate: items.date,
    //             //                 orderDate: DateTime.now(),
    //             //                 invoiceDate: DateTime.now(),
    //             //                 orderStatus: items.orderStatus.toString(),
    //             //                 paymentStatus: items.paymentStatus.toString(),
    //             //               ),
    //             //               items: [
    //             //                 InvoiceItem(
    //             //                   description: items.productName.toString(),
    //             //                   // date: DateTime.now(),
    //             //                   quantity: 8,
    //             //                   vat: 0.19,
    //             //                   unitPrice: items.price!.toDouble(),
    //             //                 ),
    //             //                 InvoiceItem(
    //             //                   description: 'Mango',
    //             //                   // date: DateTime.now(),
    //             //                   quantity: 3,
    //             //                   vat: 0.19,
    //             //                   unitPrice: 2.99.toDouble(),
    //             //                 ),
    //             //                 InvoiceItem(
    //             //                   description: 'Onion',
    //             //                   // date: DateTime.now(),
    //             //                   quantity: 8,
    //             //                   vat: 0.19,
    //             //                   unitPrice: 3.99.toDouble(),
    //             //                 ),
    //             //                 InvoiceItem(
    //             //                   description: 'Carrot',
    //             //                   // date: DateTime.now(),
    //             //                   quantity: 1,
    //             //                   vat: 0.19,
    //             //                   unitPrice: 1.59.toDouble(),
    //             //                 ),
    //             //                 InvoiceItem(
    //             //                   description: 'Papaya',
    //             //                   //date: DateTime.now(),
    //             //                   quantity: 5,
    //             //                   vat: 0.19,
    //             //                   unitPrice: 0.99.toDouble(),
    //             //                 ),
    //             //                 InvoiceItem(
    //             //                   description: 'Pumpkin',
    //             //                   //date: DateTime.now(),
    //             //                   quantity: 4,
    //             //                   vat: 0.19,
    //             //                   unitPrice: 1.29.toDouble(),
    //             //                 ),
    //             //               ],
    //             //             );
    //             //
    //             //             final pdfFile = await PdfInvoiceApi.generate(invoice);
    //             //
    //             //             PdfApi.openFile(pdfFile);
    //             //           },
    //             //         );
    //             //       } else if (snapshot.hasError) {
    //             //         return Text(
    //             //           "${snapshot.error}",
    //             //           style: GoogleFonts.roboto(
    //             //             fontWeight: FontWeight.w300,
    //             //           ),
    //             //         );
    //             //       }
    //             //       return Center(child: CircularProgressIndicator());
    //             //     })
    //           ],
    //         )),
    //   ),
    // );
//   }
// }
