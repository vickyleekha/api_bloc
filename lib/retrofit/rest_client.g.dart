// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.covid19api.com';
  }

  final Dio _dio;

  String? baseUrl;

  // @override
  // Future<List<dynamic>> getLogin(path) async {
  //   const extra = <String, dynamic>{};
  //   final queryParameters = <String, dynamic>{};
  //   final headers = <String, dynamic>{};
  //   final data = <String, dynamic>{};
  //   final result = await _dio.fetch<List<dynamic>>(
  //       _setStreamType<List<dynamic>>(
  //           Options(method: 'GET', headers: headers, extra: extra)
  //               .compose(_dio.options, '/data${path}',
  //                   queryParameters: queryParameters, data: data)
  //               .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
  //   var value = result.data!;
  //   // .map((dynamic i) => d.fromJson(i as Map<String, dynamic>))
  //   // .toList();
  //   return value;
  // }

  @override
  Future<CovidModel> fetchCovidList() async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CovidModel>(
            Options(method: 'GET', headers: headers, extra: extra)
                .compose(_dio.options, '/summary',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CovidModel.fromJson(result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
