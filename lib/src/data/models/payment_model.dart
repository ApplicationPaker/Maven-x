import 'package:mavenx/src/app/presentation/utils/assets.dart';

class PaymentModel {
  final String paymentImg;
  final String title;

  PaymentModel({
    required this.paymentImg,
    required this.title,
  });
}

List<PaymentModel> paymentModelList = [
  PaymentModel(
    paymentImg: Assets.images.creditPayPNG,
    title: "Credit/Debit",
  ),
  PaymentModel(
    paymentImg: Assets.images.madaPayPNG,
    title: "Madapay",
  ),
  PaymentModel(
    paymentImg: Assets.images.stcPayPNG,
    title: "Stcpay",
  ),
  PaymentModel(
    paymentImg: Assets.images.applePayPNG,
    title: "Applepay",
  ),
];
