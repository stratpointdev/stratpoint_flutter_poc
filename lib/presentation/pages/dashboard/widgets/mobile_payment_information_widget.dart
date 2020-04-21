import 'package:flutter/material.dart';

class MobilePaymentInformationWidget extends StatefulWidget {
  final String paymentAmountLabel;
  final Color paymentAmountLabelColor;
  final double paymentAmountLabelFontSize;

  final String paymentAmountValue;
  final Color paymentAmountValueColor;
  final double paymentAmountValueFontSize;

  final String dueDate;
  final Color dueDateTextColor;
  final double dueDateFontSize;

  final String payNowButtonLabel;
  final Color payNowButtonColor;
  final Color payNowButtonTextColor;
  final double payNowButtonFontSize;
  final double payNowButtonRadius;
  final GestureTapCallback payNowButtonOnPressed;

  final String viewBillButtonLabel;
  final Color viewBillButtonTextColor;
  final double viewBillButtonFontSize;
  final IconData viewBillButtonIcon;
  final GestureTapCallback viewBillButtonOnPressed;

  const MobilePaymentInformationWidget(
      Key key,
      this.paymentAmountLabel,
      this.paymentAmountLabelColor,
      this.paymentAmountLabelFontSize,
      this.paymentAmountValue,
      this.paymentAmountValueColor,
      this.paymentAmountValueFontSize,
      this.dueDate,
      this.dueDateTextColor,
      this.dueDateFontSize,
      this.payNowButtonLabel,
      this.payNowButtonColor,
      this.payNowButtonTextColor,
      this.payNowButtonFontSize,
      this.payNowButtonRadius,
      this.payNowButtonOnPressed,
      this.viewBillButtonLabel,
      this.viewBillButtonTextColor,
      this.viewBillButtonFontSize,
      this.viewBillButtonIcon,
      this.viewBillButtonOnPressed)
      : super(key: key);

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  widget.paymentAmountLabel,
                  style: TextStyle(
                    fontSize: widget.paymentAmountLabelFontSize,
                    color: widget.paymentAmountLabelColor,
                  ),
                ),
                Text(
                  widget.paymentAmountValue,
                  style: TextStyle(
                    fontSize: widget.paymentAmountValueFontSize,
                    color: widget.paymentAmountValueColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: <Widget>[
                Text(
                  widget.dueDate,
                  style: TextStyle(
                    fontSize: widget.dueDateFontSize,
                    color: widget.dueDateTextColor,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(widget.payNowButtonRadius)),
                    onPressed: widget.payNowButtonOnPressed,
                    textColor: widget.payNowButtonTextColor,
                    color: widget.payNowButtonColor,
                    child: Text(
                      widget.payNowButtonLabel,
                      style: TextStyle(fontSize: widget.payNowButtonFontSize),
                    ),
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    onPressed: widget.viewBillButtonOnPressed,
                    textColor: widget.viewBillButtonTextColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          widget.viewBillButtonLabel,
                          style: TextStyle(
                              fontSize: widget.viewBillButtonFontSize),
                        ),
                        Icon(
                          widget.viewBillButtonIcon,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
