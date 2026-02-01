import 'package:flutter/cupertino.dart';
import 'package:flymate/feature/flight_details/data/service/payment_service.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentViewModel extends ChangeNotifier {
  final PaymentService _paymentService;

  PaymentViewModel(this._paymentService) {
    _paymentService.init(
      onSuccess: _onSuccess,
      onError: _onError,
      onExternalWallet: _onExternalWallet,
    );
  }

  void _onSuccess(PaymentSuccessResponse response) {
    debugPrint("SUCCESS: ${response.paymentId}");
  }

  void _onError(PaymentFailureResponse response) {
    debugPrint("ERROR: ${response.message}");
  }

  void _onExternalWallet(ExternalWalletResponse response) {
    debugPrint("WALLET: ${response.walletName}");
  }

  void startPayment({required String? orderId, required int amount}) {
    _paymentService.openCheckout(
      orderId: orderId,
      amount: amount,
      email: "ashwinrj2255@gmail.com",
      phone: "8921750632",
    );
  }

  @override
  void dispose() {
    _paymentService.dispose();
    super.dispose();
  }
}
