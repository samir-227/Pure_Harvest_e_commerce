import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/constants/constants.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/cubits/orders_cubit/orders_cubit.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/check_out_steps.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/checkout_page_view.dart';
import 'package:fruits_hub/generated/l10n.dart';

class CheckOutViewBody extends StatefulWidget {
  const CheckOutViewBody({super.key});

  @override
  State<CheckOutViewBody> createState() => _CheckOutViewBodyState();
}

class _CheckOutViewBodyState extends State<CheckOutViewBody> {
  late PageController pageController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ValueNotifier<AutovalidateMode> autovalidateMode =
      ValueNotifier(AutovalidateMode.disabled);
  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPageIndex = pageController.page!.toInt();
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    autovalidateMode.dispose();
    super.dispose();
  }

  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          buildAppBar(context,
              title: S.of(context).shipping, showNotification: false),
          const SizedBox(height: 16),
          CheckOutSteps(
            onTap: () {
              if (currentPageIndex == 0) {
                pageController.animateToPage(currentPageIndex + 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              }
              if (currentPageIndex == 1) {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  pageController.animateToPage(currentPageIndex + 1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                } else {
                  autovalidateMode.value = AutovalidateMode.always;
                }
                if (currentPageIndex == 2) {
                  pageController.animateToPage(currentPageIndex + 1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                }
              }
            },
            pageController: pageController,
            currentPageIndex: currentPageIndex,
          ),
          Expanded(
            child: CheckoutPageView(
              valueNotifier: autovalidateMode,
              formKey: formKey,
              controller: pageController,
            ),
          ),
          CustomButton(
              text: getButtonText(context, currentPageIndex),
              onPressed: () {
                if (currentPageIndex == 0) {
                  pageController.animateToPage(currentPageIndex + 1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                } else if (currentPageIndex == 1) {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    pageController.animateToPage(currentPageIndex + 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  } else {
                    autovalidateMode.value = AutovalidateMode.always;
                  }
                } else {
                  OrderEntity orderEntity = context.read<OrderEntity>();
                  context.read<OrdersCubit>().addOrder(orderEntity);
                
                }
              }),
          const SizedBox(height: 70),
        ],
      ),
    );
  }
}

String getButtonText(BuildContext context, int currentPageIndex) {
  switch (currentPageIndex) {
    case 0:
      return S.of(context).next;
    case 1:
      return S.of(context).next;
    case 2:
      return S.of(context).PayPal;

    default:
      return S.of(context).next;
  }
}
