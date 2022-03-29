import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:traking_screen/src/screens/binding.dart';
import 'package:traking_screen/src/screens/home.dart';
import 'package:traking_screen/src/screens/page1.dart';
import 'package:traking_screen/src/screens/page11.dart';
import 'package:traking_screen/src/screens/page12.dart';
import 'package:traking_screen/src/screens/page2.dart';
import 'package:traking_screen/src/screens/page3.dart';
import 'package:traking_screen/src/utils/themes/themes.dart';
import 'package:traking_screen/src/utils/translations/translations.dart';

void main() async {
  await GetStorage.init();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white70, systemStatusBarContrastEnforced: true));

    return GetMaterialApp(
      title: "hjjhhjhj",
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",
      translations: Messages(), // your translations
      locale: const Locale('fa', 'IR'),
      fallbackLocale: const Locale('fa', 'IR'),
      theme: Themes.themelight,
      darkTheme: Themes.themedark,
      themeMode: ThemeMode.system,
      textDirection: TextDirection.rtl,
      getPages: [
        GetPage(
          name: '/home',
          page: () => Home(),
          binding: InitialBinding(),
        ),
        GetPage(
          name: '/Page1',
          page: () => Page1(),
        ),
        GetPage(
          name: '/Page2',
          page: () => Page2(),
        ),
        GetPage(
          name: '/Page3',
          page: () => Page3(),
        ),
        GetPage(
          name: '/Page11',
          page: () => Page11(),
        ),
        GetPage(
          name: '/Page12',
          page: () => Page12(),
        ),
        GetPage(
          name: '/Page33',
          page: () => Page12(),
        ),
      ],
    );
  }
}
