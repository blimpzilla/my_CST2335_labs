import 'package:flutter/material.dart';

import 'login_page.dart';

import 'package:flutter_easy_translate/flutter_easy_translate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final delegate = await LocalizationDelegate.create(
    fallbackLocale: 'en',
    supportedLocales: ['en', 'fr'],
  );

  runApp(LocalizedApp(delegate, const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localizationDelegate = LocalizedApp.of(context).delegate;

    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: MaterialApp(
        title: 'CST2335 Labs',
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          localizationDelegate,
        ],
        supportedLocales: localizationDelegate.supportedLocales,
        locale: localizationDelegate.currentLocale,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const LoginPage(),
      ),
    );
  }
}

/// Displays my student information for Lab 1.
///
/// This is a StatelessWidget because my name, student number,
/// course code, and lab number do not change while the app is running.
class _MyStudentInfo extends StatelessWidget {
  const _MyStudentInfo();

  final double myFontSize = 30.0;

  /// Builds a column containing my student information.
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Kim Muhizi - 041257345', style: TextStyle(fontSize: myFontSize)),
        Text('CST2335', style: TextStyle(fontSize: myFontSize)),
        Text('Lab Assignment 1', style: TextStyle(fontSize: myFontSize)),
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
