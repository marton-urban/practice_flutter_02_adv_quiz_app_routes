import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'start_screen.dart';
import 'questions_screen.dart';
import 'results_screen.dart';
import 'core_state.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CoreState(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advanced Quiz App',
      initialRoute: '/start',
      routes: <String, WidgetBuilder>{
        '/start': (BuildContext context) => const StartScreen(),
        '/quiz': (BuildContext context) => const QuestionsScreen(),
        '/result': (BuildContext context) => const ResultsScreen(),
      },
    );
  }
}
