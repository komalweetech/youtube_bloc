import 'package:youyube_bloc/config/app_url.dart';
import 'package:youyube_bloc/data/network/network_services_api.dart';
import 'package:youyube_bloc/models/user/user_model.dart';

class LoginRepository {

  final _api = NetworkServicesApi();


  Future<UserModel> loginApi(dynamic data)async {
    final response = await _api.postApi(AppUrl.loginApiUrl, data);
    return UserModel.fromJson(response);

  }
}
