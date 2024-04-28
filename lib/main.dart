import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/providers/counter_provider.dart';
import 'package:provider_demo/providers/title_provider.dart';
import 'package:provider_demo/screens/edit_title_screen.dart';
import 'package:provider_demo/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // because [HomeScreen] and [EditTitleScreen] need the same instance of [TitleProvider],
    // we must lift the provider creation into the top of both routes.
    return ChangeNotifierProvider(
      create: (context) => TitleProvider(title: 'Provider Demo'),
      child: MaterialApp(
        title: 'Provider Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: HomeScreen.path,
        routes: {
          HomeScreen.path: (context) {
            return MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (context) => CounterProvider(),
                ),
                // using the existing [TitleProvider] instead of creating one
                ChangeNotifierProvider.value(
                  value: context.read<TitleProvider>(),
                ),
              ],
              child: const HomeScreen(),
            );
          },
          EditTitleScreen.path: (context) {
            // using the existing [TitleProvider] instead of creating one
            return ChangeNotifierProvider.value(
              value: context.read<TitleProvider>(),
              child: const EditTitleScreen(),
            );
          },
        },
      ),
    );
  }
}
