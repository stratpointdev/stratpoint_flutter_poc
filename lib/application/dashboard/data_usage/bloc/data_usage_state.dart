


abstract class DataUsageState {
  const DataUsageState();

}

class SuccessState extends DataUsageState{
      String remainingData;
      String totalData;
      String refillDate;
      SuccessState({this.remainingData,this.totalData,this.refillDate});
}


class InitialState extends DataUsageState{}





