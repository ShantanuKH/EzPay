import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorpayPage extends StatefulWidget {
  RazorpayPage({super.key});

  @override
  State<RazorpayPage> createState() => _RazorpayPaageState();
}

class _RazorpayPaageState extends State<RazorpayPage> {
  late Razorpay _razorpay;
  TextEditingController amtController = TextEditingController();

  void openCheckout(amount) async {
    amount = amount *
        100; // We are multiplying this by 100 as in razorpay we specify the amount in point
    var options = {
      'key': 'rzp_test_1DP5nm0lF5G5ag',
      'amount': 'amount',
      'name': "Shnatanu Khadse",
      'prefill': {
        'contact': '7841837112',
        'email': 'shantanukhadse784@gmail.com'
      },
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint("Error: e");
    }
  }

  void handlePaymentSucce(PaymentSuccessResponse response){
    Fluttertoast.showToast(msg: "Payment Successful" + response.paymentId, toastLength: Toast.LENGTH_SHORT);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
