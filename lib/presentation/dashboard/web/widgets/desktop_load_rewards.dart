import 'package:globe_one_poc_project/presentation/dashboard/web/widgets/load_balance.dart';
import 'package:globe_one_poc_project/presentation/dashboard/web/widgets/reward_points.dart';
import 'package:flutter/cupertino.dart';

class DesktopLoadRewards extends StatefulWidget {

  const DesktopLoadRewards();

  @override
  _DesktopLoadRewards createState() => _DesktopLoadRewards();

}

class _DesktopLoadRewards extends State<DesktopLoadRewards> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Row(
        children: <Widget>[
          Spacer(),

          LoadBalance(),
          RewardPoints(),

          Spacer()
        ],
      ),
    );
  }
}