import 'package:dio/dio.dart';
import './http.dart';
import './models/user.dart';

Future<User> fetchMe () async {
  Response res = await http.get('/me');
  print(res);
  return User.fromJson(res.data);
}