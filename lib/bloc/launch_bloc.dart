import 'dart:async';

import 'package:app_nation_test_project/bloc/bloc.dart';
import 'package:app_nation_test_project/network/network.dart';
import 'package:rxdart/rxdart.dart';

import '../data/launch.dart';

class LaunchBloc extends Bloc {
  final network = Network();

  final _refreshController = StreamController<void>();

  late Stream<Launch?> launchStream;

  LaunchBloc() {
    launchStream = _refreshController.stream
        .startWith({})
        .switchMap((value) => network.request().asStream())
        .asBroadcastStream();
  }

  Future refresh() {
    final future = launchStream.first;
    _refreshController.sink.add({});
    return future;
  }

  @override
  void dispose() {
    _refreshController.close();
  }
}
