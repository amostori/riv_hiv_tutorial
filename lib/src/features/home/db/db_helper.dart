import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce/hive.dart';
import 'package:riv_hiv_tutorial/src/features/home/db/counter_model.dart';
import 'package:riv_hiv_tutorial/src/utils/constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'db_helper.g.dart';

class DBHelper {
  void addToDB(int value) {
    final box = Hive.box<CounterModel>(BoxName.boxName);
    box.put(CounterBoxKey.counterBoxKey, CounterModel(value: value));
  }

  int? getFromDB() {
    final box = Hive.box<CounterModel>(BoxName.boxName);
    if (box.isNotEmpty) {
      return box
          .get(CounterBoxKey.counterBoxKey)
          ?.value;
    } else {
      return 0;
    }
  }
}

@riverpod
DBHelper dbHelper(Ref ref) {
  return DBHelper();
}
