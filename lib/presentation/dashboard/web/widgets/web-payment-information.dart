import 'package:flutter/material.dart';

class WebPaymentInformationWidget extends StatefulWidget {
  WebPaymentInformationWidget({
    this.dueDate = 'May 3',
    this.dueAmount = '1,798.03',
    this.lastPaymentAmount = '1,839.00',
    this.lastPaymentDate = 'Mar. 15, 2020',
    this.onRefresh,
    this.onPayNow
  });
  final String dueDate;
  final String dueAmount;
  final String lastPaymentAmount;
  final String lastPaymentDate;
  final VoidCallback onRefresh;
  final VoidCallback onPayNow;

  @override
  _WebPaymentInformationWidget createState() => _WebPaymentInformationWidget();
}

class _WebPaymentInformationWidget extends State<WebPaymentInformationWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Bills Payment',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color(0xff244857),
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 40),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Amount to pay :',
                        style: TextStyle(
                          color: Color(0xff244857),
                          fontFamily: 'FSElliotPro',
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: widget.onRefresh,
                          icon: Icon(Icons.refresh),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Due on ${widget.dueDate}',
                    style: const TextStyle(
                      color: Color(0xff244857),
                      fontFamily: 'FSElliotPro',
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        '\u20B1${widget.dueAmount}',
                        style: TextStyle(
                          color: const Color(0xff244857),
                          fontFamily: 'FSElliotPro',
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RawMaterialButton(
                        onPressed: () => null,
                        child: Text(
                          'View Details',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        height: 40,
                        child: RawMaterialButton(
                          onPressed: widget.onPayNow,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          fillColor: const Color(0xff009CDF),
                          child: Center(
                            child: Text(
                              'Pay Now',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 24),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(color: const Color(0xffD4D4D4).withOpacity(0.5), width: 1.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Last Payment Amount',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '\u20B1${widget.lastPaymentAmount}',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Last Payment Date',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        widget.lastPaymentDate,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
