import 'package:flutter/material.dart';

class MobilePaymentInformationWidget extends StatefulWidget {
  MobilePaymentInformationWidget({Key key}) : super(key: key);

  @override
  _MobilePaymentInformationWidgetState createState() =>
      _MobilePaymentInformationWidgetState();
}

class _MobilePaymentInformationWidgetState
    extends State<MobilePaymentInformationWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Column(
          children: <Widget>[
            PaymentAmountRow(),
            SizedBox(
              height: 8,
            ),
            Row(
              children: <Widget>[
                Text(
                  "Due on May 13",
                  style: TextStyle(
                    fontSize: 10.0,
                    color: Color(0xff7F7F7F),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            UserActionRow(),
          ],
        ),
      ),
    );
  }
}

class PaymentAmountRow extends StatefulWidget {
  PaymentAmountRow({Key key}) : super(key: key);

  @override
  _PaymentAmountRowState createState() => _PaymentAmountRowState();
}

class _PaymentAmountRowState extends State<PaymentAmountRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Amount to pay",
          style: TextStyle(
            fontSize: 14.0,
            color: Color(0xff019CDE),
          ),
        ),
        Text(
          "P1,798.03",
          style: TextStyle(
            fontSize: 14.0,
            color: Color(0xff111111),
          ),
        ),
      ],
    );
  }
}

class UserActionRow extends StatelessWidget {
  const UserActionRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0)),
            onPressed: () {},
            textColor: Colors.white,
            child: Text(
              "Pay Now",
              style: TextStyle(fontSize: 11.0),
            ),
            color: Color(0xff0056BF),
          ),
        ),
        Expanded(
          child: FlatButton(
            onPressed: () {},
            textColor: Color(0xff007DB3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "View My Bill",
                  style: TextStyle(fontSize: 11.0),
                ),
                Icon(
                  Icons.chevron_right,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
