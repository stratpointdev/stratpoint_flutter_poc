class Api {
  String _baseUrl = 'mock-api.free.beeceptor.com';

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

  Uri getCms() {
    return Uri.https('contentdev.globe.com.ph',
        '/content/flutterpoc/stratpoint/banner-config/jcr:content/content/bannercms.json');
  }
}
