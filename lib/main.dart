import 'package:eazypizy_eazyman/core/language.dart';
import 'package:eazypizy_eazyman/theme/app_colors.dart';
import 'package:eazypizy_eazyman/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'Modules/ChooseLanguage/view_ChooseLanguage.dart';
import 'core/pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'core/services/category_services.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: EazyColors.white,
      statusBarColor: EazyColors.white, // navigation bar color
      // status bar color
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Future.wait([
    Get.putAsync(() => CategoryService().init()),
    // Get.putAsync(() => CustomerService().init()),
  ]);
  // Get.put(CartService());

  runApp(const MyApp());}

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
        locale: const Locale('en','US'),
        translations: Language(),
        fallbackLocale: const Locale('en','US'),
        home: ChooseLanguageScreen(),
        getPages: pages,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
