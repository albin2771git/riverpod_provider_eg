import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_provider_eg/screens/stateprovider.dart';

import '../main.dart';

class NextPage extends ConsumerStatefulWidget {
  const NextPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NextPageState();
}

class _NextPageState extends ConsumerState<NextPage> {
  @override
  void initState() {
    final name = ref.read(
        usernameProvider); //-----------another way to read the provider value
    print(
        "name=$name"); //---------------printing the  vale in the provider in inistate
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final name = ref.watch(usernameProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StateProviderClass()));
            },
            child: const Text("State Provider")),
      ),
    );
  }
}
