class Api {
  final String _baseUrl = 'ocspdev.globe.com.ph';

  Uri getAccessToken() {
    const String path = '/security/v1/access-token-generation';
    return Uri.https(_baseUrl, path);
  }

  Uri getSubscriberDetails() {
    const String path = '/postpaid/v1/account/subscriber-details';
    return Uri.https(_baseUrl, path);
  }

  Uri getOutStandingBalance() {
    const String path = '/postpaid/v1/account/outstanding-balance';
    return Uri.https(_baseUrl, path);
  }

  Uri getDataUsage() {
    const String path = '/postpaid/v1/account/promo-subscription-usage';
    return Uri.https(_baseUrl, path);
  }

  Uri getCms() {
    return Uri.https('contentdev.globe.com.ph',
        '/content/flutterpoc/stratpoint/banner-config/jcr:content/content/bannercms.json');
  }
}
