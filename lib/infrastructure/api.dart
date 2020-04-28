class Api {
  String _baseUrl = 'tests.free.beeceptor.com';

  Uri getSubscriberDetails() {
    var path = "/postpaid/v1/account/subscriber-details";
    return Uri.https(_baseUrl, path);
  }

  Uri getOutStandingBalance() {
    var path = "/postpaid/v1/account/outstanding-balance";
    return Uri.https(_baseUrl, path);
  }

  Uri getDataUsage() {
    var path = "/postpaid/v1/account/data-usage";
    return Uri.https(_baseUrl, path);
  }
}
