import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sampleapi/Home/bloc/home_bloc.dart';
import 'package:sampleapi/Home/repo/connectivityService.dart';
import 'package:sampleapi/Home/repo/service.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        RepositoryProvider.of<ApiService>(context),
        RepositoryProvider.of<ConnectivityService>(context),
      )..add(LoadApiEvent()),
      child: Scaffold(appBar: AppBar(),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state){
          if(state is HomeLoadingState){
            return Center(child: CircularProgressIndicator());
          }
          if(state is HomeLoadedState){
            return Column(
              children: [
                Text(state.activity),
                Text(state.type),
                ElevatedButton(onPressed: () => BlocProvider.of<HomeBloc>(context).add(LoadApiEvent()), child: Text("Load new")),
              ],
            );
          }
          if(state is NoInternetState){
            return Text("no internet available");
          }
          return Container();
        },
      ),
      ),
    );
  }
}
