import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/cms_banner/entities/cms_banner_failure.dart';
import 'package:globe_one_poc_project/domain/dashboard/cms_banner/entities/cms_banner_model.dart';
import 'package:globe_one_poc_project/infrastructure/api.dart';
import 'package:http/http.dart';

class RemoteCmsBannerService {
  final api = Api();

  Future<Either<CmsBannerFailures, CmsBannerModel>> getCmsBanner() async {
    String username = 'flutterpoc-stratpoint';
    String password = 'Str@tp01nt';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    Map<String, String> headers = {"Authorization": basicAuth};
    final response = await get(api.getCms(), headers: headers);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);

      return right(CmsBannerModel.fromJson(body));
    } else {
      return left(CmsBannerFailures(
          code: response.statusCode, message: response.body.toString()));
    }
  }
}
