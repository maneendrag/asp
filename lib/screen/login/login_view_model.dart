import 'package:asp_base/_app/app.locator.dart';
import 'package:asp_base/_app/enums/app_enums.dart';
import 'package:asp_base/_services/api_service.dart';
import 'package:asp_base/_services/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../home/home_response.dart';

class LoginViewModel extends BaseViewModel {
  LoginScreenView currentView = LoginScreenView.landingScreen;
  final HttpService _httpService = locator<HttpService>();

  //SignUp text field controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController eMailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  //
  // bool validateEmail(email) {
  //   print("Ema---> $email");
  //   if (email != null && email.length > 0) {
  //     Pattern pattern =
  //         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  //     RegExp regex = RegExp(pattern.toString());
  //     if (regex.hasMatch(email)) {
  //       verifyEmailFromAPI(email);
  //       print("validated");
  //     } else {
  //       print(" Not validated");
  //     }
  //     // verifyEmailFromAPI(email);
  //     return regex.hasMatch(email);
  //   } else {
  //     return false;
  //   }
  // }

  Future<User?> registerUsingEmailPassword() async {
    print("Entered registerUsingEmailPassword ny view model");
    setBusy(true);
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      print("Entered try ny view model");
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: eMailController.text,
        password: passwordController.text,
      );
      user = userCredential.user;
      await user!.updateDisplayName(nameController.text);
      // await user.updatePhoneNumber(phoneNumberController.);
      await user.reload();

      user = auth.currentUser;
      print("user =======>${auth.currentUser}");
      if (auth.currentUser != null) {
        print("Entered ifn of registered user----------");

        registerUser(
            role: "User",
            userMail: auth.currentUser!.email.toString(),
            userName: auth.currentUser!.displayName.toString(),
            userPhone: "9909089898");
        setBusy(false);
      } else {
        print("Login Success with out user data");
        setBusy(false);
      }

      // return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        setBusy(false);
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        setBusy(false);
      }
    } catch (e) {
      print("Firebase ERROR =============> $e");
      setBusy(false);
    }
  }

  Future<User?> loginWithFirebase() async {

    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    setBusy(true);
    try {

      final credential = await auth.signInWithEmailAndPassword(
          email: "maneendra@g.com", password: "Maneendra@2021");
      user = credential.user;
     if( auth.currentUser != null) {
       print("User successful login ====> ${user!.email.toString()}");
       setBusy(false);
     }
      else{
        print("User unsuccessful login");
        setBusy(false);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        setBusy(false);
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        setBusy(false);
      }
      print("Something Went wrong!!!");
      setBusy(false);
    }
  }

  fetchUserData() async {
    setBusy(true);
    try {
      var doc = r'''
query MyQuery {
  user {
    role
    user_email
    user_name
    user_phone
  }
}

      ''';

      var response = await _httpService.query(doc);

      print("Login users response data =========> $response");

      // homeResponse = HomeResponse.fromJson(response as Map<String, dynamic>);

      // response = homeResponse;
      // print(
      //     "HMResponse =========> ${response}}");

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
      return Right(response!);
    } catch (e) {
      setBusy(false);
      print("Error ==========> $e");

      return Left(Failure(
          errorMessage: 'Errors => $e',
          message: 'Error in fetching subscription hm details'));
    }
  }

  registerUser(
      {required String userName,
      required String userMail,
      required String userPhone,
      required String role}) async {
    try {
      setBusy(true);
      var response = await _httpService.mutation(r'''
mutation MyMutation($user_email: String!, $user_name: String!, $role: String!, $user_phone: String!) {
  insert_user(objects: {user_email: $user_email, user_name: $user_name, role: $role, user_phone: $user_phone}) {
    affected_rows
  }
}
 ''', variables: {
        "role": role,
        "user_email": userMail,
        "user_name": userName,
        "user_phone": userPhone
      });

      if (response != null) {
        // if (response['insert_user']['affected_rows'] > 0) {
        //
        //   // await HiveConfig.putSingleObject(
        //   //     HiveBox.AppLevelModel, _appLevelModel);
        //   // changeView(SyncBrokersView.PRIMARY_ACCOUNT_VIEW);
        // } else {
        //   print("user did not update");
        //   // _utilsService.showSnackBar(
        //   //   msg: "user did not update",
        //   // );
        // }
        notifyListeners();
        print("object register resp ======> $response");
        setBusy(false);
      } else {
        notifyListeners();
        print("Some thing went wrong");
        setBusy(false);
        // _utilsService.showSnackBar(
        //   msg: "Some thing went wrong",
        // );
      }
    } catch (e) {
      setBusy(false);
      setError(e);
    }
  }

  changeView(LoginScreenView view) {
    currentView = view;
    notifyListeners();
  }

  navigateToLoginScreen() {
    changeView(LoginScreenView.loginScreen);
  }

  navigateToSignUpScreen() {
    print("tapped signup screen");
    changeView(LoginScreenView.signUpScreen);
  }

  navigateToHomeScreen() {
    changeView(LoginScreenView.homeScreen);
  }
}
