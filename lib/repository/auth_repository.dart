import 'package:mvvmex/data/network/base_api_services.dart';
import 'package:mvvmex/data/network/network_api_services.dart';
import 'package:mvvmex/res/components/app_url.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response = _apiServices.getPostApiResponse(AppUrl.loginUrl, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
