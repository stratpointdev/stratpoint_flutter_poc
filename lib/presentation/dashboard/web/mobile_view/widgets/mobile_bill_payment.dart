import 'package:flutter/material.dart';

class MobileViewBillPayment extends StatefulWidget {
  final GlobalKey key;
  final String paymentAmountValue;
  final String dueDate;
  final VoidCallback onRefresh;
  final String lastPaymentAmount;
  final String lastPaymentDate;
  final String dateNow;
  MobileViewBillPayment(
      {this.key,
      this.paymentAmountValue,
      this.dueDate,
      this.onRefresh,
      this.lastPaymentAmount,
      this.lastPaymentDate,
      this.dateNow});

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
            padding: EdgeInsets.only(left: 16,top: 16,bottom: 12),
            child: Text("Bills Payment",
                style: TextStyle(fontSize: 22, color: Color(0xff244857), fontWeight: FontWeight.w100),
                textAlign: TextAlign.left, ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(left: 20,top: 20,bottom: 20),
            height: 199,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Amount to pay :",
                            style:TextStyle(fontSize: 16, color: Color(0xff244857)),
                            textAlign: TextAlign.left),
                        const SizedBox(height: 4),
                        Text(
                          "Due on " + widget.dueDate,
                          style: TextStyle(fontSize: 14, color: Color(0xff244857)),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    Center(
                      child: SizedBox(
                        height: 15,
                        width: 15,
                        child:   IconButton(
                          onPressed: widget.onRefresh,
                          icon: Icon(Icons.refresh),
                        )
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding:  EdgeInsets.only(bottom : 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Spacer(),
                      //add refresh icon here
                      Padding(
                        padding:  EdgeInsets.only(right: 20.0),
                        child: Text(widget.paymentAmountValue,
                            style: TextStyle(fontSize: 26, color: Color(0xff244857),fontWeight: FontWeight.w700),
                            textAlign: TextAlign.left),
                      ),
                      //end of refresh icon here
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 20.0,bottom: 26.0),
                  child: Row(
                    children: <Widget>[
                      Text("View Bills",
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff244857),
                              decoration: TextDecoration.underline,fontWeight: FontWeight.w700),
                          textAlign: TextAlign.left),
                      Spacer(),
                      Container(
                        height: 40,
                        width: 179,
                        child: RawMaterialButton(
                          onPressed: (){},
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
