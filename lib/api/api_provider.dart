import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiProvider<T> extends GetConnect  {
   String apiKey = '123456';
   String apiLiveBaseUrl = 'http://10.0.0.53:3043/user/';
   String token = '';

   @override
   void onInit() async {
      httpClient.baseUrl = apiLiveBaseUrl;
      httpClient.defaultContentType = 'application/json';
      httpClient.timeout = const Duration(seconds: 25);
      httpClient.addRequestModifier<T>((request) async {
        final modifiedRequest = request as Request<T>;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final String? tokenValue = prefs.getString('token');
        modifiedRequest.headers['Authorization'] = tokenValue ?? '';
        token = tokenValue ?? '';
        modifiedRequest.headers['ApiKey'] = apiKey;
        return modifiedRequest;
    });
    super.onInit();
  }
}