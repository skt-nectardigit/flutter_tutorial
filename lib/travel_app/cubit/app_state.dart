part of 'app_cubit.dart';

@immutable
abstract class AppState extends Equatable{}

class AppInitial extends AppState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class WelcomeState extends AppState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class InternetConnectedState extends AppState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class InternetNotConnectedState extends AppState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class HomePageLoadingState extends AppState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class HomePageLoadedState extends AppState {
  final List<PlacesModel> placesModelList;
  HomePageLoadedState(this.placesModelList);


  @override
  // TODO: implement props
  List<Object> get props => [placesModelList];
}
