import 'package:get/get.dart';
import 'package:green_grocery/src/constants/storage_keys.dart';
import 'package:green_grocery/src/models/user_model.dart';
import 'package:green_grocery/src/pages/auth/repository/auth_repository.dart';
import 'package:green_grocery/src/pages_routes/app_pages.dart';
import 'package:green_grocery/src/services/utils_services.dart';

import '../result/auth_result.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  final authRepository = AuthRepository();
  final utilsServices = UtilsServices();

  UserModel user = UserModel();

  //Executa ao iniciar o App, semelhante ao initState
  @override
  void onInit() {
    super.onInit();

    validateToken();
  }

  Future<void> validateToken() async {
    String? token = await utilsServices.getLocalData(key: StorageKeys.token);

    if (token == null) {
      Get.offAllNamed(PagesRoutes.signInRoute);
      return;
    }

    AuthResult result = await authRepository.validateToken(token);

    result.when(
      success: (user) {
        this.user = user;
        saveTokenAndProceedToBase();
      },
      error: (message) {
        signOut();
      },
    );
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;

    AuthResult result =
        await authRepository.signIn(email: email, password: password);

    isLoading.value = false;

    result.when(success: (user) {
      this.user = user;

      saveTokenAndProceedToBase();
    }, error: (message) {
      utilsServices.showToast(message: message, isError: true);
    });
  }

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;

    AuthResult result = await authRepository.signUp(user);

    isLoading.value = false;

    result.when(success: (user) {
      this.user = user;

      saveTokenAndProceedToBase();
    }, error: (message) {
      utilsServices.showToast(message: message, isError: true);
    });
  }

  void saveTokenAndProceedToBase() {
    utilsServices.saveLocalData(key: StorageKeys.token, data: user.token!);

    Get.offAllNamed(PagesRoutes.signInRoute);
    //Get.offAllNamed(PagesRoutes.baseRoute);
  }

  Future<void> signOut() async {
    //Zerar User
    user = UserModel();

    //Remover Token Localmente
    await utilsServices.removeLocalData(key: StorageKeys.token);

    //Ir para o Login
    Get.offAllNamed(PagesRoutes.signInRoute);
  }
}
