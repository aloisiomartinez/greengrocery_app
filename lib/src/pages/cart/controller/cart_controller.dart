import 'package:get/get.dart';
import 'package:green_grocery/src/pages/auth/controller/auth_controller.dart';
import 'package:green_grocery/src/pages/cart/repository/cart_repository.dart';

class CartController extends GetxController {
  final cartRepository = CartRepository();
  final authController = Get.find<AuthController>();

  @override
  void onInit() {
    super.onInit();

    getCartItems();
  }

  Future<void> getCartItems() async {
    await cartRepository.getCartItems(
      token: authController.user.token!,
      userId: authController.user.id!,
    );
  }
}
