import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:meta/meta.dart';

part 'internet_state.dart';
class InternetCubit extends Cubit<InternetState> {
  Connectivity _connectivity= Connectivity();
  StreamSubscription? _streamSubscription;
  InternetCubit() : super(InternetState.Initial){
    _streamSubscription= _connectivity.onConnectivityChanged.listen((status) {
      if (status==ConnectivityResult.wifi || status==ConnectivityResult.mobile) {
        emit(InternetState.Connected);
      }  else{
        emit(InternetState.Disconnected);
      }
    });
  }
  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
