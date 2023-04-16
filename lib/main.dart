import 'package:eazypizy_eazyman/core/routes.dart';
import 'package:eazypizy_eazyman/core/services/user_service.dart';
import 'package:eazypizy_eazyman/core/language.dart';
import 'package:eazypizy_eazyman/theme/app_colors.dart';
import 'package:eazypizy_eazyman/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'core/pages.dart';
import 'core/services/category_services.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: EazyColors.background,
      statusBarColor: EazyColors.background, // navigation bar color
      // status bar color
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Future.wait([
    Get.putAsync(() => CategoryService().init()),
    Get.putAsync(() => EazyMenService().init()),
  ]);
  // Get.put(CartService());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 739),
      builder: (context, child) => GetMaterialApp(
        //  title: 'Flutter Demo',
        theme: theme,
        locale: const Locale('en', 'US'),
        translations: Language(),
        fallbackLocale: const Locale('en', 'US'),
        // home: ChooseLanguageScreen(),
        // home: initialRoute(),
        initialRoute: initialRoute(),
        getPages: pages,




      ),
    );
  }
}

String initialRoute() {
  if (EazyMenService.instance.isLoggedIn) {
    if (EazyMenService.instance.eazyMen != null) {
      // return const NavigationView();
      return Routes.navigationScreen;
    } else {
      // return const BusinessCardSample();
      return Routes.bussinessCardScreen;
    }
  } else {
    // return ChooseLanguageScreen();
    return Routes.choseLanguage;
  }
}
