class Sample {


  static String retrieveSubcriberUsage = """
 {
  "responseCode": 200,
  "errors": [],
  "lastApiCall": 1551860679669,
  "retrieveSubscriberUsageResult": {
    "resultCode": "0",
    "description": "Success",
    "msisdn": "639957925316",
    "paymentCategory": "Prepaid",
    "state": "Active",
    "subscriberId": "639957925316190305",
    "customerId": null,
    "customerType": "Prepaid",
    "customerSubType": "Prepaid",
    "subscriberType": "MT",
    "activeDate": "2019-03-05T10:16:23",
    "brand": "GHP-Prepaid",
    "buckets": {
      "buckets": [
        {
          "bucketId": "PR_GAMES_AOV_NRG",
          "startDate": "2019-03-05T10:16:24",
          "endDate": "2019-03-07T11:07:36",
          "state": "Active",
          "volumeRemaining": "92160",
          "totalAllocated": "92160",
          "volumeUsed": "0",
          "type": "Bulk",
          "unit": "KB",
          "subscriptions": {
            "subscriptions": [
              {
                "subscriptionId": "63995792531619030518106905155175218410",
                "keyword": "PR_FREARENAOFVALOR30MB2DNRG",
                "startDate": "2019-03-05T10:16:24+08:00",
                "endDate": "2019-03-07T11:07:36+08:00",
                "bucketId": "PR_GAMES_AOV_NRG",
                "volume": "30720",
                "unit": "KB"
              },
              {
                "subscriptionId": "63995792531619030518106905155175352310",
                "keyword": "PR_FREARENAOFVALOR30MB2DNRG",
                "startDate": "2019-03-05T10:38:43+08:00",
                "endDate": "2019-03-07T11:07:36+08:00",
                "bucketId": "PR_GAMES_AOV_NRG",
                "volume": "30720",
                "unit": "KB"
              },
              {
                "subscriptionId": "63995792531619030518106905155175525610",
                "keyword": "PR_FREARENAOFVALOR30MB2DNRG",
                "startDate": "2019-03-05T11:07:36+08:00",
                "endDate": "2019-03-07T11:07:36+08:00",
                "bucketId": "PR_GAMES_AOV_NRG",
                "volume": "30720",
                "unit": "KB"
              }
            ]
          }
        },
        {
          "bucketId": "PR_FACEBOOK_VRG",
          "startDate": "2019-03-05T00:00:00",
          "endDate": "2019-03-12T11:38:45",
          "state": "Active",
          "volumeRemaining": "102400",
          "totalAllocated": "102400",
          "volumeUsed": "0",
          "type": "Bulk",
          "unit": "KB",
          "subscriptions": {
            "subscriptions": [
              {
                "subscriptionId": "63995792531619030518113015155175712510",
                "keyword": "PR_MSTFB100MB7DVRG",
                "startDate": "2019-03-05T00:00:00+08:00",
                "endDate": "2019-03-12T11:38:45+08:00",
                "bucketId": "PR_FACEBOOK_VRG",
                "volume": "102400",
                "unit": "KB"
              }
            ]
          }
        }
      ]
    }
  }
}
 """;
}
