import 'package:flutter/material.dart';

class MobileViewBillPayment extends StatefulWidget {
  const MobileViewBillPayment(
      {Key key,
      this.paymentAmountValue,
      this.dueDate,
      this.onRefresh,
      this.lastPaymentAmount,
      this.lastPaymentDate,
      this.dateNow})
      : super(key: key);

  final String paymentAmountValue;
  final String dueDate;
  final VoidCallback onRefresh;
  final String lastPaymentAmount;
  final String lastPaymentDate;
  final String dateNow;

  @override
  _MobileViewBillPayment createState() => _MobileViewBillPayment();
}

class _MobileViewBillPayment extends State<MobileViewBillPayment> {
  // static const IconData refresh = IconData(0xe5d5, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 12),
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
            padding: const EdgeInsets.only(left: 20, top: 20),
            height: 210,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text('Amount to pay :',
                            style: TextStyle(
                                fontSize: 16, color: Color(0xff244857)),
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
                  padding: const EdgeInsets.only(bottom: 24.0,top: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const Spacer(),
                      //add refresh icon here
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Text(widget.paymentAmountValue,
                            style: const TextStyle(
                                fontSize: 26,
                                color:  Color(0xff244857),
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
                        width: 179,
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
