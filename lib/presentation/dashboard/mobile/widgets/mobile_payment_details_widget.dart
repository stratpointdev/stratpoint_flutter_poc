import 'package:flutter/material.dart';
import 'package:globe_one_poc_project/presentation/presentation_util/media_query_util.dart';

class MobilePaymentDetailsWidget extends StatefulWidget {
  final String paymentAmountValue;
  final String dueDate;
  final GestureTapCallback payNowButtonOnPressed;
  final GestureTapCallback viewBillButtonOnPressed;

  const MobilePaymentDetailsWidget({
    Key key,
    this.paymentAmountValue,
    this.dueDate,
    this.payNowButtonOnPressed,
    this.viewBillButtonOnPressed,
  }) : super(key: key);

  @override
  _MobilePaymentInformationWidgetState createState() =>
      _MobilePaymentInformationWidgetState();
}

class _MobilePaymentInformationWidgetState
    extends State<MobilePaymentDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(20.0),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Amount to pay",
                style: TextStyle(
                  fontSize: MediaQueryUtil.convertHeight(screenHeight, 14),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'FSElliotPro',
                  color: Color(0xff019CDE),
                ),
              ),
              Text(
                widget.paymentAmountValue,
                key: Key('paymentAmountWidget'),
                style: TextStyle(
                  fontSize: MediaQueryUtil.convertHeight(screenHeight, 14),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'FSElliotPro',
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: <Widget>[
              Text(
                'Due on ' + widget.dueDate,
                key: Key('paymentDueDateWidget'),
                style: TextStyle(
                  fontSize: MediaQueryUtil.convertHeight(screenHeight, 11),
                  color: Theme.of(context).hintColor,
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onPressed: widget.payNowButtonOnPressed,
                  textColor: Theme.of(context).accentColor,
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    'Pay now',
                    style: TextStyle(
                      fontSize: MediaQueryUtil.convertHeight(screenHeight, 11),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'FSElliotPro',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: widget.viewBillButtonOnPressed,
                  textColor: Color(0xff007DB3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'View My Bill',
                        style: TextStyle(
                          fontSize:
                              MediaQueryUtil.convertHeight(screenHeight, 11),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'FSElliotPro',
                        ),
                      ),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
