import 'dart:math';

import 'package:flutter/material.dart';

class TestLogic extends StatefulWidget {
  const TestLogic({Key? key}) : super(key: key);

  @override
  _TestLogicState createState() => _TestLogicState();
}

class _TestLogicState extends State<TestLogic> {

    Map<dynamic, List<Map<dynamic, dynamic>>> generateLists(List<Map<dynamic, dynamic>> originalList, dynamic key, {bool addEmptyRecord = false}) {
      Map<dynamic, List<Map<dynamic, dynamic>>> result = {};

      originalList.forEach((item) {
        dynamic keyValue = item[key];
        if (!result.containsKey(keyValue)) {
          result[keyValue] = [];
        }
        result[keyValue]?.add(item);
      });

      if (addEmptyRecord) {
        result.keys.forEach((key) {
          result[key]?.insert(0, {});
        });
      }

      return result;
    }

    printWithSpace(){
      Random random = new Random();
      List<Map<String, dynamic>> originalList = [
        {'name': 'first candidate', 'age': 25, 'role': 'DRIVING'},
        {'name': 'second candidate', 'age': 30, 'role': 'TRASH'},
        {'name': 'third candidate', 'age': 35, 'role': 'DRIVING'},
        {'name': 'fourth candidate', 'age': random.nextInt(90000), 'role': 'COOKING'},
        {'name': 'sixth candidate', 'age': random.nextInt(90000), 'role': 'COOKING'},
        {'name': 'eighth candidate', 'age': random.nextInt(90000), 'role': 'COOKING'},
        {'name': 'tenth candidate', 'age': random.nextInt(90000), 'role': 'DRIVING'},
        {'name': 'eleventh candidate', 'age': random.nextInt(90000), 'role': 'TRASH'},
        {'name': 'twelvth candidate', 'age': random.nextInt(90000), 'role': 'DRIVING'},
        {'name': 'thirteenth candidate', 'age': random.nextInt(90000), 'role': 'DRIVING'},
        {'name': 'fourteenth candidate', 'age': random.nextInt(90000), 'role': 'TRASH'},
        {'name': 'fifteenth candidate', 'age': random.nextInt(90000), 'role': 'DRIVING'},
        {'name': 'sixteenth candidate', 'age': random.nextInt(90000), 'role': 'DRIVING'},
        {'name': 'seventeenth candidate', 'age': random.nextInt(90000), 'role': 'DRIVING'},
        {'name': 'eighteenteenth candidate', 'age': random.nextInt(90000), 'role': 'DRIVING'},
        {'name': 'nineteenth candidate', 'age': random.nextInt(90000), 'role': 'DRIVING'},
        {'name': 'twenty candidate', 'age': random.nextInt(90000), 'role': 'DRIVING'},
        {'name': 'twenty one candidate', 'age': random.nextInt(90000), 'role': 'DRIVING'},
      ];

      Map<dynamic, List<Map<dynamic, dynamic>>> result = generateLists(originalList, "role", addEmptyRecord: true);
      print(result);
    }

  // printList() {
  //
  //   List<Map<String, dynamic>> originalList = [
  //         {'name': 'first candidate', 'age': 25, 'role': 'DRIVING'},
  //         {'name': 'second candidate', 'age': 30, 'role': 'TRASH'},
  //         {'name': 'third candidate', 'age': 35, 'role': 'DRIVING'},
  //         {'name': 'fourth candidate', 'age': random.nextInt(90000), 'role': 'COOKING'},
  //         {'name': 'sixth candidate', 'age': random.nextInt(90000), 'role': 'COOKING'},
  //         {'name': 'eighth candidate', 'age': random.nextInt(90000), 'role': 'COOKING'},
  //         {'name': 'tenth candidate', 'age': random.nextInt(90000), 'role': 'DRIVING'},
  //         {'name': 'eleventh candidate', 'age': random.nextInt(90000), 'role': 'TRASH'},
  //         {'name': 'twelvth candidate', 'age': random.nextInt(90000), 'role': 'DRIVING'},
  //         {'name': 'thirteenth candidate', 'age': random.nextInt(90000), 'role': 'DRIVING'},
  //         {'name': 'fourteenth candidate', 'age': random.nextInt(90000), 'role': 'TRASH'},
  //         {'name': 'fifteenth candidate', 'age': random.nextInt(90000), 'role': 'DRIVING'},
  //         {'name': 'sixteenth candidate', 'age': random.nextInt(90000), 'role': 'DRIVING'},
  //         {'name': 'seventeenth candidate', 'age': random.nextInt(90000), 'role': 'DRIVING'},
  //         {'name': 'eighteenteenth candidate', 'age': random.nextInt(90000), 'role': 'DRIVING'},
  //         {'name': 'nineteenth candidate', 'age': random.nextInt(90000), 'role': 'DRIVING'},
  //         {'name': 'twenty candidate', 'age': random.nextInt(90000), 'role': 'DRIVING'},
  //         {'name': 'twenty one candidate', 'age': random.nextInt(90000), 'role': 'DRIVING'},
  //   ];
  //
  //   Map<String, List<Map<String, dynamic>>> separateLists = {};
  //
  //   originalList.forEach((item) {
  //     String role = item['role'];
  //     if (!separateLists.containsKey(role)) {
  //       separateLists[role] = [];
  //     }
  //     separateLists[role]?.add(item);
  //   });
  //
  //   // print("Separated List ======> ${printWithSpace()}");
  // }

  // checkOriginalLogic() {
  //   List<Map<String, dynamic>> originalList = [
  //     {'name': 'first candidate', 'age': 25, 'role': 'DRIVING'},
  //     {'name': 'second candidate', 'age': 30, 'role': 'TRASH'},
  //     {'name': 'third candidate', 'age': 35, 'role': 'DRIVING'},
  //     {'name': 'fourth candidate', 'age': random.nextInt(90000), 'role': 'COOKING'},
  //     {'name': 'fifth candidate', 'age': random.nextInt(90000), 'role': 'TRASH'},
  //     {'name': 'sixth candidate', 'age': random.nextInt(90000), 'role': 'COOKING'},
  //     {'name': 'seventh candidate', 'age': random.nextInt(90000), 'role': 'TRASH'},
  //     {'name': 'eighth candidate', 'age': random.nextInt(90000), 'role': 'COOKING'},
  //     {'name': 'ninth candidate', 'age': random.nextInt(90000), 'role': 'TRASH'},
  //     {'name': 'tenth candidate', 'age': random.nextInt(90000), 'role': 'DRIVING'},
  //     {'name': 'eleventh candidate', 'age': random.nextInt(90000), 'role': 'TRASH'},
  //     {'name': 'twelvth candidate', 'age': random.nextInt(90000), 'role': 'DRIVING'},
  //     {'name': 'thirteenth candidate', 'age': random.nextInt(90000), 'role': 'DRIVING'},
  //     {'name': 'fourteenth candidate', 'age': random.nextInt(90000), 'role': 'TRASH'},
  //     {'name': 'fifteenth candidate', 'age': random.nextInt(90000), 'role': 'DRIVING'},
  //   ];
  //
  //   Map<String, List<Map<String, dynamic>>> separateLists = {};
  //
  //   for (Map<String, dynamic> item in originalList) {
  //     String role = item['role'];
  //     if (!separateLists.containsKey(role)) {
  //       separateLists[role] = [];
  //     }
  //     separateLists[role]?.add(item);
  //   }
  //
  //   int originalListLength = originalList.length;
  //
  //   for (String role in separateLists.keys) {
  //     int count = 0;
  //     while (count < originalListLength) {
  //       for (Map<String, dynamic> item in separateLists[role]!) {
  //         separateLists[role]?.add(item);
  //         count++;
  //         if (count == originalListLength) break;
  //       }
  //     }
  //   }
  //
  //   print("List of Each catagory ---------> ${separateLists}");
  // }
  //
  // checkWithKeys() {
  //   List<Map<String, dynamic>> originalList = [
  //
  //         {'name': 'first candidate', 'age': 25, 'role': 'DRIVING'},
  //         {'name': 'second candidate', 'age': 30, 'role': 'TRASH'},
  //         {'name': 'third candidate', 'age': 35, 'role': 'DRIVING'},
  //         {'name': 'fourth candidate', 'age': random.nextInt(90000), 'role': 'COOKING'},
  //         {'name': 'fifth candidate', 'age': random.nextInt(90000), 'role': 'TRASH'},
  //         {'name': 'sixth candidate', 'age': random.nextInt(90000), 'role': 'COOKING'},
  //         {'name': 'seventh candidate', 'age': random.nextInt(90000), 'role': 'TRASH'},
  //         {'name': 'eighth candidate', 'age': random.nextInt(90000), 'role': 'COOKING'},
  //         {'name': 'ninth candidate', 'age': random.nextInt(90000), 'role': 'TRASH'},
  //         {'name': 'tenth candidate', 'age': random.nextInt(90000), 'role': 'DRIVING'},
  //         {'name': 'eleventh candidate', 'age': random.nextInt(90000), 'role': 'TRASH'},
  //         {'name': 'twelvth candidate', 'age': random.nextInt(90000), 'role': 'DRIVING'},
  //         {'name': 'thirteenth candidate', 'age': random.nextInt(90000), 'role': 'DRIVING'},
  //         {'name': 'fourteenth candidate', 'age': random.nextInt(90000), 'role': 'TRASH'},
  //         {'name': 'fifteenth candidate', 'age': random.nextInt(90000), 'role': 'DRIVING'},
  //
  //
  //
  //     // {'name': 'John', 'age': 25, 'gender': 'Male', 'city': 'New York'},
  //     // {'name': 'Jane', 'age': 30, 'gender': 'Female', 'city': 'London'},
  //     // {'name': 'Jim', 'age': 35, 'gender': 'Male', 'city': 'Paris'},
  //     // {'name': 'Joan', 'age': random.nextInt(90000), 'gender': 'Female', 'city': 'Berlin'},
  //   ];
  //
  //   List<String> keys = ['gender'];
  //
  //   Map<String, Map<dynamic, List<Map<String, dynamic>>>> separateLists = {};
  //
  //   for (Map<String, dynamic> item in originalList) {
  //     for (String key in keys) {
  //       dynamic value = item[key];
  //       if (!separateLists.containsKey(key)) {
  //         separateLists[key] = {};
  //       }
  //       if (!separateLists[key]!.containsKey(value)) {
  //         separateLists[key]![value] = [];
  //       }
  //       separateLists[key]![value]?.add(item);
  //     }
  //   }
  //
  //   int originalListLength = originalList.length;
  //
  //   for (String key in separateLists.keys) {
  //     for (dynamic value in separateLists[key]!.keys) {
  //       int count = 0;
  //       while (count < originalListLength) {
  //         for (Map<String, dynamic> item in separateLists[key]![value]!) {
  //           separateLists[key]![value]?.add(item);
  //           count++;
  //           if (count == originalListLength) break;
  //         }
  //       }
  //     }
  //   }
  //
  //   print(separateLists);
  // }

  @override
  Widget build(BuildContext context) {
    Map<dynamic, List<Map<dynamic, dynamic>>> generateLists(
        List<Map<dynamic, dynamic>> originalList, dynamic key,
        {dynamic emptyRecordKey,
        dynamic emptyRecordValue,
        dynamic emptyRecordList,
        int emptyRecordIndex = 0}) {
      Map<dynamic, List<Map<dynamic, dynamic>>> result = {};

      originalList.forEach((item) {
        dynamic keyValue = item[key];
        if (!result.containsKey(keyValue)) {
          result[keyValue] = [];
        }
        result[keyValue]?.add(item);
      });

      if (emptyRecordKey != null &&
          emptyRecordValue != null &&
          emptyRecordList != null) {
        List<Map<dynamic, dynamic>> list = result[emptyRecordList]!;
        if (list != null &&
            emptyRecordIndex >= 0 &&
            emptyRecordIndex <= list.length) {
          list.insert(emptyRecordIndex, {emptyRecordKey: emptyRecordValue});
        }
      }

      return result;
    }

    //  int generatePhoneNuber(){
    //   var random = Random();
    //
    //   // Generate 10 random phone numbers
    //   for (int i = 0; i < 10; i++) {
    //     int phoneNumber = "+1 (${random.nextInt(900) + 100}) ${random.nextInt(900) + 100}-${random.nextInt(9000) + 1000}" as int;
    //     print(phoneNumber);
    //   }
    //
    //   return pho;
    // }

    Map<dynamic, List<Map<dynamic, dynamic>>> getWeeklyData() {
      var random = Random();

      List<Map<String, dynamic>> originalList = [
        {
          'name': 'first candidate',
          'Phone': random.nextInt(90000),
          'role': 'DRIVING'
        },
        {
          'name': 'second candidate',
          'Phone': random.nextInt(90000),
          'role': 'TRASH'
        },
        {
          'name': 'third candidate',
          'Phone': random.nextInt(90000),
          'role': 'DRIVING'
        },
        {
          'name': 'fourth candidate',
          'Phone': random.nextInt(90000),
          'role': 'COOKING'
        },
        {
          'name': 'sixth candidate',
          'Phone': random.nextInt(90000),
          'role': 'COOKING'
        },
        {
          'name': 'eighth candidate',
          'Phone': random.nextInt(90000),
          'role': 'COOKING'
        },
        {
          'name': 'tenth candidate',
          'Phone': random.nextInt(90000),
          'role': 'DRIVING'
        },
        {
          'name': 'eleventh candidate',
          'Phone': random.nextInt(90000),
          'role': 'TRASH'
        },
        {
          'name': 'twelvth candidate',
          'Phone': random.nextInt(90000),
          'role': 'DRIVING'
        },
        {
          'name': 'thirteenth candidate',
          'Phone': random.nextInt(90000),
          'role': 'DRIVING'
        },
        {
          'name': 'fourteenth candidate',
          'Phone': random.nextInt(90000),
          'role': 'TRASH'
        },
        {
          'name': 'fifteenth candidate',
          'Phone': random.nextInt(90000),
          'role': 'DRIVING'
        },
        {
          'name': 'sixteenth candidate',
          'Phone': random.nextInt(90000),
          'role': 'DRIVING'
        },
        {
          'name': 'seventeenth candidate',
          'Phone': random.nextInt(90000),
          'role': 'DRIVING'
        },
        {
          'name': 'eighteenteenth candidate',
          'Phone': random.nextInt(90000),
          'role': 'DRIVING'
        },
        {
          'name': 'nineteenth candidate',
          'Phone': random.nextInt(90000),
          'role': 'DRIVING'
        },
        {
          'name': 'twenty candidate',
          'Phone': random.nextInt(90000),
          'role': 'DRIVING'
        },
        {
          'name': 'twenty one candidate',
          'Phone': random.nextInt(90000),
          'role': 'DRIVING'
        },
      ];

      Map<dynamic, List<Map<dynamic, dynamic>>> result = generateLists(
          originalList, "role",
          emptyRecordKey: "isEmpty",
          emptyRecordValue: true,
          emptyRecordList: "DRIVING",
          emptyRecordIndex: 1);
      print(result);
      return result;
    }
    // String formatMap(Map<dynamic, List<Map<dynamic, dynamic>>> map) {
    //   String result = "";
    //   map.forEach((key, value) {
    //     result += "$key:\n";
    //     value.forEach((innerMap) {
    //       innerMap.forEach((innerKey, innerValue) {
    //         result += "  $innerKey: $innerValue\n";
    //       });
    //     });
    //   });
    //   return result;
    // }

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          Expanded(
            child: ListView.builder(

              itemCount: getWeeklyData().length,
              itemBuilder: (context, index) {
                var role = getWeeklyData().keys.toList()[index];
                var date = DateTime.now().add(Duration(days: index));
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 22, vertical: 12),
                            margin: const EdgeInsets.only(bottom: 12, top: 12),

                            color: Colors.amber,
                            child: Center(
                                child: Text(
                              "Role: $role",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ))),
                        Text(date.day.toString())
                      ],
                    ),
                    ...getWeeklyData()[role]!
                        .map((e) => Container(
                      // width: double.infinity,
                            color: Colors.grey,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 12),
                            child: Row(
                              children: [
                                Text(
                                  "Name: ${e['name']} \nAge: ${e['Phone']}",
                                  style:
                                     const TextStyle(color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                      ),
                                ),
                              ],
                            )))
                        .toList(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );

    // return Scaffold(
    //   body: Center(
    //     child: GestureDetector(
    //         onTap: () {
    //           getWeeklyData();
    //         },
    //         child: Container(height: 75, width: 200, child: Text(formatMap(getWeeklyData(), "DRIVING")))),
    //   ),
    // );
  }
}
