import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:incode/bindings/all_bindings.dart';
import 'package:incode/constants/app_colors.dart';
import 'package:incode/routes/app_routes.dart';
import 'package:incode/screens/auth/signup_screen.dart';

// ignore: unused_import
import 'package:incode/screens/welcome_screen.dart';
import 'package:oktoast/oktoast.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'utils/checking_internet/dependency_injection.dart';
import 'utils/utils.dart';

void main() async {
  Logger.configure();

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      statusBarColor: Color(0xFFC61323),
      systemNavigationBarContrastEnforced: true,
      statusBarIconBrightness: Brightness.light, // status bar icons' color
      systemNavigationBarIconBrightness:
          Brightness.light, //navigation bar icons' color
    ),
  );
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  ).then(
    (_) {
      runApp(
        const MyApp(),
      );
    },
  );
  await Future.delayed(const Duration(seconds: 2));
  DependencyInjection.initi();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: GetMaterialApp(
        title: 'IN-Code',
        getPages: appRoutes(),
        initialBinding: AllBindings(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.kPrimary),
          useMaterial3: true,
          fontFamily: 'Roboto',
          primaryColor: AppColors.kPrimary,
          dividerColor: Colors.transparent,
        ),
        builder: (context, widget) {
          return MediaQuery(
            // prevent font from scaling (some people use big/small device fonts)
            // but we want our app font to still the same and don't get affected
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(1.0)),
            child: BouncingScrollWrapperX.builder(
              context,
              widget!,
              dragWithMouse: true,
              // AccessibilityTools(
              //   checkSemanticLabels: false,
              //   child: widget!,
              // ),
            ),
          );
        },
        home: const Splash(),
      ),
    );
  }
}

class BouncingScrollWrapperX extends StatelessWidget {
  final Widget child;
  final bool dragWithMouse;

  const BouncingScrollWrapperX({
    super.key,
    required this.child,
    this.dragWithMouse = false,
  });

  static Widget builder(
    BuildContext context,
    Widget child, {
    bool dragWithMouse = false,
  }) {
    return BouncingScrollWrapperX(dragWithMouse: dragWithMouse, child: child);
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const BouncingScrollBehavior().copyWith(
        overscroll: false,
        scrollbars: false,
        dragDevices: dragWithMouse
            ? {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse,
              }
            : null,
      ),
      child: child,
    );
  }
}
