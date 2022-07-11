// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadedState extends HomeState {
  final String activityName;
  final String activityType;
  final int participate;
  const HomeLoadedState(
    this.activityName,
    this.activityType,
    this.participate,
  );
  @override
  List<Object> get props => [activityName, activityType, participate];
}
