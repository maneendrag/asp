
import 'package:asp_base/_services/size_config_service.dart';
import 'package:asp_base/screen/home/home_screen.dart';
import 'package:asp_base/screen/login/screens/landing_screen.dart';
import 'package:asp_base/screen/login/screens/login_screen.dart';
import 'package:asp_base/screen/login/screens/signUpScreen.dart';
import 'package:asp_base/screen/splash_screen.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import '../_services/api_service.dart';
import '../_services/connectivity_service.dart';
import '../_services/util_service.dart';



@StackedApp(routes:[
MaterialRoute(initial: true,page: SplashScreen),
MaterialRoute(page: LandingScreen),
MaterialRoute(page: LoginScreen),
MaterialRoute(page: SignUpScreen),
MaterialRoute(page: HomeScreen),

], dependencies: [
  LazySingleton(classType: HttpService),
  LazySingleton(classType: SnackbarService),
  LazySingleton(classType: ConnectivityService),
  LazySingleton(classType: UtilsService),
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: DialogService),
  LazySingleton(classType: BottomSheetService),
  LazySingleton(classType: SizeConfigService),

]
    ,logger: StackedLogger())class Appetup {}