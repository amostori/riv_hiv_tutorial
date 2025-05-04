import 'package:riv_hiv_tutorial/src/features/home/db/db_helper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_provider.g.dart';

@riverpod
class Counter extends _$Counter {
  @override
  int build() {
    return ref.watch(dbHelperProvider).getFromDB()!;
  }

  void increment() {
    state++;
    ref.read(dbHelperProvider).addToDB(state);
  }
}
