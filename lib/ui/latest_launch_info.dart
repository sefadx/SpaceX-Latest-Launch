import 'package:app_nation_test_project/bloc/launch_bloc.dart';
import 'package:app_nation_test_project/data/launch.dart';
import 'package:flutter/material.dart';

import '../bloc/bloc_provider.dart';

class LatestLauncInfo extends StatelessWidget {
  const LatestLauncInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<LaunchBloc>(context);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: bloc.refresh,
        child: StreamBuilder<Launch?>(
          stream: bloc.launchStream,
          builder: (context, snapshot) {
            final result = snapshot.data;
            if (result == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              List<String> list = [
                "Date (UTC) : ${result.dateUtc}",
                "Name : ${result.name}",
                "Details : ${result.details}",
                "Flight Number : ${result.flightNumber}"
              ];
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    stretch: true,
                    expandedHeight: 250,
                    flexibleSpace: FlexibleSpaceBar(
                      background: SafeArea(
                        child: Image.network(
                          result.links?.patch?.small ?? "",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blue,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 1),
                                blurRadius: 3,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: Text(
                            list.elementAt(index),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                      childCount: list.length,
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
