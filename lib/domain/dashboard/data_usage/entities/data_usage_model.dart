/// This entity contains all of the objects
/// needed for parsing the response of the
/// Data Usage API.
class DataUsageModel {
  DataUsageModel({this.responseCode, this.promoSubscriptionUsage});

  factory DataUsageModel.fromJson(Map<String, dynamic> json) {
    return DataUsageModel(
      responseCode: json['responseCode'] as int,
      promoSubscriptionUsage: PromoSubscriptionUsage.fromJson(
          json['promoSubscriptionUsage'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'promoSubscriptionUsage': promoSubscriptionUsage.toJson(),
    };
  }

  int responseCode;
  List<BalanceByMsisdnError> errors;
  PromoSubscriptionUsage promoSubscriptionUsage;
}

class BalanceByMsisdnError {}

class PromoSubscriptionUsage {
  PromoSubscriptionUsage({this.mainData});

  PromoSubscriptionUsage.fromJson(Map<String, dynamic> json) {
    if (json['mainData'] != null) {
      mainData = <MainData>[];
      json['mainData'].forEach((dynamic v) async {
        mainData.add(MainData.fromJson(v as Map<String, dynamic>));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (mainData != null) {
      data['mainData'] = mainData.map((MainData v) => v.toJson()).toList();
    }

    return data;
  }

  List<MainData> mainData;
}

class MainData {
  MainData(
      {this.skelligWallet,
      this.skelligCategory,
      this.dataRemaining,
      this.dataTotal,
      this.dataUsed,
      this.endDate,
      this.type});

  factory MainData.fromJson(Map<String, dynamic> json) {
    return MainData(
        skelligWallet: json['skelligWallet'].toString(),
        skelligCategory: json['skelligCategory'].toString(),
        dataRemaining: json['dataRemaining'],
        dataTotal: json['dataTotal'],
        dataUsed: json['dataUsed'],
        endDate: json['endDate'].toString(),
        type: json['type'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['skelligWallet'] = skelligWallet;
    data['skelligCategory'] = skelligCategory;
    data['dataRemaining'] = dataRemaining;
    data['dataTotal'] = dataTotal;
    data['dataUsed'] = dataUsed;
    data['endDate'] = endDate;
    data['type'] = type;

    return data;
  }

  String skelligWallet;
  String skelligCategory;
  dynamic dataRemaining;
  dynamic dataTotal;
  dynamic dataUsed;
  String endDate;
  String type;
}
