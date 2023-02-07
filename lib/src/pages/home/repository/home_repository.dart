import 'package:green_grocery/src/constants/endpoints.dart';
import 'package:green_grocery/src/models/category_model.dart';
import 'package:green_grocery/src/pages/home/result/home_result.dart';
import 'package:green_grocery/src/services/http_manager.dart';

class HomeRepository {
  final HttpManager _httpManager = HttpManager();

  Future<HomeResult> getAllCategories() async {
    final result = await _httpManager.restRequest(
      url: Endpoints.getAllCategories,
      method: HttpMethods.post,
    );

    if (result['result'] != null) {
      List<CategoryModel> data =
          (result['result'] as List<Map<String, dynamic>>)
              .map(CategoryModel.fromJson)
              .toList();

      return HomeResult<CategoryModel>.success(data);
    } else {
      return HomeResult.error(
          "Ocorreu um erro inesperado ao recuperar as categorias");
    }
  }
}
