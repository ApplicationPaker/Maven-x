import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/components/custom_button.dart';
import 'package:mavenx/src/app/presentation/components/global_text_field.dart';
import 'package:mavenx/src/app/presentation/routes/routes_navigator.dart';
import 'package:mavenx/src/app/presentation/screens/payment_methods/subscribed_successfuly.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';
import 'package:mavenx/src/app/presentation/utils/utils.dart';
import 'package:mavenx/src/data/models/payment_model.dart';

class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen({super.key});

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController cardHolderController = TextEditingController();
  final TextEditingController cardNoController = TextEditingController();
  final TextEditingController cardExpiryController = TextEditingController();
  final TextEditingController cardCVVController = TextEditingController();
  final TextEditingController billingAddressController =
      TextEditingController();
  bool passwordVisibility = true;
  bool confirPasswordVisibility = true;

  bool isPaymentSelected = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(kRadius),
          topRight: Radius.circular(kRadius)),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
            horizontal: kPadding * 2, vertical: kPadding * 2),
        child: Column(
        
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "COMPLETE PURCHASE",
              style: TextStyle(
                  fontSize: 17,
                  color: kWhiteColor,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: kPadding * 4),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(kRadius),
                child: Image.network(
                  "https://www.figma.com/file/ZQtVBdUfQaDDRCN1QGxD1C/image/71f8a1ba4341094db9a4fdb355b7a018beaa2528",
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: kPadding * 4),
            const Text(
              'Subscriptions to "FazeKeysen"',
              style: TextStyle(
                  fontSize: 15,
                  color: kWhiteColor,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: kPadding),
            const Text(
              "Recurring charge, starting today.\nCancel anytime on your Subscriptions page.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 13,
                  color: kLightGreyColor,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: kPadding * 3),
            const Text(
              'Total including taxes\n\$4.99/month',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 17,
                  color: kWhiteColor,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: kPadding * 3),
            const Center(
              child: Divider(
                color: kGreyColor,
                height: 30,
              ),
            ),
            isPaymentSelected
                ? Form(
                    key: formKey,
                    child: Column(
                      children: [
                        // <------------------------  Card Holder ------------------------>
                        GlobalTextField(
                          autofillHints: const [
                            AutofillHints.name,
                          ],
                          controller: cardHolderController,
                          hintText: "Card holder's name",
                          validator: (s) => Utils.validateInput(
                            s,
                          ),
                        ),
                        const SizedBox(height: kPadding * 3),

                        // <------------------------  Card Number ------------------------>
                        GlobalTextField(
                          autofillHints: const [
                            AutofillHints.name,
                          ],
                          controller: cardNoController,
                          hintText: "Card number",
                          validator: (s) => Utils.validateInput(
                            s,
                          ),
                        ),

                        const SizedBox(height: kPadding * 3),
                        // <------------------------  Expiry & CVV ------------------------>
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: kPadding * 1.5),
                                child: GlobalTextField(
                                  autofillHints: const [
                                    AutofillHints.name,
                                  ],
                                  controller: cardExpiryController,
                                  hintText: "Exp",
                                  validator: (s) => Utils.validateInput(
                                    s,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: kPadding * 1.5),
                                child: GlobalTextField(
                                  autofillHints: const [
                                    AutofillHints.name,
                                  ],
                                  controller: cardCVVController,
                                  hintText: "CVV",
                                  validator: (s) => Utils.validateInput(
                                    s,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: kPadding * 3),

                        // <------------------------  Billing ------------------------>
                        GlobalTextField(
                          autofillHints: const [
                            AutofillHints.name,
                          ],
                          controller: billingAddressController,
                          hintText: "Billing address",
                          validator: (s) => Utils.validateInput(
                            s,
                          ),
                        ),

                        const SizedBox(height: kPadding * 3),
                        Row(
                          children: [
                            Checkbox(
                              value: false,
                              onChanged: (value) {},
                              side: const BorderSide(
                                color: kPrimaryColor,
                              ),
                              fillColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                return kLightGreyColor;
                              }),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(kRadius),
                              ),
                            ),
                            const Flexible(
                              child: Text(
                                "By providing card information, you allow Maven X Entertainment Inc. to charge your card for future payments in accordance with their terms",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: kWhiteColor,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: kPadding * 3),
                        SizedBox(
                          height: size.height / 100 * 6,
                          child: CustomButton(
                              onPressed: () {
                                // setState(() {
                                //   isPaymentSelected = false;
                                // });

                                // if (formKey.currentState!.validate()) {
                                RouteNavigator.route(context,
                                    const SubscribedSuccessfulyScreen());
                                // }
                              },
                              showLoadingIndicator: true,
                              text: "Proceed"),
                        )
                      ],
                    ),
                  )
                : const SizedBox(),
            if (!isPaymentSelected) ...[
              Column(
                children: [
                  const Text(
                    "Select payment gateway",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: kWhiteColor),
                  ),
                  const SizedBox(height: kPadding * 3),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(paymentModelList.length, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              isPaymentSelected = true;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: kPadding / 2),
                            child: Column(
                              children: [
                                Image.asset(
                                  paymentModelList[index].paymentImg,
                                  height: 60,
                                ),
                                const SizedBox(height: kPadding),
                                Text(
                                  paymentModelList[index].title,
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: kWhiteColor),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  )
                ],
              )
            ],
          ],
        ),
      ),
    );
  }
}
