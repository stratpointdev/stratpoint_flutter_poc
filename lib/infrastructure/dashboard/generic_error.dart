class GenericError {
  static String genericErrorSample = '''

{
    "responseCode": 400,
    "errors": [
        {
            "code": "API005",
            "message": "Contains non-numeric characters",
            "parameter": "msisdn"
        }
    ]
}
  ''';
}
