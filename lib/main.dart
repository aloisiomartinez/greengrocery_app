import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:green_grocery/src/pages/auth/controller/auth_controller.dart';
import 'package:green_grocery/src/pages_routes/app_pages.dart';

void main() {
  // Trecho de código que garante que todos os componentes necessários para a ação seguinte já estejam iniciados  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AuthController());

  // Define apenas o modo retrato em pé, fazendo com que todo nosso app fique apenas nessa orientação, evitando o overflow
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GreenGrocer Store App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Colors.white.withAlpha(190)),
      initialRoute: PagesRoutes.splashRoute,
      getPages: AppPages.pages,
    );
  }
}
