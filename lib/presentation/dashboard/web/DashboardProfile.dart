import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/api.dart';
import 'package:globe_one_poc_project/presentation/dashboard/mobile/widgets/mobile_payment_information_widget.dart';

class DashboardProfile extends StatefulWidget {
  const DashboardProfile(
      {this.profile, this.mobile, this.duoNumber, this.profilePicture});

  final String profile;
  final String mobile;
  final String duoNumber;
  final String profilePicture;
  @override
  _DashboardProfile createState() => _DashboardProfile();
}

class _DashboardProfile extends State<DashboardProfile> {
  static const IconData expand_more =
      IconData(0xe5cf, fontFamily: 'MaterialIcons');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  var _checkob;
  void _loadData() async {
    _checkob = await getOutstandingBalance();
    /*   var _checkVal = await getAccountBalance();
    var _checklp = await getLastPayment();
  print("balance " + _checkVal.arBalance.toString());
    print("lastpayment " + _checklp.amount.toString());*/
    setState(() {
      print("balance " + _checkob.accountBalance.arBalance.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff037DB4),
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
        child: Column(children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 20, 10),
                      child: CircleAvatar(
                        radius: 40.0,
                        backgroundImage: NetworkImage(widget.profilePicture),
                        backgroundColor: Colors.transparent,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 15, 15, 5),
                      child: Text(widget.profile,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 5),
                      child: Text(widget.mobile,
                          style: TextStyle(fontSize: 14, color: Colors.white),
                          textAlign: TextAlign.left),
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(15, 5, 5, 10),
                          child: Text("View other accounts",
                              style: TextStyle(
                                  fontSize: 12, color: Color(0x80ffffff)),
                              textAlign: TextAlign.left),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 5, 5, 10),
                          child: Icon(expand_more, color: Color(0x80ffffff)),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 15, 15, 5),
                      child: Text("Duo Number",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                          textAlign: TextAlign.left),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 5),
                      child: Text(widget.duoNumber,
                          style: TextStyle(fontSize: 14, color: Colors.white),
                          textAlign: TextAlign.left),
                    )
                  ],
                ),
              )
            ],
          ),
          MobilePaymentInformationWidget(
            paymentAmountValue: _checkob.accountBalance.arBalance.toString(),
            payNowButtonOnPressed: () {},
            viewBillButtonOnPressed: () {},
          )
        ]),
      ),
    );
  }
}
