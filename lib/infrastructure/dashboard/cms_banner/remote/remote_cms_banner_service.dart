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

    final Map<String, String> headers = <String, String>{
      'username': '$username',
      'password': '$password'
    };

    try {
      final Response response = await get(api.getCms(), headers: headers)
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final dynamic body = jsonDecode(response.body.toString());
        print('CMS' + response.body.toString());
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
    final Uri uri = Uri.https('nameless-tor-61972.herokuapp.com', '/banner/image', <String, String>{'imagePath': '$value'});
    //final Uri uri = Uri.parse(api.getCmsImage());
   // final Uri newURI = uri.replace(queryParameters: <String, String>{'imagePath': '$value'});

    final Response response = await get(uri, headers: headers);


  /*  final Response response = await get(api.getCmsImage(),
            headers: headers,
            body: <String, String>{'imagePath': '$value'})
        .timeout(const Duration(seconds: 30));*/
    if (response.statusCode == 200) {
      return response.body.toString();
    } else {
      return '';
    }
  }
}
