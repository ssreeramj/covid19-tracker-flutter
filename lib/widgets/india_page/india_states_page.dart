import 'package:test2/widgets/india_page/app_bar.dart';
import 'package:test2/widgets/india_page/state_list.dart';
import 'package:test2/widgets/stats_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndiaPage extends StatelessWidget {
  IndiaPage(
      {Key key,
      @required this.indStats,
      @required this.stateStats,
      @required this.countryStats})
      : super(key: key);

  final indStats;
  final stateStats;
  final countryStats;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[350],
        body: Column(
          children: <Widget>[
            CustomAppBar(
              countryData: countryStats,
            ),
            SizedBox(
              height: 60.h,
            ),
            BuildStatsContainer(
              confirmedCases: indStats.data.summary.total.toString(),
              deadCases: indStats.data.summary.deaths.toString(),
              recovCases: indStats.data.summary.discharged.toString(),
            ),
            BuildStateList(stateStats),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.keyboard_arrow_left, size: 19),
                    Icon(Icons.keyboard_arrow_left, size: 19),
                    Icon(Icons.keyboard_arrow_left, size: 19),
                    Icon(Icons.keyboard_arrow_left, size: 19),
                    Icon(Icons.keyboard_arrow_left, size: 19),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
