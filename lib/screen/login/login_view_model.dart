import 'package:asp_base/_app/enums/app_enums.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {

  LoginScreenView currentView = LoginScreenView.landingScreen;

  Future<User?> registerUsingEmailPassword({
    required String email,
    required String password,
  }) async {
    print("Entered registerUsingEmailPassword ny view model");
    setBusy(true);
    FirebaseAuth auth = FirebaseAuth.instance;

    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,

      );
      user = userCredential.user;
      // await user!.updateDisplayName(displayName);
      // await user.updatePhoneNumber(phoneNumber);
      // await user.reload();
      user = auth.currentUser;
      setBusy(false);
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
    return user;
  }

  changeView(LoginScreenView view) {
    currentView = view;
    notifyListeners();
  }

  navigateToLoginScreen(){
    changeView(LoginScreenView.loginScreen);
  }

  navigateToSignUpScreen(){
    print("tapped signup screen");
    changeView(LoginScreenView.signUpScreen);
  }

  navigateToHomeScreen(){
    changeView(LoginScreenView.homeScreen);
  }

}
