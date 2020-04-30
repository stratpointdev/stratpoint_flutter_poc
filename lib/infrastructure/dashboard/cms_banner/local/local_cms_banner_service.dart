import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/cms_banner/entities/cms_banner_failure.dart';
import 'package:globe_one_poc_project/domain/dashboard/cms_banner/entities/cms_banner_model.dart';
import 'package:sembast/sembast.dart';
import '../../../database_factory.dart' if(dart.library.js)'package:sembast_web/sembast_web.dart';
import '../../../app_database.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class LocalCmsBannerService {
  static const String CMS_BANNER = 'cmsBanner';
  final _cmsBanner = intMapStoreFactory.store(CMS_BANNER);

  Future<Database> get _db async => database();

  Future<Database> database() {
    if (!kIsWeb)
      return AppDatabase.instance.database;
    else
      return databaseFactoryWeb.openDatabase(CMS_BANNER);
  }

  Future insert(CmsBannerModel cmsBannerModel) async {
    print('insert cms');
    try {
      await _cmsBanner.add(await _db, cmsBannerModel.toJson());
    } catch (error) {
      print('insert error' + error.toString());
    }
  }

  Future delete() async {
    print('delete cms');
    try {
      await _cmsBanner.delete(
        await _db,
      );
    } catch (error) {
      print('delate error ' + error.toString());
    }
  }

  Future<Either<CmsBannerFailures, CmsBannerModel>> getCmsBanner() async {

    try {
      final finder = Finder(limit: 1);
      final recordSnapshots = await _cmsBanner.find(await _db, finder: finder);

      return right(recordSnapshots.map((snapshot) {
        return CmsBannerModel.fromJson(snapshot.value);
      }).single);
    } catch (error) {
      return left(CmsBannerFailures.localError(error.toString()));
    }
  }
}