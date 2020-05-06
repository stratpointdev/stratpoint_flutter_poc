import 'package:flutter/material.dart';

class MobileViewPaymentDetails extends StatefulWidget {
  MobileViewPaymentDetails(
      {Key key,
      this.paymentAmountValue = 'P123.45',
      this.dueDate,
      this.onRefresh,
      this.dateNow})
      : super(key: key);
  final String paymentAmountValue;
  final String dueDate;
  final GestureTapCallback onRefresh;
  final String dateNow;

  @override
  _MobileViewPaymentDetailsState createState() =>
      _MobileViewPaymentDetailsState();
}

class _MobileViewPaymentDetailsState extends State<MobileViewPaymentDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 16, top: 22, bottom: 16),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const Material(
                  child: Text(
                    'Load Balance',
                    style: TextStyle(
                      fontSize: 22,
                      color: Color(0xff244958),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 16, bottom: 16),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Material(
                      child: Text(
                        'As of ${widget.dateNow}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xff244857),
                        ),
                      ),
                    ),
                    Material(
                      child: IconButton(
                        onPressed: widget.onRefresh,
                        icon: Icon(
                          Icons.refresh,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Material(
                      child: Text(
                        'Expires on ${widget.dueDate}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xff244857),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Material(
                      child: Text(
                        widget.paymentAmountValue,
                        style: const TextStyle(
                          fontSize: 26,
                          color: Color(0xff244857),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: <Widget>[
                    Material(
                      child: Text(
                        'View Loading History',
                        style: TextStyle(
                          fontSize: 14,
                          color: const Color(0xff244857),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
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
