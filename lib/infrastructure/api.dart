class Api {

  final String _baseUrl = 'https://nameless-tor-61972.herokuapp.com';
  String getAccessToken(){
    return '$_baseUrl/access-token-generation';
  }
  String getSubscriberDetails() {
    return '$_baseUrl/subscriber-details';
  }
  String getOutStandingBalance() {
    return '$_baseUrl/outstanding-balance';
  }
  String getDataUsage() {
    return '$_baseUrl/promo-subscription-usage';
  }
  String getCms() {
    return '$_baseUrl/banner';
  }

}
