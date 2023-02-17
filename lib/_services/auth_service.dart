import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  // ApiService _apiService = locator<ApiService>();
  FirebaseAuth _auth;
  AuthenticationService() : _auth = FirebaseAuth.instance;
  // AppLevelModel _appLevelModel =
  //     HiveConfig.getSingleObject<AppLevelModel>(HiveBox.AppLevelModel);

  Stream<User?> get user => _auth.authStateChanges();

  Future<String> createAccount({String? email, String? password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email!.trim(), password: password!.trim());
      return "Success";
    } on FirebaseAuthException catch (e) {
      return e.message!;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserCredential> signInWithCredentials(
      {AuthCredential? credential}) async {
    UserCredential authResult = await _auth.signInWithCredential(credential!);
    return authResult;
  }
  //
  // Future<bool> signOut() async {
  //   try {
  //     await _auth.signOut();
  //     final AppLevelModel defaultAppLevelModel = AppLevelModel()
  //       ..accessToken = ''
  //       ..refreshToken = ''
  //       ..userId = ''
  //       ..isBlocked = false
  //       ..isProfileCompleted = false
  //       ..name = ''
  //       ..email = ''
  //       ..phone = ''
  //       ..profileImage = ''
  //       ..firebaseId = ''
  //       ..fcmToken = ''
  //       ..firstTime = false;
  //     await HiveConfig.checkAndPutSingleObject<AppLevelModel>(
  //         HiveBox.AppLevelModel, defaultAppLevelModel);
  //     return true;
  //   } catch (err) {
  //     return false;
  //   }
  // }
}
