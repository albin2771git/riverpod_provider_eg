import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_provider_eg/screens/api_fetch/api_services.dart';
import 'package:riverpod_provider_eg/screens/api_fetch/model.dart';

final apiProvider = Provider<ApiServices>((ref) => ApiServices());

final productDataProvider = FutureProvider<List<ProductModel>>((ref) {
  return ref.read(apiProvider).getUser();
});

class ApiFetchUi extends ConsumerWidget {
  const ApiFetchUi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productData = ref.watch(productDataProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Api fetch"),
        ),
        body: productData.when(
            data: (data) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: data[0].products?.length,
                  itemBuilder: (context, index) {
                    print(
                        "--------------------------------${data[0].products?[index].title}");
                    return ListTile(
                      tileColor: Colors.amber.shade100,
                      title: Text(
                        "${data[0].products?[index].title}",
                        style: const TextStyle(color: Colors.black),
                      ),
                    );
                  });
            },
            error: (((error, stackTrace) => Text(error.toString()))),
            loading: () {
              return const Center(child: CircularProgressIndicator());
            }));
  }
}
