import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wabiz_riverpod_2/notifier_provider/my_notifier_provider.dart';

void main() {
  runApp(
    ProviderScope(
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Consumer(
              builder: (context, ref, child) {
                final count = ref.watch(counterNotifierProvider);
                return Text(
                  '${count}',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                );
              },
            ),
          ],
        ),
        floatingActionButton: Consumer(
          builder: (context, ref, child) {
            return FloatingActionButton(
              onPressed: () {
                ref.read(counterNotifierProvider.notifier).increment();
              },
              child: Icon(
                Icons.add,
              ),
            );
          }
        ),
      ),
    );
  }
}
