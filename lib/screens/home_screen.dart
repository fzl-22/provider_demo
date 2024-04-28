import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/providers/counter_provider.dart';
import 'package:provider_demo/providers/title_provider.dart';
import 'package:provider_demo/screens/edit_title_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const path = '/home';

  @override
  Widget build(BuildContext context) {
    // call the context.watch here
    // final counter = context.watch<CounterProvider>().counter;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Selector<TitleProvider, String>(
          builder: (context, title, child) {
            return Text(title);
          },
          selector: (context, provider) => provider.title,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, EditTitleScreen.path);
            },
            child: const Text('Edit Title'),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            // use extension for convenience (but will rebuild the entire widget)
            // Text(
            //   '$counter',
            //   style: Theme.of(context).textTheme.headlineMedium,
            // ),
            // use extension together with Builder widget for optimation
            Builder(
              builder: (context) {
                final counter = context.watch<CounterProvider>().counter;
                return Text(
                  '$counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            // use consumer if you need all consumer of <T> providers to rebuilt when changed
            Consumer<CounterProvider>(
              builder: (context, provider, _) {
                return Text(
                  '${provider.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            // use selector if you only need this particular data to rebuilt when changed
            Selector<CounterProvider, int>(
              builder: (context, counter, child) {
                return Text(
                  '$counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
              selector: (context, provider) => provider.counter,
            ),
            // the consumer below will be rebuilt even though they are not changing any state
            Consumer<CounterProvider>(
              builder: (context, value, child) {
                debugPrint('consumer is also rebuilt!');
                return const Text('With consumer');
              },
            ),
            // the selector below will not rebuilt event because the listened state is different
            Selector<CounterProvider, String>(
              builder: (context, dummyState, child) {
                debugPrint(
                    'Consumer is not rebuilt when the selector is different');
                return Text(dummyState);
              },
              selector: (context, provider) => provider.dummyState,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'increment',
            onPressed: () => context.read<CounterProvider>().incrementCounter(),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'decrement',
            onPressed: () => context.read<CounterProvider>().decrementCounter(),
            tooltip: 'Increment',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
