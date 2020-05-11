class Secret {
  Secret(
      {this.accessUserName = '',
      this.accessTokenPassword = '',
      this.cmsUserName = '',
      this.cmsPassword = '',
      this.aemUrl = '',
      this.dbPassword = ''});

  factory Secret.fromJson(Map<String, dynamic> jsonMap) {
    return Secret(
        accessUserName: jsonMap['accessUserName'].toString(),
        accessTokenPassword: jsonMap['accessTokenPassword'].toString(),
        cmsUserName: jsonMap['cmsUserName'].toString(),
        cmsPassword: jsonMap['cmsPassword'].toString(),
        aemUrl: jsonMap['aemUrl'].toString(),
        dbPassword: jsonMap['dbPassword'].toString());
  }

  final String accessUserName;
  final String accessTokenPassword;
  final String cmsUserName;
  final String cmsPassword;
  final String aemUrl;
  final String dbPassword;
}
