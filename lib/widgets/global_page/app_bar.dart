import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';
import 'package:test2/core/const.dart';
import 'package:test2/widgets/google_map/show_map.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GlobalAppBar extends StatelessWidget {
  final countryData;

  const GlobalAppBar({Key key, this.countryData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Column(
        children: <Widget>[
          FadeIn(
            duration: Duration(milliseconds: 500),
            // delay: Duration(milliseconds: 250),
            child: Container(
              height: _height * 0.155,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors().darkPurple,
                    AppColors().purple,
                    AppColors().lightPurple
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'CORONAVIRUS',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                            fontSize: 75.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'PANDEMIC',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                            fontSize: 75.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 25.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => BuildGoogleMap(
                              countryData: countryData,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 210.h,
                        width: 210.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FaIcon(FontAwesomeIcons.globe),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'SEE MAP',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          FadeIn(
            duration: Duration(milliseconds: 500),
            delay: Duration(milliseconds: 250),
            child: Container(
              padding: EdgeInsets.only(left: 25),
              color: Colors.redAccent,
              width: 1080.w,
              height: 150.h,
              child: Row(
                children: <Widget>[
                  Text(
                    'Tracking ',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontSize: 60.sp,
                      // fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'global cases',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontSize: 60.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
