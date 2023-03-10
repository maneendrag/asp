import 'package:asp_base/_app/app.locator.dart';
import 'package:asp_base/_services/api_service.dart';
import 'package:asp_base/_services/failure.dart';
import 'package:dartz/dartz.dart';

import '../customViewModels.dart';
import 'home_response.dart';

class HomeScreenViewModel extends CustomBaseViewModel {
  final HttpService _httpService = locator<HttpService>();

  HomeResponse? homeResponse;
  // List<HomeResponse>? homeResponseData = [];

  Future<Either<Failure, HomeResponse>> fetchHomeData() async {
    setBusy(true);
    try {
      var doc = r'''
query GetUsers {
  users(where: {apartment_no: {_eq: "111"}}) {
    user_name
    role
    apartment_no
    office_status
  }
}
      ''';

      var response =
      await _httpService.query(doc);

      print("Home response data =========> $response");

      homeResponse = HomeResponse.fromJson(response as Map<String, dynamic>);

      // response = homeResponse;
      // print(
      //     "HMResponse =========> ${homeResponse}}");

      notifyListeners();

      // if(response["subscription_types"] !=null){
      //
      //   // subscriptionTypeData = SubscriptionTypeData.fromJson(response);
      //
      //   response["subscription_types"].forEach((data){
      //     subsData.add(data);
      //   });
      //
      //   print("Sub data -------> $subsData");
      //
      //
      // }else{
      //   subsData.clear();
      // }

      // notifyListeners();

      // // changeView(M2View.Signature_SCREEN);
      // if(response['insert_users']['affected_rows'] > 0){
      //   changeView(M2View.M2RegisteredSuccessfully);
      // }

      // subscriptionTypeData = response;

      // print("Var data =======> $subscriptionTypeData");
      setBusy(false);
      return Right(homeResponse!);
    } catch (e) {
      setBusy(false);
      print("Error ==========> $e");

      return Left(Failure(
          errorMessage: 'Errors => $e',
          message: 'Error in fetching subscription hm details'));
    }
  }

  Future<Either<Failure, dynamic>> getECommerceResponse() async {

    try {
      dynamic dataResponse =
      await _httpService.get("https://fakestoreapi.com/products",
          headers: {});

      print("In Ecommerce data resp in Home ======> $dataResponse");

      // if(dataResponse['message'] == )
      return Right(dataResponse);

    } catch (e, s) {
      print("entered error state");
      return Left(Failure(message: e.toString(), errorMessage: s.toString()));
    }
  } // Signat
  @override
  initLogger() {}

}
