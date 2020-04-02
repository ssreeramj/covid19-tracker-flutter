import 'package:test2/bloc/stats_bloc.dart';
import 'package:test2/data/models/global_stats.dart';
import 'package:test2/data/models/india_stats.dart';
import 'package:test2/widgets/global_page/show_page.dart';
import 'package:test2/widgets/india_page/india_states_page.dart';
import 'package:test2/widgets/init_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'data/data_repository.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COVID-19 Stats',
      debugShowCheckedModeBanner: false,

      home: BlocProvider(
        create: (context) => StatsBloc(StatsRepository()),
        child: HomePage(),
      ),
      // home: HomePage()
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    ScreenUtil.init(context);

    return Scaffold(
      body: BlocBuilder<StatsBloc, StatsState>(
        builder: (context, state) {
          if (state is StatsInitial) {
            return buildInitialState();
          } else if (state is StatsLoading) {
            return buildLoadingState();
          } else if (state is StatsLoaded) {
            return buildLoadedState(width, height, state.globalData,
                state.indiaData, state.stateData, state.countryData);
          } else if (state is ShowGoogleMap) {
            // return googleMapWidget();
          }
        },
      ),
    );
  }

  Widget buildLoadedState(
    double height,
    double width,
    GlobalStats globStat,
    IndiaStats indStats,
    List<List<dynamic>> stateStats,
    List<List<dynamic>> countryStats,
  ) {
    return PageView(
      children: <Widget>[
        GlobalPage(
          globalStats: globStat,
          countryStats: countryStats,
        ),
        IndiaPage(
          indStats: indStats,
          stateStats: stateStats,
          countryStats: countryStats,
        ),
        // BuildGoogleMap(countryData: countryStats),
      ],
    );
  }

  Widget buildLoadingState() {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.indigo[900],
              Colors.blue[900],
              Colors.lightBlue[700],
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white70),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInitialState() {
    return Scaffold(
      body: InitialScreen(),
    );
  }
}



// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:test2/core/const.dart';


// void main() {
//   getCountryStats();
// }

// getCountryStats() async {
//     Map<String, List<dynamic>> c = Map();
//     List<List<dynamic>> data = List();

//     var response = await http.get(ApiUrls().countryUrl);

//     if (response.statusCode == 200) {
//       // print(json.decode(response.body));
//       var data = await json.decode(response.body);
//       // print(data[0]);
//       for (final country in data) {
//         // print(country);
//         var name = country['countryRegion'];
//         if (c.containsKey(country['countryRegion'])) {
//           c[name][1] += country['confirmed'];
//           c[name][2] += country['deaths'];
//           c[name][3] += country['recovered'];
//         } else {
//           List<dynamic> newList = List();
//           newList = [
//             country['countryRegion'],
//             country['confirmed'],
//             country['deaths'],
//             country['recovered'],
//             country['lat'],
//             country['long'],
//           ];
//           c[name] = newList;
//         }
//         // break;
//       }
//     } else {
//       throw Exception();
//     }
//     data = c.values.toList()..sort((a, b) => (b[1].compareTo(a[1])));
//     print(data);
//     return data;
//   }