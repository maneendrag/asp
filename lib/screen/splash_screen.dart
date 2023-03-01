import 'package:asp_base/_app/app.locator.dart';
import 'package:asp_base/_app/app.router.dart';
import 'package:asp_base/_services/size_config_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final NavigationService navigationService = locator<NavigationService>();
  final SizeConfigService sizeConfigService = locator<SizeConfigService>();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4)).then((d) {
      print("<============ Navigation Success ===========>");
      navigationService.pushNamedAndRemoveUntil(Routes.homeScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Image.asset(
        "assets/logo.png",
        height: sizeConfigService.heightMultiplier * 25,
        width: sizeConfigService.heightMultiplier * 28,
      ),
    ));
  }
}
