import 'package:test2/bloc/stats_bloc.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InitialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SplashScreen());
  }
}

class SplashScreen extends StatelessWidget {
  final custTextStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w700,
    fontSize: 140.sp,
    color: Colors.white70,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.indigo[900],
          Colors.blue[900],
          Colors.lightBlue[700],
        ], begin: Alignment.centerLeft, end: Alignment.centerRight),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FadeInDown(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text('DID YOU', style: custTextStyle),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FadeInLeft(
                    child: Text('WASH', style: custTextStyle),
                    delay: Duration(milliseconds: 500),
                  ),
                  FadeInRight(
                    child: Text(' YOUR', style: custTextStyle),
                    delay: Duration(milliseconds: 500),
                  ),
                ],
              ),
            ),
            FadeInUp(
              delay: Duration(seconds: 1),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text('HANDS?', style: custTextStyle),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  BounceInLeft(
                    delay: Duration(milliseconds: 1500),
                    child: MaterialButton(
                      height: 150.h,
                      minWidth: 650.w,
                      onPressed: () {
                        BlocProvider.of<StatsBloc>(context)
                            .add(RefreshStatsEvent());
                      },
                      color: Colors.redAccent,
                      child: Text(
                        'No, Will wash now..',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w300,
                          fontSize: 50.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  BounceInUp(
                    delay: Duration(seconds: 2),
                    child: MaterialButton(
                      height: 150.h,
                      minWidth: 650.w,
                      onPressed: () {
                        BlocProvider.of<StatsBloc>(context)
                            .add(RefreshStatsEvent());
                      },
                      color: Colors.green,
                      child: Text(
                        'Yes, Already washed!!',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w300,
                          fontSize: 50.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
