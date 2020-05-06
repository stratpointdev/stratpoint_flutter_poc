
import 'package:flutter/material.dart';

class DesktopViewLoadBalance extends StatefulWidget {
  DesktopViewLoadBalance(
      {this.key,
      this.paymentAmountValue,
      this.dueDate,
      this.onRefresh,
      this.lastPaymentAmount,
      this.lastPaymentDate,
      this.dateNow});
  @override
  final GlobalKey key;
  final String paymentAmountValue;
  final String dueDate;
  final VoidCallback onRefresh;
  final String lastPaymentAmount;
  final String lastPaymentDate;
  final String dateNow;

  @override
  _DesktopViewLoadBalance createState() => _DesktopViewLoadBalance();
}

class _DesktopViewLoadBalance extends State<DesktopViewLoadBalance> {
  // static const IconData refresh = IconData(0xe5d5, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 562,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 30, bottom: 10),
            child: Text('Load Balance',
                style: TextStyle(fontSize: 22, color: Color(0xff244857)),
                textAlign: TextAlign.left),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(20),
            height: 382,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Text('As of ' + widget.dateNow,
                          style:
                              const TextStyle(fontSize: 18, color: Color(0xff244857)),
                          textAlign: TextAlign.left),
                    ),

                    const Spacer(),

                    //add refresh icon here
                    Padding(
                      padding: const EdgeInsets.only(right: 0),
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
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Text(
                    'Expires on ' + widget.dueDate,
                    style: const TextStyle(fontSize: 18, color: Color(0xff244857)),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Text(widget.paymentAmountValue,
                      style: const TextStyle(fontSize: 36, color: Color(0xff244857)),
                      textAlign: TextAlign.left),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Text('View Loading History',
                      style: TextStyle(
                          fontSize: 14,
                          color: const Color(0xff244857),
                          decoration: TextDecoration.underline),
                      textAlign: TextAlign.left),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                        height: 1.0, width: 130.0, color: const Color(0xff979797))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(top: 30, bottom: 10),
                      child: Text('Last Load Amount',
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff244857)),
                          textAlign: TextAlign.left),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 10),
                      child: Text(widget.lastPaymentAmount,
                          style:
                              const TextStyle(fontSize: 16, color: Color(0xff244857)),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text('Last Load Date',
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff244857)),
                          textAlign: TextAlign.left),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(widget.lastPaymentDate,
                          style:
                              const TextStyle(fontSize: 16, color: Color(0xff244857)),
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
