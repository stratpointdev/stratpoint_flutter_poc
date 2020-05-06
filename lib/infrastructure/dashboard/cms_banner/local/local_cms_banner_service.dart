import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/cms_banner/entities/cms_banner_failure.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:globe_one_poc_project/domain/dashboard/cms_banner/entities/cms_banner_model.dart';
import 'package:sembast/sembast.dart';
import '../../../app_database.dart';

import '../../../database_factory.dart'
    if (dart.library.js) 'package:sembast_web/sembast_web.dart';

class LocalCmsBannerService {
  static const String CMS_BANNER = 'cmsBanner';
  final StoreRef<int, Map<String, dynamic>> _cmsBanner =
      intMapStoreFactory.store(CMS_BANNER);

  Future<Database> get _db async => database();

  Future<Database> database() {
    if (!kIsWeb)
      return AppDatabase.instance.database;
    else
      return databaseFactoryWeb.openDatabase(CMS_BANNER);
  }

  Future<void> insert(CmsBannerModel cmsBannerModel) async {
    print('insert cms');
    try {
      await _cmsBanner.add(await _db, cmsBannerModel.toJson());
    } catch (error) {
      print('insert error' + error.toString());
    }
  }

  Future<void> delete() async {
    print('delete cms');
    try {
      await _cmsBanner.delete(
        await _db,
      );
    } catch (error) {
      print('delate error ' + error.toString());
    }
  }

  Future<Either<CmsBannerFailure, CmsBannerModel>> getCmsBanner() async {
    try {
      final Finder finder = Finder(limit: 1);
      final List<RecordSnapshot<int, Map<String, dynamic>>> recordSnapshots =
          await _cmsBanner.find(await _db, finder: finder);
      return right(recordSnapshots
          .map((RecordSnapshot<int, Map<String, dynamic>> snapshot) {
        return CmsBannerModel.fromJson(snapshot.value);
      }).single);
    } catch (error) {
      return left(CmsBannerFailure.localError(error.toString()));
    }
  }
}
