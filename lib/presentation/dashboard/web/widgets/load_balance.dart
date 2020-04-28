import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:globe_one_poc_project/domain/dashboard/common/datetime_converter.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/entities/payment_details_model.dart';
import 'package:intl/intl.dart';

class LoadBalance extends StatefulWidget {
  final String paymentAmountValue;
  final String dueDate;
  final LastPaymentDt lastPaymentDt;
  final VoidCallback onRefresh;
  LoadBalance(
      {this.paymentAmountValue,
      this.dueDate,
      this.lastPaymentDt,
      this.onRefresh});

  @override
  _LoadBalance createState() => _LoadBalance();
}

class _LoadBalance extends State<LoadBalance> {
  static const IconData refresh = IconData(0xe5d5, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 562,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 30, bottom: 10),
            child: Text("Load Balance",
                style: TextStyle(fontSize: 22, color: Color(0xff244857)),
                textAlign: TextAlign.left),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(20),
            height: 382,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                          "As of " + DateTimeConverter.getDateWithYearNow(),
                          style:
                              TextStyle(fontSize: 18, color: Color(0xff244857)),
                          textAlign: TextAlign.left),
                    ),

                    Spacer(),

                    //add refresh icon here
                    Padding(
                      padding: EdgeInsets.only(right: 0),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: widget.onRefresh,
                        icon: Icon(Icons.refresh),
                      ),
                    )
                    //end of refresh icon here
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Text(
                    "Expires on " +
                        DateTimeConverter.convertToDateTime(widget.dueDate),
                    style: TextStyle(fontSize: 18, color: Color(0xff244857)),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Text(
                      NumberFormat.currency(decimalDigits: 2, symbol: '₱')
                          .format(double.parse(widget.paymentAmountValue)),
                      style: TextStyle(fontSize: 36, color: Color(0xff244857)),
                      textAlign: TextAlign.left),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Text("View Loading History",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff244857),
                          decoration: TextDecoration.underline),
                      textAlign: TextAlign.left),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                        height: 1.0, width: 130.0, color: Color(0xff979797))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 30, bottom: 10),
                      child: Text("Last Load Amount",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff244857)),
                          textAlign: TextAlign.left),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                          NumberFormat.currency(decimalDigits: 2, symbol: '₱')
                              .format(widget.lastPaymentDt.amount),
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff244857)),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text("Last Load Date",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff244857)),
                          textAlign: TextAlign.left),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                          DateTimeConverter.convertToDate(
                              widget.lastPaymentDt.paymentDate),
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff244857)),
                          textAlign: TextAlign.left),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
