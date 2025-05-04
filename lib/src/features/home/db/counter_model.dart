import 'package:hive_ce/hive.dart';

class CounterModel extends HiveObject {
  int value;

  CounterModel({required this.value});
}
