import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'rest_client.g.dart';

const String baseUrl1 = "";

@RestApi(baseUrl: baseUrl1)
abstract class RestClient {
  factory RestClient({String? baseUrl}) {
    Dio dio = Dio();
    dio.options = BaseOptions(
        receiveTimeout: const Duration(seconds: 10),
        connectTimeout: const Duration(seconds: 10),
        baseUrl: baseUrl1);
    dio.options.headers["Content-Type"] = "application/json";

    // intercptors are use to display api response body and request body
    dio.interceptors.add(LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true));

    // InterceptorsWrapper makes it possible to observe or intercept everything that is API request.
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }, onResponse: (response, handler) {
      log("interceptor${response.data}");
      return handler.next(response);
    }, onError: (DioException e, handler) {
      return handler.next(e);
    }));
    return _RestClient(dio, baseUrl: baseUrl);
  }

  @GET("/data{path}")
  Future<List<dynamic>> getLogin(@Path("path") String path);

  // @POST("/UploadChemistOrderEasyChem")
  // Future<dynamic> uploadChemistOrderEasyChem(
  //     @Body() List<UploadChemist> uploadChemist);
}
