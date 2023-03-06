import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gyros_app/controllers/invoice_controller/invoice_controller.dart';
import 'package:intl/intl.dart';
InvoiceController _invoiceController = Get.put(InvoiceController());
class Utils {
  static formatPrice(double price) => ' ${_invoiceController.getinvoidelist!.result![0].price.toString()
      //.toStringAsFixed(2)
  }';
  static formatDate(DateTime date) => DateFormat.yMd().format(date);
}
