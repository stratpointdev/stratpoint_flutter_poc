import 'package:flutter/material.dart';

class BillPayment extends StatefulWidget {
  final GlobalKey key;
  final String paymentAmountValue;
  final String dueDate;
  final VoidCallback onRefresh;
  final String lastPaymentAmount;
  final String lastPaymentDate;
  final String dateNow;
  BillPayment(
      {this.key,
      this.paymentAmountValue,
      this.dueDate,
      this.onRefresh,
      this.lastPaymentAmount,
      this.lastPaymentDate,
      this.dateNow});

  @override
  _BillPayment createState() => _BillPayment();
}

class _BillPayment extends State<BillPayment> {
  // static const IconData refresh = IconData(0xe5d5, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 562,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: Text("Bill Payment",
                style: TextStyle(fontSize: 22, color: Color(0xff244857)),
                textAlign: TextAlign.left),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(left: 20,top: 20,bottom: 20),
            height: 382,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("Amount to pay :",
                        style:TextStyle(fontSize: 18, color: Color(0xff244857)),
                        textAlign: TextAlign.left),

                    Spacer(),
                    //add refresh icon here

                    IconButton(
                      onPressed: widget.onRefresh,
                      icon: Icon(Icons.refresh),
                    )
                    //end of refresh icon here
                  ],
                ),

                Text(
                  "Due on " + widget.dueDate,
                  style: TextStyle(fontSize: 14, color: Color(0xff244857)),
                  textAlign: TextAlign.left,
                ),


                Padding(
                  padding:  EdgeInsets.only(bottom : 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Spacer(),
                      //add refresh icon here
                      Padding(
                        padding:  EdgeInsets.only(right: 33.0),
                        child: Text(widget.paymentAmountValue,
                            style: TextStyle(fontSize: 36, color: Color(0xff244857),fontWeight: FontWeight.w700),
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
                        width: 211,
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

                Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Container(
                        height: 0.5, width: 130.0, color: Color(0xff979797))),
                Padding(
                  padding:  EdgeInsets.only(right : 20.0,top:30.0,bottom: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("Last Load Amount",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff244857)),
                          textAlign: TextAlign.left),
                      Spacer(),
                      Text(widget.lastPaymentAmount,
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff244857)),
                          textAlign: TextAlign.left),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("Last Load Date",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff244857)),
                          textAlign: TextAlign.left),
                      Spacer(),
                      Text(widget.lastPaymentDate,
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff244857)),
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
