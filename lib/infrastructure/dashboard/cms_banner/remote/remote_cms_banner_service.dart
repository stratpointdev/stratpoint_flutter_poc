import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/cms_banner/entities/cms_banner_failure.dart';
import 'package:globe_one_poc_project/domain/dashboard/cms_banner/entities/cms_banner_model.dart';
import 'package:globe_one_poc_project/infrastructure/api.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/authentication/secure_storage_util.dart';
import 'package:http/http.dart';

class RemoteCmsBannerService {
  final Api api = Api();

  //Method to fetch CmsBanner object from the API
  Future<Either<CmsBannerFailure, CmsBannerModel>> getCmsBanner() async {
    final String username =
        await SecureStorageUtil.getString(SecureStorageUtil.cmsUserNameKey);
    final String password =
        await SecureStorageUtil.getString(SecureStorageUtil.cmsPasswordKey);
    final String aemBaseUrl =
        await SecureStorageUtil.getString(SecureStorageUtil.aemUrlKey);

    final Map<String, String> headers = <String, String>{
      'username': '$username',
      'password': '$password'
    };

    try {
      final Response response = await get(api.getCms(), headers: headers)
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final Map<String, dynamic> body =
            jsonDecode(response.body.toString()) as Map<String, dynamic>;
        body.putIfAbsent('cmsUsername', () => username);
        body.putIfAbsent('cmsPassword', () => password);
        body.putIfAbsent('cmsBaseUrl', () => aemBaseUrl);

        return right(CmsBannerModel.fromJson(body));
      } else {
        return left(CmsBannerFailure(
            code: response.statusCode, message: response.body.toString()));
      }
    } catch (e) {
      print(e.toString);
      return left(CmsBannerFailure.localError(''));
    }
  }

  //Method to fetch the base64 images from the API
  //This method is only used for web
  Future<String> getCmsBannerImage(String value) async {
    final String username =
        await SecureStorageUtil.getString(SecureStorageUtil.cmsUserNameKey);
    final String password =
        await SecureStorageUtil.getString(SecureStorageUtil.cmsPasswordKey);
    print('getCmsBannerImage $username : $password  value:$value');
    final Map<String, String> headers = <String, String>{
      'username': '$username',
      'password': '$password',
      'Content-Type': 'application/json',
    };
    final Uri uri = Uri.https('nameless-tor-61972.herokuapp.com',
        '/banner/image', <String, String>{'imagePath': '$value'});

    final Response response = await get(uri, headers: headers);

    if (response.statusCode == 200) {
      return response.body.toString();
    } else {
      return '';
    }
  }
}
