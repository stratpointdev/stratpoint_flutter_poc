import 'package:globe_one_poc_project/domain/cache_configuration/entities/cache_configuration_details_model.dart';

abstract class CacheConfigurationRepository {
  Future<CacheConfigurationDetailsModel> getCacheInterval();
}
