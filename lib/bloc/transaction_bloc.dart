import 'package:api_bloc/bloc/bloc_state.dart';
import 'package:api_bloc/repository/api_repository.dart';
import 'package:api_bloc/repository/server_error.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_event.dart';

class ApiBloc extends Bloc<BlocEvent, BlocState> {
  ApiBloc() : super(Initial()) {
    final ApiRepository apiRepository = ApiRepository();

    on<GetLogin>((event, emit) async {
      try {
        emit(Loading());
        final mList = await apiRepository.fetchLogin(event.path);

        if (mList.data == null) {
          ServerError error = mList.getException;
          emit(Error(error.getErrorMessage()));
        } else {
          emit(Loaded(data: mList.data!));
        }
      } on NetworkError {
        emit(const Error("Failed to fetch data. is your device online?"));
      }
    });
  }
}
