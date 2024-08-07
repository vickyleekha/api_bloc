import 'package:equatable/equatable.dart';

abstract class BlocEvent extends Equatable {
  const BlocEvent();

  @override
  List<Object> get props => [];
}

class GetLogin extends BlocEvent {
  final String path;
  // final int code;
  // final String password;

  const GetLogin({required this.path});
}

class GetCovidList extends BlocEvent {}
