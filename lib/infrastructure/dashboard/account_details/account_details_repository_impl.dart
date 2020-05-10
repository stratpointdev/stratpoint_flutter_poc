import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/cache_configuration/entities/cache_configuration_details_model.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/account_details_repository.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/entities/account_details_failures.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/entities/account_details_model.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/entities/account_details_request_body.dart';
import 'package:globe_one_poc_project/domain/dashboard/common/datetime_converter.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/account_details/local/local_account_details_service.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/account_details/remote/remote_account_details_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:globe_one_poc_project/domain/cache_configuration/cache_configuration_repository.dart';

class AccountDetailsRepositoryImpl implements AccountDetailsRepository {
  AccountDetailsRepositoryImpl(this.remoteAccountDetailsService,
      this.localAccountDetailsService, this.cacheConfigurationRepository);
  final RemoteAccountDetailsService remoteAccountDetailsService;
  final LocalAccountDetailsService localAccountDetailsService;
  final CacheConfigurationRepository cacheConfigurationRepository;

  @override
  Future<Either<AccountDetailsFailures, AccountDetailsModel>> getAccountDetails(
      AccountDetailsRequestBody accountDetailsRequestBody) async {
    final SharedPreferences myPrefs = await SharedPreferences.getInstance();
    final int secs =
        DateTimeConverter.getSecsDiff(myPrefs.getString('LastApiCall'));

    final CacheConfigurationDetailsModel cacheConfiguration =
        await cacheConfigurationRepository.getCacheInterval();

    if (secs <= cacheConfiguration.interval) {
      return localAccountDetailsService.getAccountDetails();
    } else {
      return remoteAccountDetailsService
          .getAccountDetails(accountDetailsRequestBody)
          .then((Either<AccountDetailsFailures, AccountDetailsModel> value) {
        if (value.isLeft()) {
          return localAccountDetailsService.getAccountDetails();
        } else {
          return value;
        }
      });
    }
  }

  @override
  Future<void> deletePaymentDetailsLocal() {
    return localAccountDetailsService.delete();
  }

  @override
  Future<void> insertPaymentDetailsLocal(
      AccountDetailsModel accountDetailsModel) {
    return localAccountDetailsService.insert(accountDetailsModel);
  }
}
