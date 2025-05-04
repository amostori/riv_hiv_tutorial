import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce/hive.dart';
import 'package:riv_hiv_tutorial/src/features/home/db/counter_model.dart';
import 'package:riv_hiv_tutorial/src/features/home/provider/counter_provider.dart';
import 'package:riv_hiv_tutorial/src/utils/constants.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Home screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You have pushed button this many times: $counter'),
            ValueListenableBuilder<Box<CounterModel>>(
              valueListenable:
                  Hive.box<CounterModel>(BoxName.boxName).listenable(),
              builder: (BuildContext context, counterBox, Widget? child) {
                return Text(
                  counterBox.isNotEmpty
                      ? '${counterBox.get(CounterBoxKey.counterBoxKey)?.value}'
                      : '0',
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
