import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../generated/l10n.dart';
import '../presentation/resources/theme/theme_manager.dart';
import '../presentation/view/splash/splash.dart';
import '../presentation/view_model/material/material_provider.dart';
import 'dependency_injection/dependency_injection.dart';
import 'shared_pref/shared_pref.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MaterialProvider>(
      builder: (context, provider, child) {
        return MaterialApp(
          locale: Locale(getIt<AppPreferences>().getLanguage()),
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          theme: getLightModeThemeData(),
          darkTheme: getDarkModeThemeData(),
          themeMode: provider.getThemeMode(),
          home: const SplashScreen(),
        );
      },
    );
  }
}
