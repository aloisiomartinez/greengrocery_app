import 'package:get/get.dart';

import 'package:green_grocery/src/pages/base/base_screen.dart';
import 'package:green_grocery/src/pages/cart/binding/cart_binding.dart';
import 'package:green_grocery/src/pages/home/binding/home_binding.dart';
import 'package:green_grocery/src/pages/product/product_screen.dart';
import 'package:green_grocery/src/pages/splash/splash_screen.dart';

import '../pages/auth/view/sign_in_screen.dart';
import '../pages/auth/view/sign_up_screen.dart';
import '../pages/base/binding/navigation_binding.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: PagesRoutes.splashRoute,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: PagesRoutes.productRoute,
      page: () => ProductScreen(),
    ),
    GetPage(
      name: PagesRoutes.signInRoute,
      page: () => SignInScreen(),
    ),
    GetPage(
      name: PagesRoutes.signUpRoute,
      page: () => SignUpScreen(),
    ),
    GetPage(
        name: PagesRoutes.baseRoute,
        page: () => const BaseScreen(),
        bindings: [
          NavigationBinding(),
          HomeBinding(),
          CartBinding(),
        ]),
  ];
}

abstract class PagesRoutes {
  static const String signInRoute = "/signin";
  static const String signUpRoute = "/signup";
  static const String splashRoute = "/splash";
  static const String productRoute = "/product";
  static const String baseRoute = "/";
}
