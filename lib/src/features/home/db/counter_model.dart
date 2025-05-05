import 'package:hive_ce/hive.dart';

class CounterModel extends HiveObject {
  int value;

  // String id;

  CounterModel({required this.value});

  // pozwala stworzyć obiekt Achievement bez podawania id
  // losowe id jest generowane z funkcji Uuid().v1()
  // factory CounterModel.create({required int value}) =>
  //     CounterModel(id: const Uuid().v1(), value: value);
}
