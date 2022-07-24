import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_tutorial/travel_app/data_services/api_client.dart';
import 'package:flutter_tutorial/travel_app/models/places_model.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  final ApiClient apiClient;
  var places;
  Connectivity _connectivity= Connectivity();
  StreamSubscription? _streamSubscription;
  AppCubit({required this.apiClient}) : super(AppInitial()){

    emit(WelcomeState());
  }

  void getPlacesdata() async{
    try{
      emit(HomePageLoadingState());
      places= await apiClient.getPlaces();
      emit(HomePageLoadedState(places));
    }catch(e){
      print(e);
    }
  }

  void checkInternet(){
    _streamSubscription= _connectivity.onConnectivityChanged.listen((status) {
      if (status==ConnectivityResult.wifi || status==ConnectivityResult.mobile) {
        emit(InternetConnectedState());
        print("Connected");
      }  else{
        emit(InternetNotConnectedState());
        print("Disconnected");
      }
    });
  }

  @override
  Future<void> close() {
    // TODO: implement close
    _streamSubscription?.cancel();
    return super.close();
  }

}
