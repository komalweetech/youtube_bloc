
import 'package:youyube_bloc/models/user/user_model.dart';

abstract class LoginRepository {

  Future<UserModel> loginApi(dynamic data);
}
