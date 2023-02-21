import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

enum HiveBox { DataModel }

extension HiveBoxEx on HiveBox {
  String get inString => describeEnum(this);
}

abstract class HiveConfig {

  static Future<Box<T>> openBox<T>(HiveBox hiveBox) async {
    return Hive.isBoxOpen(hiveBox.inString)
        ? Hive.box<T>(hiveBox.inString)
        : await Hive.openBox<T>(hiveBox.inString);
  }

  static Box<T> getBox<T>(HiveBox hiveBox) {
    return Hive.box<T>(hiveBox.inString);
  }

  static T getSingleObject<T>(HiveBox hiveBox, {T? defaultValue}) {
    return Hive.box<T>(hiveBox.inString).get(0) ?? defaultValue!;
  }

  static Future<void> putSingleObject<T>(
      HiveBox hiveBox, T defaultValue) async {
    return Hive.isBoxOpen(hiveBox.inString)
        ? await Hive.box<T>(hiveBox.inString).put(0, defaultValue)
        : await (await Hive.openBox<T>(hiveBox.inString)).put(0, defaultValue);
  }

  static Future<void> checkAndPutSingleObject<T>(
      HiveBox hiveBox, T defaultValue) async {
    if (Hive.isBoxOpen(hiveBox.inString)) {
      final T? currentValue = Hive.box<T>(hiveBox.inString).get(0);
      if (currentValue == null) {
        await Hive.box<T>(hiveBox.inString).put(0, defaultValue);
      }
    } else {
      final T? currentValue = Hive.box<T>(hiveBox.inString).get(0);
      if (currentValue == null) {
        await (await Hive.openBox<T>(hiveBox.inString)).put(0, defaultValue);
      }
    }
  }
}
