
import 'package:green_grocery/src/constants/endpoints.dart';
import 'package:green_grocery/src/services/http_manager.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  Future signIn({required String email, required String password}) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.signin,
      method: HttpMethods.post,
      body: {
        "email": email,
        "password": password
      }
    );

    if(result['result'] != null) {
      print('SignIn funcionou!');

    } else {
      print('SignIn não funcionou!');
    }


  }
}