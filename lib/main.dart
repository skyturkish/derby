import 'package:derby/core/constants/app/app_constants.dart';
import 'package:derby/core/init/translations/language_manager.dart';
import 'package:derby/view/home/view/home_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  _init();
  runApp(
    EasyLocalization(
      supportedLocales: LanguageManager.instance.supportedLocales,
      path: ApplicationConstants.TRANSLATIONS_ASSET_PATH, // <-- change the path of the translation files
      fallbackLocale: LanguageManager.instance.enLocale,
      startLocale: LanguageManager.instance.enLocale,
      child: MultiProvider(
        providers: const [],
        builder: (context, child) => const MyApp(),
      ),
    ),
  );
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData.light().copyWith(scaffoldBackgroundColor: const Color(0xffe5f0ea)),
      title: 'Material App',
      home: const HomeView(),
    );
  }
}
