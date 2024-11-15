import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:islamic_app/Api/api_constants.dart';
import 'package:islamic_app/Models/Radio.dart';
import 'package:islamic_app/Models/Radios.dart';

class ApiManager {
  static final Dio _dio = Dio(BaseOptions(baseUrl: ApiConstants.baseURL));
  static Future<Either<String,List<RadioModel>>> getRadios() async {
    try{
      var response = await _dio.get(EndPoints.radios);
      var radios =  RadioListModel.fromJson(response.data).radios ?? [];
      return right(radios);
    }catch(e){
     return Left(e.toString());
    }
  }
}
