import 'package:flutter/material.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruits_hub/features/auth/presentation/views/sing_in_view.dart';
import 'package:fruits_hub/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruits_hub/features/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static const String routeName = 'splash';
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    executeNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody(),
    );
  }

  void executeNavigation() {
    bool isOnBoardingViewSeen = Prefs.getBool(kIsOnBoardingViewSeen);
    if (isOnBoardingViewSeen) {
      Future.delayed(
        const Duration(seconds: 3),
        () {
          Navigator.pushReplacementNamed(context, SingInView.routeName);
        },
      );
    } else {
      Future.delayed(
        const Duration(seconds: 3),
        () {
          Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
        },
      );
    }
  }
}
