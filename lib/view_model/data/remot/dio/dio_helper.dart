import 'package:dio/dio.dart';
import 'package:jaunt/view_model/data/remot/dio/endpoint.dart';

class dioHelper {
  static Dio? dio;
  static init() async {
    dio = await Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    ));
  }

  static getData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? ''
    };
    return await dio!.get(url);
  }


}