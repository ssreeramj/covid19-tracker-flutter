import 'package:test2/widgets/global_page/app_bar.dart';
import 'package:test2/widgets/global_page/country_list.dart';
import 'package:test2/widgets/stats_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalPage extends StatelessWidget {
  final globalStats;
  final countryStats;

  GlobalPage({@required this.globalStats, @required this.countryStats});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      body: Column(
        children: <Widget>[
          GlobalAppBar(
            countryData: countryStats,
          ),
          SizedBox(
            height: 60.h,
          ),
          BuildStatsContainer(
            confirmedCases: globalStats.confirmed.value.toString(),
            deadCases: globalStats.deaths.value.toString(),
            recovCases: globalStats.recovered.value.toString(),
          ),
          BuildCountryList(countryStats),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.keyboard_arrow_right, size: 19),
                Icon(Icons.keyboard_arrow_right, size: 19),
                Icon(Icons.keyboard_arrow_right, size: 19),
                Icon(Icons.keyboard_arrow_right, size: 19),
                Icon(Icons.keyboard_arrow_right, size: 19),
              ],
            ),
          )
        ],
      ),
    );
  }
}
