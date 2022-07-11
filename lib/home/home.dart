import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_api/services/homeService.dart';

class HomnePage extends StatelessWidget {
  const HomnePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        RepositoryProvider.of<BoredService>(context),
      )..add(LoadApiEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("API BLOC LEARNING"),
          centerTitle: true,
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is HomeLoadedState) {
              return Column(
                children: [
                  Text(state.activityName),
                  Text(state.activityType),
                  Text(state.participate.toString()),
                  ElevatedButton(
                      onPressed: () => context.read<HomeBloc>().add(
                            LoadApiEvent(),
                          ),
                      child: const Text("Next Data")),
                ],
              );
            }
            return const Center(
              child: Text("UNKNOWN ERROR OCCURED"),
            );
          },
        ),
      ),
    );
  }
}
