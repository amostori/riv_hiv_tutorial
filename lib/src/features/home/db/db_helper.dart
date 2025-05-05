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
      return box.get(CounterBoxKey.counterBoxKey)?.value;
    } else {
      return 0;
    }
  }

  // pozwala obserwować zawartość boxa dla CounterModel
  // ValueListenable<Box<CounterModel>> counterListenable() {
  //   final box = Hive.box<CounterModel>(BoxNames.boxName);
  //   if (box.isEmpty) {
  //     box.add(CounterModel.create(name: 0));
  //   }
  //   return box.listenable();
  // }
  // ValueListenable<Box<User>>? userListenable() {
  //   final box = Hive.box<User>(BoxNames.userBox);
  //   if (box.isEmpty) {
  //     return null;
  //   }
  //   return box.listenable();
  // }
}

@riverpod
DBHelper dbHelper(Ref ref) {
  return DBHelper();
}
