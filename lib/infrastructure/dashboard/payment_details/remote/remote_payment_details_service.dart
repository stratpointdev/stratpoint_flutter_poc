import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/entities/payment_details_failure.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/entities/payment_details_model.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/payment_details/remote/payment_details_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RemotePaymentDetailsService {
  final api = Api();

  Future<Either<PaymentDetailsFailure, PaymentDetailsModel>>
      getPaymentDetails() async {
    bool isSuccess = true;
    await Future.delayed(Duration(seconds: 2));
    if (isSuccess) {
      SharedPreferences myPrefs = await SharedPreferences.getInstance();
      myPrefs.setString('LastAccountDetailsCall', DateTime.now().toString());
      var body = jsonDecode(PaymentDetailsResponse.body);
      return right(PaymentDetailsModel.fromJson(body));
    } else {
      return left(PaymentDetailsFailure());
    }

    return right(PaymentDetailsModel.fromJson(jsonResponse));
  }
}
