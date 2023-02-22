import 'package:get/get.dart';
import 'package:green_grocery/src/models/category_model.dart';
import 'package:green_grocery/src/pages/home/repository/home_repository.dart';
import 'package:green_grocery/src/services/utils_services.dart';

import '../result/home_result.dart';

class HomeController extends GetxController {
  final homeRepository = HomeRepository();
  final utilsServices = UtilsServices();

  bool isLoading = false;
  List<CategoryModel> allCategories = [];

  void setLoading(bool value) {
    isLoading = value;

    update();
  }

  @override
  onInit() {
    super.onInit();

    getAllCategories();
  }

  Future<void> getAllCategories() async {
    setLoading(true);
    HomeResult<CategoryModel> homeResult =
        await homeRepository.getAllCategories();

    setLoading(false);

    homeResult.when(success: (data) {
      allCategories.assignAll(data);
      print("Todas Categorias: $allCategories");
    }, error: (message) {
      utilsServices.showToast(
        message: message,
        isError: true,
      );
    });
  }
}
