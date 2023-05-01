import 'package:flugger/color_schemes.g.dart';
import 'package:flugger/providers/database_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  runApp(const ProviderScope(child: Flugger()));
}

class Flugger extends StatelessWidget {
  const Flugger({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      title: 'My Blog',
      home: const MainPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MainPage extends ConsumerStatefulWidget {
  final String title;

  const MainPage({super.key, required this.title});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  final databaseInitProvider =
      FutureProvider.autoDispose((ref) => ref.watch(databaseProvider).init());

  @override
  Widget build(BuildContext context) {
    AsyncValue init = ref.watch(databaseInitProvider);

    return init.when(
        loading: () => const CircularProgressIndicator(),
        error: (error, stackTrace) => Text(error.toString()),
        data: (init) {
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          );
        });
  }
}
