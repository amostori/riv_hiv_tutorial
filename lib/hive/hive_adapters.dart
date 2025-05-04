import 'package:hive_ce/hive.dart';

import '../src/features/home/db/counter_model.dart';

part 'hive_adapters.g.dart';

@GenerateAdapters([AdapterSpec<CounterModel>()])
class HiveAdapters {}
