class Api {
  String _baseUrl = 'globe-one-poc.free.beeceptor.com';

  Uri getSubscriberDetails() {
    var path = "/postpaid/v1/account/subscriber-details";
    return Uri.http(_baseUrl, path);
  }

  Uri getOutStandingBalance() {
    var path = "/postpaid/v1/account/outstanding-balance";
    return Uri.http(_baseUrl, path);
  }

  Uri getDataUsage() {
    var path = "/postpaid/v1/account/data-usage";
    return Uri.http(_baseUrl, path);
  }
}
