import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/address_input_section.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/shipping_section.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/payment_section.dart';

class CheckoutPageView extends StatelessWidget {
  const CheckoutPageView(
      {super.key,
      required this.controller,
      required this.formKey,
      required this.valueNotifier});
  final PageController controller;
  final GlobalKey<FormState> formKey;
  final ValueNotifier<AutovalidateMode> valueNotifier;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: getPages().length,
      itemBuilder: (context, index) {
        return getPages()[index];
      },
    );
  }

  List<Widget> getPages() {
    return [
      const ShippingSection(),
      AddressInputSection(
        valueNotifier: valueNotifier,
        formKey: formKey,
      ),
      PaymentSection(
        pageController: controller,
      ),
      const SizedBox(),
    ];
  }
}
