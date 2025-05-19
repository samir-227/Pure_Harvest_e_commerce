import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruits_hub/core/helpers/cache_helper.dart';
import 'package:fruits_hub/core/routing/app_router.dart';
import 'package:fruits_hub/core/theming/theme_data.dart';
import 'package:fruits_hub/features/home/presentation/manager/provider/settings_provider.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:provider/provider.dart';

class FruitsHub extends StatefulWidget {
  const FruitsHub({super.key});

  @override
  State<FruitsHub> createState() => _FruitsHubState();
}

class _FruitsHubState extends State<FruitsHub> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SettingsProvider()..loadSettings(),
      child: FutureBuilder(
        future: CacheHelper.init(), // Ensure SharedPreferences is ready
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Consumer<SettingsProvider>(
              builder: (context, themeProvider, child) {
                return MaterialApp.router(
                  routerConfig: AppRouter.router,
                  theme: AppThemes.lightTheme,
                  darkTheme: AppThemes.darkTheme,
                  themeMode: context.watch<SettingsProvider>().isDarkMode
                      ? ThemeMode.dark
                      : ThemeMode.light, // Dynamic theme mode
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: S.delegate.supportedLocales,
                  locale: context.watch<SettingsProvider>().locale,
                  debugShowCheckedModeBanner: false,
                );
              },
            );
          } else {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: AppRouter.router,
              builder: (context, child) => const CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
