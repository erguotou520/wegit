import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Http {
  Dio dio;
  _Http () {
    Options options = new Options(
      baseUrl: 'http://192.168.1.8:3001'
    );
    dio = new Dio(options);
    SharedPreferences.getInstance().then((SharedPreferences prefs) {
      final token = prefs.getString('token');
      final provider = prefs.getString('provider');
      print(token);
      dio.interceptor.request.onSend = (Options options) {
        options.headers['Authorization'] = 'token ${token}';
        options.headers['Provider'] = provider;
      };
    });
  }
}

final Dio http = new _Http().dio;