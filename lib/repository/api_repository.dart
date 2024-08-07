import 'package:api_bloc/repository/base_model.dart';

import 'api_provider.dart';
// import 'base_model.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<BaseModel<List<dynamic>>> fetchLogin(String path) {
    return _provider.fetchLogin(path);
  }
}

class NetworkError extends Error {}
