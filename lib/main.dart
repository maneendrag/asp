import 'package:asp_base/_app/app.router.dart';
import 'package:asp_base/_services/size_config_service.dart';
import 'package:asp_base/data_model.dart';
import 'package:asp_base/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '_app/app.locator.dart';
import 'hive_config.dart';

 main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await Hive.initFlutter();
  Hive.registerAdapter<DataModel>(DataModelAdapter());
  await HiveConfig.openBox<DataModel>(HiveBox.DataModel);
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
        locator<SizeConfigService>().init(constraints, orientation);
        return MaterialApp(
          theme: ThemeData(scaffoldBackgroundColor: const Color(0xff1B262C),
            unselectedWidgetColor: Colors.white,
          ),
          onGenerateRoute: StackedRouter().onGenerateRoute,
          navigatorKey: StackedService.navigatorKey,
          debugShowCheckedModeBanner: false,

          // navigatorObservers: [BotToastNavigatorObserver()],
          // builder: BotToastInit(),
        );
      });
    });
  }
}
