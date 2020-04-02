import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:test2/data/data_repository.dart';
import 'package:test2/data/models/global_stats.dart';
import 'package:test2/data/models/india_stats.dart';
import 'package:equatable/equatable.dart';

part 'stats_event.dart';
part 'stats_state.dart';

class StatsBloc extends Bloc<StatsEvent, StatsState> {
  final StatsRepository repository;

  StatsBloc(this.repository);

  @override
  StatsState get initialState => StatsInitial();

  @override
  Stream<StatsState> mapEventToState(
    StatsEvent event,
  ) async* {
    if (event is RefreshStatsEvent) {
      yield StatsLoading();
      try {
        final globalStats = await repository.getGlobalStats();
        final indiaStats = await repository.getIndiaStats();
        final stateStats = await repository.getStateWiseStats();
        final countryStats = await repository.getCountryStats();

        yield StatsLoaded(globalStats, indiaStats, stateStats, countryStats);

      } on Exception {
        yield StatsError('Could not connect to internet!!');
      }
    } else if (event is SwitchToGoogleMapTab) {
      yield StatsLoading();
      try {
        final globalStats = await repository.getGlobalStats();

        yield ShowGoogleMap(globalStats);

      } on Exception {
        yield StatsError('Could not connect to internet!!');
      }
    }
  }
}
