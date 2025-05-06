import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_hub/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruits_hub/generated/l10n.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection(
      {super.key, required this.formKey, required this.valueNotifier});
  final GlobalKey<FormState> formKey;
  final ValueNotifier<AutovalidateMode> valueNotifier;
  @override
  Widget build(BuildContext context) {
    ShippingAddressEntity shippingAddress =
        context.read<OrderEntity>().shippingAddress;
    return ValueListenableBuilder(
      valueListenable: valueNotifier,
      builder: (context, value, child) => Form(
        key: formKey,
        autovalidateMode: value,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                  onSaved: (value) {
                    shippingAddress.name = value;
                  },
                  hintText: S.of(context).fullname,
                  keyboardType: TextInputType.name),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (value) {
                    shippingAddress.email = value;
                  },
                  hintText: S.of(context).email,
                  keyboardType: TextInputType.name),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (value) {
                    shippingAddress.address = value;
                  },
                  hintText: S.of(context).address,
                  keyboardType: TextInputType.streetAddress),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (value) {
                    shippingAddress.city = value;
                  },
                  hintText: S.of(context).city,
                  keyboardType: TextInputType.name),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (value) {
                    shippingAddress.phone = value;
                  },
                  hintText: S.of(context).phoneNumber,
                  keyboardType: TextInputType.number),
              const SizedBox(
                height: 16,
              )
            ],
          ),
        ),
      ),
    );
  }
}
