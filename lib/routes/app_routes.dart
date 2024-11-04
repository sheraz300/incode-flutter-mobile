import 'package:get/get.dart';
import 'package:incode/screens/auth/auth_screen.dart';
import 'package:incode/screens/auth/signup_screen.dart';
import 'package:incode/utils/checking_internet/no_internet.dart';

appRoutes() => [
      GetPage(
        name: '/auth-screen',
        page: () => AuthScreen(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),
      GetPage(
        name: '/signup-screen',
        page: () => SignupScreen(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),
      GetPage(
        name: '/noInternet-screen',
        page: () => const NoInternetScreen(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),
    ];
