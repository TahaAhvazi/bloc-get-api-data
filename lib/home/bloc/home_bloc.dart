import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_api/services/homeService.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BoredService _boredService;
  HomeBloc(this._boredService) : super(HomeLoadingState()) {
    on<LoadApiEvent>((event, emit) async {
      HomeLoadingState();
      final activity = await _boredService.getBoredActivities();
      emit(
        HomeLoadedState(
            activity.activity, activity.type, activity.participants),
      );
    });
  }
}
