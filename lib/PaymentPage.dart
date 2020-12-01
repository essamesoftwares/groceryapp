import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final razorpay = Razorpay();

  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, externalWallet);
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, paySuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, payError);
    super.initState();
  }

  void paySuccess(PaymentSuccessResponse response) {
    print('successfully paid');
    print(response.paymentId.toString());
  }

  void payError(PaymentFailureResponse response) {
    print('failed');
    print(response.message + response.code.toString());
  }

  void externalWallet(ExternalWalletResponse response) {
    print('externalwallet');
    print(response.walletName);
  }

  getPayment() {
    var option = {
      'key': 'rzp_test_q6393U5x52Qfbn',
      'amount': double.parse(controller.text.trim()) * 100,
      'name': 'sample',
      //'order_id': '${controller.text.trim()}',
      'prefill': {'contact': '1234567890', 'email': 'sample@gmail.com'},
    };

    try {
      razorpay.open(option);
    } catch (e) {
      print('error is $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          TextField(
            controller: controller,
            keyboardType: TextInputType.number,
          ),
          RaisedButton(child: Text('pay'), onPressed: () => getPayment()),
        ],
      ),
    );
  }
}
