import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildStatsContainer extends StatelessWidget {
  const BuildStatsContainer({
    Key key,
    @required this.confirmedCases,
    @required this.deadCases,
    @required this.recovCases,
  }) : super(key: key);

  final String confirmedCases;
  final String deadCases;
  final String recovCases;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1080.w,
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FadeIn(
            child: buildStats(confirmedCases, 'TOTAL CASES', Colors.blueGrey),
            duration: Duration(milliseconds: 250),
            delay: Duration(milliseconds: 1000),
          ),
          FadeIn(
            child: buildStats(deadCases, 'DEATHS', Colors.red),
            duration: Duration(milliseconds: 250),
            delay: Duration(milliseconds: 1250),
          ),
          FadeIn(
            child: buildStats(recovCases, 'RECOVERED', Colors.green),
            duration: Duration(milliseconds: 250),
            delay: Duration(milliseconds: 1500),
          )
        ],
      ),
    );
  }

  Widget buildStats(String stat, String prop, Color color) {
    FaIcon getIcon(String prop) {
      if (prop == 'TOTAL CASES') {
        return FaIcon(
          FontAwesomeIcons.search,
          color: Colors.blue,
          size: 60.sp,
        );
      } else if (prop == 'DEATHS') {
        return FaIcon(
          FontAwesomeIcons.heartBroken,
          color: Colors.red,
          size: 60.sp,
        );
      } else {
        return FaIcon(
          FontAwesomeIcons.handHoldingHeart,
          color: Colors.green,
          size: 60.sp,
        );
      }
    }

    return Container(
      height: 300.h,
      width: 300.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey, width: 2)),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: getIcon(prop),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                prop,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 32.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                stat,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 45.sp,
                    color: color,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
