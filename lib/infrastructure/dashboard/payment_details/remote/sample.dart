class Sample {
  static String outstanding = """{
    "responseCode": 200,
"errors": [],
"outstandingBalanceByMsisdnResponse": {
"outstandingBalanceByMsisdnResult": {
"accountBalanceDt": {
"arBalance": 610.54,
"unappliedAmount": 0
},
"lastPaymentDt": {
"amount": 0,
"creditId": 0,
"paymentDate": 1538569207904
},
"payChannelHeader": {
"billingArrangementIdInfo": {
"billingArrangementId": 341032500
},
"customerIdInfo": {
"customerNo": 199585575
},
"externalIdInfo": {
"externalId": null
},
"payChannelBusinessEntityIdInfo": {
"businessEntityId": 0
},
"payChannelDescriptionInfo": {
"description": "77RPA 77RPA 77RPA"
},
"payChannelGeneralInfo": {
"description": null
},
"payChannelIdInfo": {
"payChannelId": 341032500
},
"payChannelNumberInfo": {
"accountNo": 1067131655,
"billingArrangementNo": 1,
"payChannelNo": 1
},
"payChannelPaymentCategoryInfo": {
"paymentCategory": "POST"
},
"payChannelPaymentMethodInfo": {
"bankAccountNo": null,
"bankAccountType": 64,
"bankBranchNo": null,
"bankCode": null,
"creditCardExpirationDate": null,
"creditCardNo": "0000000000000000",
"creditCardType": null,
"issueDate": null,
"paymentMeansOwnerDetails": null,
"paymentMethod": "CA",
"paymentType": 78,
"pin": "0000",
"recurringAmount": -8577.50588235294,
"recurringFrequency": 64,
"recurringFrequencyValue": -16192
},
"payChannelStatusInfo": {
"openDate": null,
"payChannelStatus": 79,
"statusDate": 1533335524000
}
},
"customerCyclesInfo": {
"cycleCodeInfo": {
"cycleCode": 10,
"cycleCloseDay": 9,
"cycleBillDay": 0,
"cycleDesc": "Monthly Residential Cycle close on the 9th",
"cycleFrequency": 77,
"cycleFrequencyMultiplier": 1,
"billingReference": 1105286400000,
"cyclePopulationCode": 65,
"cyclePopulationDesc": "For Globe",
"cycleBusinessEntity": 0,
"billPrdUpLimit": 1
},
"customerIdInfo": {
"customerNo": 199585575
},
"cycleMonth": 10,
"cycleYear": 2018,
"cycleInstance": 10,
"cycleSeqNo": 24283,
"startDate": 1536508800000,
"endDate": 1539014400000,
"status": "OP",
"customerPartitionId": 1,
"runDate": null
},
"docInfo": {
"docId": 395577431,
"docType": "BL",
"docStatus": 78,
"billDate": 1536681600000,
"cycleControlInfo": {
"cycleNo": 23943,
"cycleCode": 10,
"cycleYear": 2018,
"cycleInstance": 9,
"startDate": 1533830400000,
"endDate": 1536422400000,
"runDate": 1536681600000,
"status": "PR",
"cycleSeqRun": 0,
"periodKey": 105
},
"periodCoverageStartDate": 1533830400000,
"periodCoverageEndDate": 1536422400000,
"productionType": "FR",
"accountNo": 1067131655,
"customerNo": 199585575,
"baNo": 341032500,
"documentFormat": null,
"printingCategory": "AR-CSR",
"docProduceInd": 89,
"amountCurrency": "PHP",
"dueDate": 1538236800000,
"totalAmount": 610.54,
"invoiceAmount": 610.54,
"invoiceTaxAmount": 65.41,
"invoiceNetAmount": 545.13,
"legalInvoiceNo": "1067131655-1-000358496792",
"billFrequency": 1,
"rebillActivity": 78,
"docDemandType": "REGULR"
},
"overDueDate": 1538236800000,
"overDueBalance": 610.54,
"resultNameSpace": "billing"
}
}
}""";

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
