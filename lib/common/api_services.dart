import 'package:dio/dio.dart';

class ApiServices {
 static Dio dio = Dio(BaseOptions(baseUrl: 'https://assessment.mydvls.com'));

  static const register = '/auth/jwt/create';
  static const travel = '/travel/travel/';
  static const travelDetail = '/travel/travel-details/';
}
