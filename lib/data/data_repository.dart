import 'dart:convert';

import 'package:test2/core/const.dart';
import 'package:test2/data/models/global_stats.dart';
import 'package:test2/data/models/india_stats.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

abstract class DataRepository extends Equatable {
  Future<GlobalStats> getGlobalStats();
  Future<IndiaStats> getIndiaStats();
  Future<List> getStateWiseStats();
  Future<List> getCountryStats();
}

class StatsRepository implements DataRepository {
  @override
  Future<GlobalStats> getGlobalStats() async {
    var response = await http.get(ApiUrls().worldUrl);

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);

      var data = GlobalStats.fromJson(jsonData);

      return data;
    } else {
      throw Exception();
    }
  }

  @override
  Future<IndiaStats> getIndiaStats() async {
    var response = await http.get(ApiUrls().indiaUrl);

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);

      var data = IndiaStats.fromJson(jsonData);

      return data;
    } else {
      throw Exception();
    }
  }

  @override
  List<Object> get props => null;

  @override
  bool get stringify => null;

  @override
  Future<List<List<dynamic>>> getStateWiseStats() async {
    var response = await http.get(ApiUrls().indiaUrl);

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);

      var data = IndiaStats.fromJson(jsonData);

      var stateData = List<List<dynamic>>();

      for (Regional region in data.data.regional) {
        int totalCases =
            region.confirmedCasesForeign + region.confirmedCasesIndian;
        stateData
            .add([region.loc, totalCases, region.deaths, region.discharged]);
      }

      // sort the list according to infected people number
      stateData.sort((a, b) => (b[1].compareTo(a[1])));

      return stateData;
    } else {
      throw Exception();
    }
  }

  @override
  Future<List> getCountryStats() async {
    Map<String, List<dynamic>> c = Map();
    List<List<dynamic>> data = List();

    var response = await http.get(ApiUrls().countryUrl);

    if (response.statusCode == 200) {
      // print(json.decode(response.body));
      var data = await json.decode(response.body);
      for (final country in data) {
        var name = country['countryRegion'];
        if (c.containsKey(country['countryRegion'])) {
          c[name][1] += country['confirmed'];
          c[name][2] += country['deaths'];
          c[name][3] += country['recovered'];
        } else {
          List<dynamic> newList = List();
          newList = [
            country['countryRegion'],
            country['confirmed'],
            country['deaths'],
            country['recovered'],
            country['lat'],
            country['long'],
          ];
          c[name] = newList;
        }
      }
    } else {
      throw Exception();
    }
    data = c.values.toList()..sort((a, b) => (b[1].compareTo(a[1])));
    return data;
  }
}
