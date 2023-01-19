
import 'package:green_grocery/src/constants/endpoints.dart';
import 'package:green_grocery/src/models/user_model.dart';
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

     final user = UserModel.fromJson(result['result']);
      
    } else {
      print('SignIn não funcionou!');
      print(result['error']);
    }


  }
}
