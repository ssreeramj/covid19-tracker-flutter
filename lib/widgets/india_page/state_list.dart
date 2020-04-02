import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildStateList extends StatelessWidget {
  final data;
  BuildStateList(this.data);

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
      child: FadeIn(
        // duration: Duration(milliseconds: 250),
          delay: Duration(milliseconds: 1750),
              child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey, width: 2)),
          // color: Colors.white,
          height: _height * 0.45,
          width: 1080.w,
          child: SingleChildScrollView(
            child: DataTable(
              columnSpacing: 0,
              headingRowHeight: 130.h,
              dataRowHeight: 100.h,
              columns: [
                DataColumn(label: Padding(
                  padding: EdgeInsets.only(left: 25.w),
                  child: headers('State/UT'),
                )),
                DataColumn(label: headers('Total\nCases')),
                DataColumn(label: headers('Deaths')),
                DataColumn(label: headers('Recovered')),
              ],
              rows: buildDataRows(),
            ),
          ),
        ),
      ),
    );
  }

  List<DataRow> buildDataRows() {
    List<DataRow> dRow = [];
    for (var state in data) {
      List<DataCell> dCell = [];
      for (var value in state) {
        dCell.add(DataCell(textWidget(value.toString())));
      }
      dRow.add(DataRow(cells: dCell));
    }
    return dRow;
  }

  Widget textWidget(String text) {
    return Center(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 32.sp,
          fontFamily: 'Montserrat',
          color: Colors.black,
        ),
      ),
    );
  }

  Widget headers(String name) {
    return Text(
      name,
      style: TextStyle(
          fontSize: 35.sp,
          fontFamily: 'Montserrat',
          color: Colors.black,
          fontWeight: FontWeight.w500),
    );
  }
}
