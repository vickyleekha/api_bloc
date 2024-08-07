import 'package:api_bloc/model/CovidModel.dart';
import 'package:api_bloc/retrofit/rest_client.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import 'base_model.dart';
import 'server_error.dart';

class ApiProvider {
  RestClient? apiClient;

  ApiProvider() {
    apiClient = RestClient();
  }

  // Future<BaseModel<List<dynamic>>> fetchLogin(String path) async {
  //   var logger = Logger();
  //   dynamic response;
  //   try {
  //     response = await apiClient!.geLogin(path);
  //   } catch (error, stacktrace) {
  //     logger.f("Exception occured:", error: error, stackTrace: stacktrace);
  //     return BaseModel()
  //       ..setException(ServerError.withError(error: error as DioException));
  //   }
  //   return BaseModel()..data = response;
  // }

  Future<BaseModel<CovidModel>> fetchCovidList() async {
    var logger = Logger();
    CovidModel response;
    try {
      response = await apiClient!.fetchCovidList();
    } catch (error, stacktrace) {
      logger.f("Exception occured:", error: error, stackTrace: stacktrace);
      return BaseModel()
        ..setException(ServerError.withError(error: error as DioException));
    }
    return BaseModel()..data = response;
  }
}
