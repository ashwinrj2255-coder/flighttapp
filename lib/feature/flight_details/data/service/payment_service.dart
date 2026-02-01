import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentService {
  final Razorpay _razorpay = Razorpay();
  void init({
    required Function(PaymentSuccessResponse) onSuccess,
    required Function(PaymentFailureResponse) onError,
    required Function(ExternalWalletResponse) onExternalWallet,
  }) {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, onSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, onError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, onExternalWallet);
  }

  void openCheckout({
    required String? orderId,
    required int amount,
    required String email,
    required String phone,
  }) {
    final options = {
      'key': "rzp_test_1DP5mmOlF5G5ag",
      'amount': amount,
      'name': 'Fly Mate',
      'description': 'Flight Booking',
      if (orderId != null) 'order_id': orderId,
      'prefill': {
        'contact': phone,
        'email': email,
      },
    };
    _razorpay.open(options);
  }

  void dispose() {
    _razorpay.clear();
  }
}
