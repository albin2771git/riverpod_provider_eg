import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_provider_eg/screens/demoScreen.dart';

void main() {
  runApp(const ProviderScope(child: MaterialApp(home: MyApp())));
}

final usernameProvider = StateProvider<String>((ref) {
  return "user@gmail.com";
});

//-----state provider
final counterProvider = StateProvider<int>((ref) => 0);
