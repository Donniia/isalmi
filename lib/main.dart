import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/provider/app_provider.dart';
import 'core/provider/radio_provider.dart';
import 'core/theme/application_theme.dart';
import 'home.dart';
import 'modules/hadeth/hadeth_details.dart';
import 'modules/quran/quran_details.dart';
import 'modules/splash_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var pr = AppProvider();
 await pr.loadingSettingConfig();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AppProvider()),
    ChangeNotifierProvider(create: (context) => RadioProvider()),
    ChangeNotifierProvider(create: (context) => pr),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var appProvider = Provider.of<AppProvider>(context);
    return MaterialApp(
      theme: AppTheme.lighttheme,
      darkTheme: AppTheme.darktheme,
      themeMode: appProvider.currentTheme,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(appProvider.currentLanguage),
      initialRoute: splashScreen.routeName,
      routes: {
        splashScreen.routeName: (context) => splashScreen(),
        Home.routeName: (context) => Home(),
        QuranDetails.routeName: (context) => QuranDetails(),
        HadethDetails.routeName: (context) => HadethDetails(),
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
