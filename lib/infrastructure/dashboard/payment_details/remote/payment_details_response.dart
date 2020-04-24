class PaymentDetailsResponse {
  static String body = """

  {
    "responseCode": 200,
    "errors": [],
    "lastApiCall": 1587639326000,
    "outstandingBalanceByMsisdnResponse": {
        "outstandingBalanceByMsisdnResult": {
            "accountBalanceDt": {
                "arBalance": 5350.0,
                "unappliedAmount": 0.0
            },
            "lastPaymentDt": {
                "amount": 200.0,
                "creditId": 278836246,
                "paymentDate": "2020-04-23T00:00:00+0800"
            },
            "payChannelHeader": {
                "billingArrangementIdInfo": {
                    "billingArrangementId": 334040603
                },
                "customerIdInfo": {
                    "customerNo": 103539482
                },
                "externalIdInfo": {
                    "externalId": null
                },
                "payChannelBusinessEntityIdInfo": {
                    "businessEntityId": 0
                },
                "payChannelDescriptionInfo": {
                    "description": "FIRSTNAME_HERE MIDDLENAME_HERE LASTNAME_HERE"
                },
                "payChannelGeneralInfo": {
                    "description": null
                },
                "payChannelIdInfo": {
                    "payChannelId": 334040603
                },
                "payChannelNumberInfo": {
                    "accountNo": 123123123,
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
                    "openDate": "2014-01-15T22:08:04+0800",
                    "payChannelStatus": 79,
                    "statusDate": "2014-01-15T22:08:04+0800"
                }
            },
            "customerCyclesInfo": {
                "cycleCodeInfo": {
                    "cycleCode": 11,
                    "cycleCloseDay": 10,
                    "cycleBillDay": 0,
                    "cycleDesc": "Monthly Residential Cycle close on the 10th",
                    "cycleFrequency": 77,
                    "cycleFrequencyMultiplier": 1,
                    "billingReference": "2005-01-11T00:00:00+0800",
                    "cyclePopulationCode": 65,
                    "cyclePopulationDesc": "For Globe",
                    "cycleBusinessEntity": 0,
                    "billPrdUpLimit": 1
                },
                "customerIdInfo": {
                    "customerNo": 103539482
                },
                "cycleMonth": 5,
                "cycleYear": 2020,
                "cycleInstance": 5,
                "cycleSeqNo": 36363,
                "startDate": "2020-04-11T00:00:00+0800",
                "endDate": "2020-05-10T00:00:00+0800",
                "status": "OP",
                "customerPartitionId": 1,
                "runDate": null
            },
            "docInfo": {
                "docId": 518864088,
                "docType": "BL",
                "docStatus": 78,
                "billDate": "2020-04-11T00:00:00+0800",
                "cycleControlInfo": {
                    "cycleNo": 35943,
                    "cycleCode": 11,
                    "cycleYear": 2020,
                    "cycleInstance": 4,
                    "startDate": "2020-03-11T00:00:00+0800",
                    "endDate": "2020-04-10T00:00:00+0800",
                    "runDate": "2020-04-11T00:00:00+0800",
                    "status": "CN",
                    "cycleSeqRun": 0,
                    "periodKey": 4
                },
                "periodCoverageStartDate": "2020-03-11T00:00:00+0800",
                "periodCoverageEndDate": "2020-04-10T00:00:00+0800",
                "productionType": "RG",
                "accountNo": "ACCOUNTNO_HERE",
                "customerNo": 103539482,
                "baNo": 334040603,
                "documentFormat": null,
                "printingCategory": "AR-CSR",
                "docProduceInd": 89,
                "amountCurrency": "PHP",
                "dueDate": "2020-05-15T00:00:00+0800",
                "totalAmount": 5750.0,
                "invoiceAmount": 3022.97,
                "invoiceTaxAmount": 290.14,
                "invoiceNetAmount": 2732.83,
                "legalInvoiceNo": "ACCOUNTNO_HERE-76-000520502952",
                "billFrequency": 1,
                "rebillActivity": 78,
                "docDemandType": "REGULR"
            },
            "overDueDate": "2020-03-31T00:00:00+0800",
            "overDueBalance": 2327.03,
            "resultNameSpace": "billing"
        }
    }
}

 """;
}
