part of 'stats_bloc.dart';

abstract class StatsState extends Equatable {
  const StatsState();
}

class StatsInitial extends StatsState {
  @override
  List<Object> get props => [];
}

class StatsLoading extends StatsState {
  @override
  List<Object> get props => [];
}

class StatsLoaded extends StatsState {
  final GlobalStats globalData;
  final IndiaStats indiaData;
  final List<List<dynamic>> stateData;
  final List<List<dynamic>> countryData;

  StatsLoaded(this.globalData, this.indiaData, this.stateData, this.countryData);
    
  @override
  List<Object> get props => [globalData, indiaData];
}

class ShowGoogleMap extends StatsState {
  final GlobalStats globalData;

  ShowGoogleMap(this.globalData);
  @override
  List<Object> get props => [globalData];
}

class StatsError extends StatsState {

  final String errorMessage;

  StatsError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}