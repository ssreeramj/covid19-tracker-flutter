part of 'stats_bloc.dart';

abstract class StatsEvent extends Equatable {
  const StatsEvent();
}

class RefreshStatsEvent extends StatsEvent {
  
  @override
  List<Object> get props => null;

}

class SwitchToGoogleMapTab extends StatsEvent {
  
  @override
  List<Object> get props => null;
}