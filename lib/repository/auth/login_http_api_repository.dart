import 'package:youyube_bloc/repository/auth/login_repository.dart';

import '../../config/app_url.dart';
import '../../data/network/network_services_api.dart';
import '../../models/user/user_model.dart';

class LoginHttpApiRepository implements LoginRepository {
  final _api = NetworkServicesApi();

  @override
  Future<UserModel> loginApi(dynamic data) async {
    final response = await _api.postApi(AppUrl.loginApiUrl, data);
    return UserModel.fromJson(response);
  }
}
