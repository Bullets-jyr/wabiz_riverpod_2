import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wabiz_riverpod_2/async_notifier_provider/my_async_notifier_provider.dart';

void main() {
  runApp(
    ProviderScope(
      child: const MainApp(),
    ),
  );
}

class RiverpodWidget extends StatelessWidget {
  const RiverpodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('RiverpodWidget');
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Consumer(
                builder: (context, ref, child) {
                  // final count = ref.watch(counterNotifierProvider);
                  final count = ref.watch(asyncCounterNotifierProvider);
                  return count.when(
                    data: (data) {
                      return Center(
                        child: Text(
                          '${data}',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      );
                    },
                    error: (e, t) => Text('$e'),
                    loading: () {
                      return CircularProgressIndicator.adaptive();
                    },
                  );
                  // return Center(
                  //   child: Text(
                  //     '${count}',
                  //     style: TextStyle(
                  //       fontSize: 20,
                  //     ),
                  //   ),
                  // );
                },
              ),
            ],
          ),
        ),
        // floatingActionButton: Consumer(
        //   builder: (context, ref, child) {
        //     return FloatingActionButton(
        //       onPressed: () {
        //         ref.read(counterNotifierProvider.notifier).increment();
        //       },
        //       child: Icon(
        //         Icons.add,
        //       ),
        //     );
        //   }
        // ),
      ),
    );
  }
}
