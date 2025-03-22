import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruits_hub/core/routing/app_router.dart';
import 'package:fruits_hub/features/on_boarding/presentation/views/on_boarding_view.dart'
    show OnBoardingView;
import 'package:fruits_hub/features/settings/presentation/provider/locale_provider.dart';
import 'package:fruits_hub/features/splash/presentation/views/splash_view.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/theming/theme_data.dart';
import 'features/settings/presentation/provider/theme_provider.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/services/shared_preferences_singleton.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Prefs.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocaleProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const FruitsHub(),
    ),
  );
}

class FruitsHub extends StatelessWidget {
  const FruitsHub({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          SharedPreferences.getInstance(), // Ensure SharedPreferences is ready
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              return MaterialApp(
                theme: AppThemes.lightTheme,
                darkTheme: AppThemes.darkTheme,
                themeMode: themeProvider.isDarkMode
                    ? ThemeMode.dark
                    : ThemeMode.light, // Dynamic theme mode
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                locale: context.watch<LocaleProvider>().locale,
                onGenerateRoute: onGenerateRoute,
                initialRoute: OnBoardingView.routeName,
                debugShowCheckedModeBanner: false,
              );
            },
          );
        } else {
          return const MaterialApp(
            home: Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        }
      },
    );
  }
}
