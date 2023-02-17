import 'package:asp_base/_app/constants.dart';
import 'package:hive/hive.dart';
// part 'appLevelModel.g.dart';

@HiveType(typeId: kHIVE_APP_LEVEL)
class AppLevelModel extends HiveObject {
  AppLevelModel();

  @HiveField(0)
  String? accessToken;

  @HiveField(1)
  String? refreshToken;

  @HiveField(2)
  String? userId;





}
