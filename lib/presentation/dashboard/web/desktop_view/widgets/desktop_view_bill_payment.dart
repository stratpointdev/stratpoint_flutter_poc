import 'package:flutter/material.dart';

class DesktopViewBillPayment extends StatefulWidget {
  final GlobalKey key;
  final String paymentAmountValue;
  final String dueDate;
  final VoidCallback onRefresh;
  final String lastPaymentAmount;
  final String lastPaymentDate;
  final String dateNow;
  DesktopViewBillPayment(
      {this.key,
      this.paymentAmountValue,
      this.dueDate,
      this.onRefresh,
      this.lastPaymentAmount,
      this.lastPaymentDate,
      this.dateNow});

  @override
  _DesktopViewBillPayment createState() => _DesktopViewBillPayment();
}

class _DesktopViewBillPayment extends State<DesktopViewBillPayment> {
  // static const IconData refresh = IconData(0xe5d5, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 562,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              'Bills Payment',
              style: TextStyle(
                  fontSize: 22,
                  color: const Color(0xff244857),
                  fontWeight: FontWeight.w100),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
            height: 343,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text('Amount to pay :',
                            style: TextStyle(
                                fontSize: 18, color: Color(0xff244857)),
                            textAlign: TextAlign.left),
                        const SizedBox(height: 4),
                        Text(
                          'Due on ' + widget.dueDate,
                          style: const TextStyle(
                              fontSize: 14, color: Color(0xff244857)),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    IconButton(
                      alignment: Alignment.topCenter,
                      onPressed: widget.onRefresh,
                      icon: Icon(Icons.refresh),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 22, bottom: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const Spacer(),
                      //add refresh icon here
                      Padding(
                        padding: const EdgeInsets.only(right: 33.0),
                        child: Text(widget.paymentAmountValue,
                            style: TextStyle(
                                fontSize: 36,
                                color: const Color(0xff244857),
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.left),
                      ),
                      //end of refresh icon here
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0, bottom: 26.0),
                  child: Row(
                    children: <Widget>[
                      Text('View Bills',
                          style: TextStyle(
                              fontSize: 14,
                              color: const Color(0xff244857),
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w700),
                          textAlign: TextAlign.left),
                      const Spacer(),
                      Container(
                        height: 40,
                        width: 211,
                        child: RawMaterialButton(
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          fillColor: const Color(0xff009CDF),
                          child: Center(
                            child: Text(
                              'Pay Now',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                        height: 0.5,
                        width: 130.0,
                        color: const Color(0xff979797))),
                Padding(
                  padding: const EdgeInsets.only(
                      right: 20.0, top: 30.0, bottom: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const Text('Last Payment Amount',
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff244857)),
                          textAlign: TextAlign.left),
                      const Spacer(),
                      Text(widget.lastPaymentAmount,
                          style: const TextStyle(
                              fontSize: 16, color: Color(0xff244857)),
                          textAlign: TextAlign.left),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const Text('Last Payment Date',
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff244857)),
                          textAlign: TextAlign.left),
                      const Spacer(),
                      Text(widget.lastPaymentDate,
                          style: const TextStyle(
                              fontSize: 16, color: Color(0xff244857)),
                          textAlign: TextAlign.left),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
