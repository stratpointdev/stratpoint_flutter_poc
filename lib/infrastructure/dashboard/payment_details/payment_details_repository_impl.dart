import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/cache_configuration/cache_configuration_repository.dart';
import 'package:globe_one_poc_project/domain/cache_configuration/entities/cache_configuration_details_model.dart';
import 'package:globe_one_poc_project/domain/dashboard/common/datetime_converter.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/entities/payment_details_failure.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/entities/payment_details_model.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/entities/payment_details_request_body.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/payment_details/local/local_payment_details_service.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/payment_details_repository.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/payment_details/remote/remote_payment_details_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentDetailsRepositoryImpl implements PaymentDetailsRepository {
  PaymentDetailsRepositoryImpl(this.remotePaymentDetailsService,
      this.localPaymentDetailsService, this.cacheConfigurationRepository);

  final RemotePaymentDetailsService remotePaymentDetailsService;
  final LocalPaymentDetailsService localPaymentDetailsService;
  final CacheConfigurationRepository cacheConfigurationRepository;

  //This method will check the cache interval config then get the PaymentDetails object from our data sources.
  @override
  Future<Either<PaymentDetailsFailure, PaymentDetailsModel>> getPaymentDetails(
      PaymentDetailsRequestBody paymentDetailsRequestBody) async {
    final SharedPreferences myPrefs = await SharedPreferences.getInstance();
    final int secs =
        DateTimeConverter.getSecsDiff(myPrefs.getString('LastApiCall'));

    final CacheConfigurationDetailsModel cacheConfiguration =
        await cacheConfigurationRepository.getCacheInterval();

    if (secs <= cacheConfiguration.interval) {
      return localPaymentDetailsService.getPaymentDetails();
    } else {
      return remotePaymentDetailsService
          .getPaymentDetails(paymentDetailsRequestBody)
          .then((Either<PaymentDetailsFailure, PaymentDetailsModel> value) {
        if (value.isLeft()) {
          return localPaymentDetailsService.getPaymentDetails();
        } else {
          return value;
        }
      });
    }
  }

  //Method to call localPaymentDetailsService.delete() from local data sources
  @override
  Future<void> deletePaymentDetailsLocal() async {
    return localPaymentDetailsService.delete();
  }

  //Method to call localPaymentDetailsService.insert() from local data sources
  @override
  Future<void> insertPaymentDetailsLocal(
      PaymentDetailsModel paymentDetailsModel) async {
    return localPaymentDetailsService.insert(paymentDetailsModel);
  }
}
