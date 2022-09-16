import 'package:app_nation_test_project/bloc/bloc_provider.dart';
import 'package:app_nation_test_project/bloc/launch_bloc.dart';
import 'package:app_nation_test_project/ui/latest_launch_info.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LaunchBloc>(
      bloc: LaunchBloc(),
      child: MaterialApp(
        title: 'SpaceX Latest Launch',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LatestLauncInfo(),
      ),
    );
  }
}
