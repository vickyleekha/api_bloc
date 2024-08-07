import 'package:api_bloc/bloc/bloc_event.dart';
import 'package:api_bloc/bloc/bloc_state.dart';
import 'package:api_bloc/bloc/transaction_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'utils/util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ApiBloc apiBloc = ApiBloc();

  @override
  void initState() {
    super.initState();
    apiBloc.add(const GetLogin(path: "/GodImages?pageSize=30"));
  }

  Widget bloc() {
    return BlocProvider(
      create: (_) => apiBloc,
      child: BlocListener<ApiBloc, BlocState>(
        listener: (context, state) {
          if (state is Error) {
            // showToast(state.message!);
          }
        },
        child: BlocBuilder<ApiBloc, BlocState>(
          builder: (context, state) {
            if (state is Initial) {
              return buildLoading();
            } else if (state is Loading) {
              return Container(child: buildLoading());
            } else if (state is Loaded) {
              return MyStatefulWidget(
                data: state.data,
              );
            } else if (state is Error) {
              return Container();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return bloc();
  }
}

class MyStatefulWidget extends StatefulWidget {
  final List<dynamic> data;
  const MyStatefulWidget({super.key, required this.data});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int splashtime = 2;
  // duration of splash screen on second

  @override
  void initState() {
    // Future.delayed(Duration(seconds: splashtime), () async {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Text(widget.data.toString()),
    ]);
  }
}
