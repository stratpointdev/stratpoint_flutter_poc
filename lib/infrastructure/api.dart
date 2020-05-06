class Api {
  final String _baseUrl = 'gah-poc-flutter.firebaseio.com';

  Uri getSubscriberDetails() {
    const String path = '/endpoint/postpaid/v1/account/subscriber-details.json';
    return Uri.https(_baseUrl, path);
  }

  Uri getOutStandingBalance() {
    const String path =
        '/endpoint/postpaid/v1/account/outstanding-balance.json';
    return Uri.https(_baseUrl, path);
  }

  Uri getDataUsage() {
    const String path = '/endpoint/postpaid/v1/account/data-usage.json';
    return Uri.https(_baseUrl, path);
  }

  Uri getCms() {
    return Uri.https('contentdev.globe.com.ph',
        '/content/flutterpoc/stratpoint/banner-config/jcr:content/content/bannercms.json');
  }
}
