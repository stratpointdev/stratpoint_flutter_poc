import 'package:globe_one_poc_project/domain/cache_configuration/cache_configuration_repository.dart';
import 'package:globe_one_poc_project/domain/cache_configuration/entities/cache_configuration_details_model.dart';
import 'package:globe_one_poc_project/infrastructure/cache_configuration/remote/remote_cache_configuration_service.dart';

class CacheConfigurationRepositoryImpl implements CacheConfigurationRepository {
  RemoteCacheConfigurationService remoteCacheConfigurationService =
      RemoteCacheConfigurationService();

  @override
  Future<CacheConfigurationDetailsModel> getCacheInterval() {
    return remoteCacheConfigurationService.getCacheInterval();
  }
}
