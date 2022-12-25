import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
// Import the generated file
import 'firebase_options.dart';
import 'routes/routes.dart';
import 'shared/constants/constants.dart';
import 'theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        enableLog: false,
        title: AppStrings.appTitle,
        defaultTransition: Transition.downToUp,
        getPages: AppPages.routes,
        initialRoute: Routes.HOMESCREEN,
        theme: ThemeConfig.lightTheme,
      );
    });
  }
}
