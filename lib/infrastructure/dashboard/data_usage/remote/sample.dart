class Sample {


  static String retrieveSubcriberUsage = """
  
 {
    "responseCode": 200,
    "errors": [],
    "lastApiCall": 1587639679192,
    "retrieveSubscriberUsageResult": {
        "resultCode": "0",
        "description": "Success",
        "msisdn": "63MSISDN_HERE",
        "paymentCategory": "POST",
        "state": null,
        "subscriberId": "5744344",
        "customerId": "103539482",
        "customerType": "C",
        "customerSubType": "R",
        "subscriberType": "MT",
        "activeDate": "2019-02-28T05:49:22",
        "brand": "GHP",
        "buckets": {
            "buckets": [
                {
                    "bucketId": "GS_17194649",
                    "startDate": "2020-01-11T02:23:34",
                    "endDate": "2020-05-10T23:59:59",
                    "state": "Active",
                    "volumeRemaining": "10485760",
                    "totalAllocated": "10485760",
                    "volumeUsed": "0",
                    "type": "Bulk",
                    "unit": "KB",
                    "subscriptions": {
                        "subscriptions": [
                            {
                                "subscriptionId": "57443447142165157868061410",
                                "keyword": "GS_17194649_KW",
                                "startDate": "2020-01-11T02:23:34+08:00",
                                "endDate": "2020-05-10T23:59:59+08:00",
                                "bucketId": "GS_17194649",
                                "volume": "0",
                                "unit": "KB"
                            }
                        ]
                    }
                },
                {
                    "bucketId": "GS_17194649_RO",
                    "startDate": "2020-01-11T02:23:34",
                    "endDate": "2020-05-10T23:59:59",
                    "state": "Active",
                    "volumeRemaining": "10485760",
                    "totalAllocated": "10485760",
                    "volumeUsed": "0",
                    "type": "Bulk",
                    "unit": "KB",
                    "subscriptions": {
                        "subscriptions": []
                    }
                },
                {
                    "bucketId": "GS_4859026",
                    "startDate": "2020-04-01T21:56:44",
                    "endDate": "2020-05-10T23:59:59",
                    "state": "Active",
                    "volumeRemaining": "0",
                    "totalAllocated": "1048576",
                    "volumeUsed": "1048576",
                    "type": "Bulk",
                    "unit": "KB",
                    "subscriptions": {
                        "subscriptions": [
                            {
                                "subscriptionId": "57443447125825158574940410",
                                "keyword": "GS_4859026_1024MB",
                                "startDate": "2020-04-01T21:56:44+08:00",
                                "endDate": "2020-05-10T23:59:59+08:00",
                                "bucketId": "GS_4859026",
                                "volume": "0",
                                "unit": "KB"
                            }
                        ]
                    }
                },
                {
                    "bucketId": "GS_4859026_RO",
                    "startDate": "2020-04-01T21:56:44",
                    "endDate": "2020-05-10T23:59:59",
                    "state": "Active",
                    "volumeRemaining": "0",
                    "totalAllocated": "0",
                    "volumeUsed": "0",
                    "type": "Bulk",
                    "unit": "KB",
                    "subscriptions": {
                        "subscriptions": []
                    }
                },
                {
                    "bucketId": "PO_GOSURF_OC",
                    "startDate": "2020-04-03T14:20:18",
                    "endDate": "2020-05-03T14:21:25",
                    "state": "Active",
                    "volumeRemaining": "0",
                    "totalAllocated": "5242880",
                    "volumeUsed": "5242880",
                    "type": "Bulk",
                    "unit": "KB",
                    "subscriptions": {
                        "subscriptions": [
                            {
                                "subscriptionId": "57443447135165158589481810",
                                "keyword": "PO_GS1GB30D_OC",
                                "startDate": "2020-04-03T14:20:18+08:00",
                                "endDate": "2020-05-03T14:21:25+08:00",
                                "bucketId": "PO_GOSURF_OC",
                                "volume": "0",
                                "unit": "KB"
                            },
                            {
                                "subscriptionId": "57443447135165158589484810",
                                "keyword": "PO_GS1GB30D_OC",
                                "startDate": "2020-04-03T14:20:48+08:00",
                                "endDate": "2020-05-03T14:21:25+08:00",
                                "bucketId": "PO_GOSURF_OC",
                                "volume": "0",
                                "unit": "KB"
                            },
                            {
                                "subscriptionId": "57443447135165158589486510",
                                "keyword": "PO_GS1GB30D_OC",
                                "startDate": "2020-04-03T14:21:05+08:00",
                                "endDate": "2020-05-03T14:21:25+08:00",
                                "bucketId": "PO_GOSURF_OC",
                                "volume": "0",
                                "unit": "KB"
                            },
                            {
                                "subscriptionId": "57443447135165158589487610",
                                "keyword": "PO_GS1GB30D_OC",
                                "startDate": "2020-04-03T14:21:16+08:00",
                                "endDate": "2020-05-03T14:21:25+08:00",
                                "bucketId": "PO_GOSURF_OC",
                                "volume": "0",
                                "unit": "KB"
                            },
                            {
                                "subscriptionId": "57443447135165158589488510",
                                "keyword": "PO_GS1GB30D_OC",
                                "startDate": "2020-04-03T14:21:25+08:00",
                                "endDate": "2020-05-03T14:21:25+08:00",
                                "bucketId": "PO_GOSURF_OC",
                                "volume": "0",
                                "unit": "KB"
                            }
                        ]
                    }
                },
                {
                    "bucketId": "GS_4164074",
                    "startDate": "2019-04-14T05:52:46",
                    "endDate": "2020-05-10T23:59:59",
                    "state": "Active",
                    "volumeRemaining": "1758200",
                    "totalAllocated": "3145728",
                    "volumeUsed": "1387528",
                    "type": "Bulk",
                    "unit": "KB",
                    "subscriptions": {
                        "subscriptions": [
                            {
                                "subscriptionId": "57443447125535155519236610",
                                "keyword": "GS_4164074_3072MB",
                                "startDate": "2019-04-14T05:52:46+08:00",
                                "endDate": "2020-05-10T23:59:59+08:00",
                                "bucketId": "GS_4164074",
                                "volume": "0",
                                "unit": "KB"
                            }
                        ]
                    }
                },
                {
                    "bucketId": "FB_4714111",
                    "startDate": "2019-09-11T05:27:02",
                    "endDate": "2020-05-10T23:59:59",
                    "state": "Active",
                    "volumeRemaining": "57590",
                    "totalAllocated": "1048576",
                    "volumeUsed": "990986",
                    "type": "Bulk",
                    "unit": "KB",
                    "subscriptions": {
                        "subscriptions": [
                            {
                                "subscriptionId": "57443447133645156815082210",
                                "keyword": "FB_4714111_1024MB",
                                "startDate": "2019-09-11T05:27:02+08:00",
                                "endDate": "2020-05-10T23:59:59+08:00",
                                "bucketId": "FB_4714111",
                                "volume": "0",
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
