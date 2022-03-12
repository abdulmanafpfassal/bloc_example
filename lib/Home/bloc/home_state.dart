part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

}

class HomeLoadingState extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeLoadedState extends HomeState{

  final String activity;
  final String type;

  HomeLoadedState(this.activity, this.type);
  @override
  // TODO: implement props
  List<Object?> get props => [activity, type];
}

class NoInternetState extends HomeState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
