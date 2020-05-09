import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/cms_banner/entities/cms_banner_failure.dart';
import 'package:globe_one_poc_project/domain/dashboard/cms_banner/entities/cms_banner_model.dart';
import 'package:globe_one_poc_project/infrastructure/api.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/authentication/secure_storage_util.dart';
import 'package:http/http.dart';

class RemoteCmsBannerService {
  final Api api = Api();

  Future<Either<CmsBannerFailure, CmsBannerModel>> getCmsBanner() async {
    final String username =
        await SecureStorageUtil.getString(SecureStorageUtil.cmsUserNameKey);
    final String password =
        await SecureStorageUtil.getString(SecureStorageUtil.cmsPasswordKey);

    final String basicAuth =
        'Basic ' + base64Encode(utf8.encode(username + ':' + password));

    final Map<String, String> headers = <String, String>{
      'Authorization': basicAuth
    };

    try {
      final Response response = await get(api.getCms(), headers: headers)
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final dynamic body = jsonDecode(response.body.toString());

        return right(CmsBannerModel.fromJson(body as Map<String, dynamic>));
      } else {
        return left(CmsBannerFailure(
            code: response.statusCode, message: response.body.toString()));
      }
    } catch (e) {
      print(e.toString);
      return left(CmsBannerFailure.localError(''));
    }
  }
}
