import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildCountryList extends StatelessWidget {
  final data;
  BuildCountryList(this.data);

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
                DataColumn(label: headers('Country')),
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
    List<DataRow> dRow = List();
    for (var country in data) {
      List<DataCell> dCell = [];
      for (var value in country.sublist(0, 4)) {
        dCell.add(DataCell(textWidget(value.toString())));
      }
      dRow.add(DataRow(cells: dCell));
    }
    return dRow;
  }

  List<Row> buildRow() {
    List<Row> row = List();
    for (var country in data) {
      List<Widget> item = List();
      for (var value in country.sublist(0, 4)) {
        item.add(Text(value.toString()));
      }
      row.add(Row(
        children: item,
      ));
    }
    return row;
  }

  Widget textWidget(String text) {
    return Container(
      width: 220.w,
      child: Text(
        text,
        // textAlign: TextAlign.center,
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
