import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterDemo extends StateNotifier<int> {
  CounterDemo() : super(0);
  void increment() {
    state++;
  }

  void reset() {
    state = 0;
  }

  void decrement() {
    state--;
  }
}

final counterProvider2 =
    StateNotifierProvider<CounterDemo, int>((ref) => CounterDemo());

//-----------------------
class CounterDemo2 extends ConsumerWidget {
  const CounterDemo2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider2);
    return Scaffold(
      appBar: AppBar(
        title: const Text("State Notifier"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "The Value is $counter",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 23,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  //  ref.read(counterProvider2.notifier).state = 0;
                  ref.read(counterProvider2.notifier).reset();
                },
                child: const Text("Reset")),
            ElevatedButton(
                onPressed: () {
                  //  ref.read(counterProvider2.notifier).state = 0;
                  ref.read(counterProvider2.notifier).decrement();
                },
                child: const Text("Decrement"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider2.notifier).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
