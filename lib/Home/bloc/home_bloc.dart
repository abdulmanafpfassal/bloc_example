import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:sampleapi/Home/repo/connectivityService.dart';
import 'package:sampleapi/Home/repo/service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApiService _apiService;
  final ConnectivityService _connectivityService;

  HomeBloc(this._apiService, this._connectivityService) : super(HomeLoadingState()) {

    _connectivityService.connectivityStream.stream.listen((event) {
      if(event == ConnectivityResult.none){
        print("no internet");
        add(noInternetEvent());
      }else{
        print("internet");
        add(LoadApiEvent());
      }
    });

    on<LoadApiEvent>((event, emit) async {
      emit(HomeLoadingState());
      final activity = await _apiService.getArticleApiData();
      emit(HomeLoadedState(activity.activity, activity.type));
    });

    on<noInternetEvent>((event, emit) => {
      emit(NoInternetState())
    });
  }
}
