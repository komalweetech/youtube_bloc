
import 'package:youyube_bloc/repository/auth/login_repository.dart';

import '../../models/user/user_model.dart';

class LoginMockApiRepository implements LoginRepository {

  @override
  Future<UserModel> loginApi(dynamic data) async {
    await Future.delayed(const Duration(seconds: 02));
    final response = {
      'token': "lhdlkhd5454dvm"
    };
    return UserModel.fromJson(response);
  }
}
