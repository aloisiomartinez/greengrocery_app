import 'package:green_grocery/src/constants/endpoints.dart';
import 'package:green_grocery/src/services/http_manager.dart';

class CartRepository {
  final _httpManager = HttpManager();
  //<CartResult<List>
  Future getCartItems({required String token, required String userId}) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.getCartItems,
      method: HttpMethods.post,
      headers: {
        'X-Parse-Session-Token': token,
      },
      body: {
        'user': userId,
      },
    );

    if (result['result'] != null) {
      print(result['result']);
    } else {
      print('Ocorreu um erro');
    }
  }
}
