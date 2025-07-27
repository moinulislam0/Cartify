import 'package:bkash/bkash.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';
import 'package:get/get.dart';

void onButtonTap(
  String Selected,
) async {
  switch (Selected.toLowerCase()) {
    case 'bkash':
      bkashPayment();
      break;
    case 'sslcommerz':
      sslCommerz();
      break;

    default:
      print("No gateway selected");
  }
}

double totalPrice = 10.00;
final bkash = Bkash(logResponse: true);
bkashPayment() async {
  try {
    final response = await bkash.pay(
        context: Get.context!,
        amount: totalPrice,
        merchantInvoiceNumber: "Test018452");
    print(response.trxId);
  } on BkashFailure catch (e) {
    print(e.message);
  }
}

sslCommerz() async {
  Sslcommerz sslcommerz = Sslcommerz(
      initializer: SSLCommerzInitialization(
          //   ipn_url: "www.ipnurl.com",
          multi_card_name: "visa,master,bkash",
          currency: SSLCurrencyType.BDT,
          product_category: "E-Commerce",
          sdkType: SSLCSdkType.TESTBOX,
          store_id: "moinu68844f1f59567",
          store_passwd: "moinu68844f1f59567@ssl",
          total_amount: totalPrice,
          tran_id: "TestTRx001"));
  sslcommerz.payNow();
}
