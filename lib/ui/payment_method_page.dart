part of 'pages.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({super.key, required this.paymentUrl});

  final String paymentUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IllustrationPage(
        title: 'Finish Your Payment',
        subtitle: 'Please select your favorite/npayment method',
        picturePath: 'assets/payment.png',
        buttonTitle1: 'Payment Method',
        buttonTap1: () async {
          await launch(paymentUrl);
        },
        buttonTitle2: 'Continue',
        buttonTap2: () {
          Get.to(const SuccessOrderPage());
        },
      ),
    );
  }
}
