class AccountDetailsSampleResponse {
  static String body = """

{
    "responseCode": 200,
    "errors": [],
    "detailsByMsisdnResponse": {
        "detailsByMsisdnResult": {
            "subscriberHeader": {
                "subscriberIdInfo": {
                    "subscriberNumber": 5744344
                },
                "subscriberGeneralInfo": {
                    "effectiveDate": 1389794884000,
                    "dealerCode": "DLR01",
                    "actWaiveRsnCd": null,
                    "primResourceTp": "C",
                    "primResourceVal": "MSISDN_HERE",
                    "creditClass": null,
                    "creditLimit": -8577.50588235294,
                    "calculatePaymentCategory": "POST",
                    "language": null,
                    "linkPrevSubNo": -1061109568,
                    "linkNextSubNo": -1061109568,
                    "l9DOB": null,
                    "subPassword": null
                },
                "subscriberTypeInfo": {
                    "subscriberType": "MT"
                },
                "subscriberStatusInfo": {
                    "subStatus": 65,
                    "subStatusDate": 1389794884000,
                    "subStsIssueDate": 1389794884000,
                    "subStsLastAct": "14",
                    "subStsRsnCd": "G01"
                },
                "nameInfo": {
                    "effectiveDate": 1512993340000,
                    "expirationDate": null,
                    "linkType": 80,
                    "nameElement1": null,
                    "nameElement2": "FIRSTNAME",
                    "nameElement3": "MIDDLENAME",
                    "nameElement4": "LASTNAME",
                    "nameElement5": "MIDDLENAME MOTHER'S_FIRSTNAME",
                    "nameElement6": "BIRTHDATE EG.08/19/1990",
                    "nameElement7": "Male",
                    "nameElement8": "PREV_NUMBER",
                    "nameElement9": null,
                    "nameElement10": "FIRSTNAME MIDDLENAME LASTNAME",
                    "nameLine1": "FIRSTNAME MIDDLENAME LASTNAME",
                    "nameLine2": "BIRTHDATE EG.08/19/1990 Male",
                    "nameType": 78,
                    "nameUpdateType": 64
                },
                "addressInfo": {
                    "addressElement1": "ADDRESS_HERE",
                    "addressElement2": null,
                    "addressElement3": "CITY_HERE",
                    "addressElement4": "Metro Manila",
                    "addressElement5": "1700",
                    "addressElement6": "PHL",
                    "addressElement7": null,
                    "addressElement8": null,
                    "addressElement9": null,
                    "addressElement10": null,
                    "addressElement11": null,
                    "addressElement12": null,
                    "addressElement13": null,
                    "addressElement14": null,
                    "addressElement15": null,
                    "addressLine1": "ADDRESS_HERE PHL",
                    "addressLine2": null,
                    "addressLine3": null,
                    "addressLine4": null,
                    "addressType": 65,
                    "addressUpdateType": 64,
                    "effectiveDate": 1512993340000,
                    "expirationDate": null,
                    "linkType": 80,
                    "sinceDate": null,
                    "validityCode": 64,
                    "verificationInd": 64
                },
                "customerIdInfo": {
                    "customerNo": 103539482
                }
            },
            "unifiedResourceDetails": {
                "attributesInfoList": {
                    "attributesInfos": [
                        {
                            "applicationId": null,
                            "attrDesc": null,
                            "attrInd": 64,
                            "attrName": "POSTPAID_IND",
                            "attrQueryInd": 64,
                            "attrRscInd": 64,
                            "attrUpdateInd": 64,
                            "attrValue": "Y",
                            "attrValuePattern": null,
                            "dlServiceCode": null,
                            "dlUpdateDtamp": -16192,
                            "operatorId": -1061109568,
                            "sysCreationDate": null,
                            "sysUpdateDate": null
                        },
                        {
                            "applicationId": null,
                            "attrDesc": null,
                            "attrInd": 64,
                            "attrName": "SVC_AREA_CD",
                            "attrQueryInd": 64,
                            "attrRscInd": 64,
                            "attrUpdateInd": 64,
                            "attrValue": "2700",
                            "attrValuePattern": null,
                            "dlServiceCode": null,
                            "dlUpdateDtamp": -16192,
                            "operatorId": -1061109568,
                            "sysCreationDate": null,
                            "sysUpdateDate": null
                        },
                        {
                            "applicationId": null,
                            "attrDesc": null,
                            "attrInd": 64,
                            "attrName": "LINE_TYPE",
                            "attrQueryInd": 64,
                            "attrRscInd": 64,
                            "attrUpdateInd": 64,
                            "attrValue": "VOICE",
                            "attrValuePattern": null,
                            "dlServiceCode": null,
                            "dlUpdateDtamp": -16192,
                            "operatorId": -1061109568,
                            "sysCreationDate": null,
                            "sysUpdateDate": null
                        },
                        {
                            "applicationId": null,
                            "attrDesc": null,
                            "attrInd": 64,
                            "attrName": "BRAND",
                            "attrQueryInd": 64,
                            "attrRscInd": 64,
                            "attrUpdateInd": 64,
                            "attrValue": "GHP",
                            "attrValuePattern": null,
                            "dlServiceCode": null,
                            "dlUpdateDtamp": -16192,
                            "operatorId": -1061109568,
                            "sysCreationDate": null,
                            "sysUpdateDate": null
                        },
                        {
                            "applicationId": null,
                            "attrDesc": null,
                            "attrInd": 64,
                            "attrName": "SWITCH_CD",
                            "attrQueryInd": 64,
                            "attrRscInd": 64,
                            "attrUpdateInd": 64,
                            "attrValue": "1",
                            "attrValuePattern": null,
                            "dlServiceCode": null,
                            "dlUpdateDtamp": -16192,
                            "operatorId": -1061109568,
                            "sysCreationDate": null,
                            "sysUpdateDate": null
                        },
                        {
                            "applicationId": null,
                            "attrDesc": null,
                            "attrInd": 64,
                            "attrName": "HLR",
                            "attrQueryInd": 64,
                            "attrRscInd": 64,
                            "attrUpdateInd": 64,
                            "attrValue": "01",
                            "attrValuePattern": null,
                            "dlServiceCode": null,
                            "dlUpdateDtamp": -16192,
                            "operatorId": -1061109568,
                            "sysCreationDate": null,
                            "sysUpdateDate": null
                        },
                        {
                            "applicationId": null,
                            "attrDesc": null,
                            "attrInd": 64,
                            "attrName": "EXCH_CD",
                            "attrQueryInd": 64,
                            "attrRscInd": 64,
                            "attrUpdateInd": 64,
                            "attrValue": "MNL",
                            "attrValuePattern": null,
                            "dlServiceCode": null,
                            "dlUpdateDtamp": -16192,
                            "operatorId": -1061109568,
                            "sysCreationDate": null,
                            "sysUpdateDate": null
                        }
                    ]
                },
                "unifiedResourceCategoryInfoList": {
                    "unifiedResourceCategoryInfos": [
                        {
                            "categoryType": "Vanity Numbers",
                            "categoryTypeId": 21,
                            "categoryValue": "Normal",
                            "categoryValueAttributeList": {
                                "categoryValueAttribute": []
                            },
                            "categoryValueId": 68
                        }
                    ]
                },
                "componentsInfoList": {
                    "componentsInfos": []
                },
                "parentIdInfo": {
                    "poolId": -1061109568,
                    "type": null,
                    "value": null
                },
                "statusInfo": {
                    "activity": "ACTIVATE",
                    "endStatusReqId": -1061109568,
                    "lastActivityDate": 1389794883000,
                    "status": "ACTIVE",
                    "statusIssueDate": 1389794883000
                },
                "unifiedResourceIdInfo": {
                    "poolId": 1,
                    "type": "MSISDN",
                    "value": "MSISDN_HERE"
                },
                "userId": -1061109568
            },
            "payChannelHeader": {
                "billingArrangementIdInfo": {
                    "billingArrangementId": 334040603
                },
                "externalIdInfo": {
                    "externalId": null
                },
                "payChannelBusinessEntityIdInfo": {
                    "businessEntityId": 0
                },
                "payChannelDescriptionInfo": {
                    "description": "FIRSTNAME MIDDLENAME LASTNAME"
                },
                "payChannelGeneralInfo": {
                    "lastUpdateDate": null
                },
                "payChannelIdInfo": {
                    "payChannelId": 334040603
                },
                "payChannelNumberInfo": {
                    "accountNo": 99388725,
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
                    "recurringFrequencyValue": -16192,
                    "l9ChargeType": null,
                    "l9PostpaidFA": -1061109568,
                    "l9PostpaidBA": -1061109568
                },
                "payChannelStatusInfo": {
                    "openDate": 1389794884000,
                    "payChannelStatus": 79,
                    "statusDate": 1389794884000
                }
            },
            "billingArrangementHeader": {
                "accountIdInfo": {
                    "accountNo": 99388725
                },
                "addressInfo": {
                    "addressElement1": null,
                    "addressElement2": null,
                    "addressElement3": "1700",
                    "addressElement4": "EMAIL_HERE",
                    "addressElement5": null,
                    "addressElement6": null,
                    "addressElement7": "ADDRESS_HERE",
                    "addressElement8": null,
                    "addressElement9": "CITY_HERE",
                    "addressElement10": "Metro Manila",
                    "addressElement11": null,
                    "addressElement12": null,
                    "addressElement13": null,
                    "addressElement14": null,
                    "addressElement15": null,
                    "addressLine1": null,
                    "addressLine2": "ADDRESS_HERE",
                    "addressLine3": null,
                    "addressLine4": "Metro Manila",
                    "addressType": 65,
                    "addressUpdateType": 64,
                    "effectiveDate": 1512993339000,
                    "expirationDate": null,
                    "linkType": 80,
                    "sinceDate": null,
                    "validityCode": 64,
                    "verificationInd": 64
                },
                "nameInfo": {
                    "effectiveDate": 1512993339000,
                    "expirationDate": null,
                    "linkType": 80,
                    "nameElement1": "Mr.",
                    "nameElement2": "FIRSTNAME",
                    "nameElement3": "MIDDLENAME",
                    "nameElement4": "LASTNAME",
                    "nameElement5": "MIDDLENAME MOTHER'S_FIRSTNAME",
                    "nameElement6": "BIRTHDATE EG.08/19/1990",
                    "nameElement7": "Male",
                    "nameElement8": "PREV_NUMBER",
                    "nameElement9": null,
                    "nameElement10": "FIRSTNAME MIDDLENAME LASTNAME",
                    "nameLine1": "Mr. FIRSTNAME MIDDLENAME LASTNAME",
                    "nameLine2": "BIRTHDATE EG.08/19/1990 Male",
                    "nameType": 78,
                    "nameUpdateType": 64
                },
                "billingArrangementBillInfo": {
                    "billProductionFrequency": 1,
                    "billProductionIndicator": 89,
                    "itemizedTaxIndicator": 78
                },
                "billingArrangementBusinessEntityIdInfo": {
                    "businessEntityId": 0
                },
                "billingArrangementGeneralInfo": {
                    "lastUpdateDate": null
                },
                "billingArrangementIdInfo": {
                    "billingArrangementId": 334040603
                },
                "billingArrangementNumberInfo": {
                    "accountNo": 99388725,
                    "billingArrangmentNo": 1
                },
                "billingArrangementStatusInfo": {
                    "billingArrangementStatus": 79,
                    "openDate": 1389794884000,
                    "statusDate": 1389794884000
                },
                "externalIdInfo": {
                    "externalId": "99388725"
                },
                "nameAddressInfoList": {
                    "nameAddressInfo": [
                        {
                            "addressInfo": {
                                "addressElement1": null,
                                "addressElement2": null,
                                "addressElement3": "1700",
                                "addressElement4": "EMAIL_HERE",
                                "addressElement5": null,
                                "addressElement6": null,
                                "addressElement7": "ADDRESS_HERE",
                                "addressElement8": null,
                                "addressElement9": "CITY_HERE",
                                "addressElement10": "Metro Manila",
                                "addressElement11": null,
                                "addressElement12": null,
                                "addressElement13": null,
                                "addressElement14": null,
                                "addressElement15": null,
                                "addressLine1": null,
                                "addressLine2": "ADDRESS_HERE",
                                "addressLine3": null,
                                "addressLine4": "Metro Manila",
                                "addressType": 65,
                                "addressUpdateType": 64,
                                "effectiveDate": 1512993339000,
                                "expirationDate": null,
                                "linkType": 80,
                                "sinceDate": null,
                                "validityCode": 64,
                                "verificationInd": 64
                            },
                            "addressNameLinkInfo": {
                                "linkType": 80
                            },
                            "nameInfo": {
                                "effectiveDate": 1512993339000,
                                "expirationDate": null,
                                "linkType": 80,
                                "nameElement1": "Mr.",
                                "nameElement2": "FIRSTNAME",
                                "nameElement3": "MIDDLENAME",
                                "nameElement4": "LASTNAME",
                                "nameElement5": "MIDDLENAME MOTHER'S_FIRSTNAME",
                                "nameElement6": "BIRTHDATE EG.08/19/1990",
                                "nameElement7": "Male",
                                "nameElement8": "PREV_NUMBER",
                                "nameElement9": null,
                                "nameElement10": "FIRSTNAME MIDDLENAME LASTNAME",
                                "nameLine1": "Mr. FIRSTNAME MIDDLENAME LASTNAME",
                                "nameLine2": "BIRTHDATE EG.08/19/1990 Male",
                                "nameType": 78,
                                "nameUpdateType": 64
                            }
                        }
                    ]
                }
            },
            "accountHeader": {
                "accountBillingInfo": {
                    "billingCurrency": "PHP",
                    "taxExemptionDate": null,
                    "taxExemptionIndicator": 78
                },
                "accountBusinessEntityIdInfo": {
                    "businessEntityId": 0
                },
                "accountCollectionInfo": {
                    "accountCollectionDateInfo": {
                        "collectionInd": 89,
                        "collectionStartDate": 1585686188000
                    },
                    "accountCollectionFixInfo": {
                        "collectionFixCsrCd": null,
                        "collectionFixPolicy": null,
                        "collectionPermanentWaiveInd": 64
                    },
                    "collectionStatus": "NONE",
                    "fullSuspensionIndicator": 64,
                    "suspensionType": null
                },
                "accountGeneralInfo": {
                    "l3AccountStatusInfo": {
                        "l3AccountStatus": 79,
                        "l3StsChngDate": 1389794884000,
                        "l3StsReasonCd": "CREQ"
                    },
                    "lastUpdateDate": null,
                    "openDate": 1389791677000
                },
                "accountingManagementInfo": {
                    "accountingBalancePolicy": 66,
                    "documentType": 66,
                    "l9AccountType": 71,
                    "l9CorpId": null,
                    "l9CorpIdDesc": null,
                    "l9CostCenter": null,
                    "l9CreditLimit": 4000.0,
                    "l9PrimaryMSISDN": "MSISDN_HERE"
                }
            },
            "customerHeader": {
                "customerTypeInfo": {
                    "customerType": 67,
                    "customerSubType": "R"
                },
                "lockDetails": {
                    "lastUpdateDate": 1535630385000,
                    "lastUpdateStamp": 2307
                }
            },
            "resultNameSpace": "billing-cm"
        }
    }
}


  """;
}
