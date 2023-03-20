import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_provider_eg/main.dart';

class StateProviderClass extends ConsumerWidget {
  const StateProviderClass({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);

    ref.listen(counterProvider, (((previous, next) {
      if (next == 10) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("The value $next")));
      }
    })));
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: TextButton(
                onPressed: () {
                  ref.read(counterProvider.notifier).state = 0;
                },
                child: const Text(
                  "Reset",
                  style: TextStyle(color: Colors.white),
                )),
          )
        ],
      ),
      body: Center(
        child: Text(
          counter.toString(),
          style: TextStyle(fontSize: 23),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ref.read(counterProvider.notifier).state++;         //-----these are the one of the method to change the state
          ref.read(counterProvider.notifier).update((state) =>
              state +
              1); //-----these are the one of the method to change the state
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
