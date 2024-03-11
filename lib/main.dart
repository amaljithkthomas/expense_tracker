import 'package:expense_tracker/constants.dart';
import 'package:expense_tracker/expenses.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then(
  //   (value) =>
  //       runApp(
  //     const MyApp(),
  //   ),
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: Constants.cDarkScheme,
        cardTheme: const CardTheme().copyWith(
          color: Constants.cDarkScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        colorScheme: Constants.cScheme,
        appBarTheme: AppBarTheme(
          backgroundColor: Constants.cScheme.onPrimaryContainer,
          foregroundColor: Constants.cScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: Constants.cScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Constants.cScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: ThemeData().textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Constants.cScheme.onSecondaryContainer,
                  ),
            ),
      ),
      themeMode: ThemeMode.system,
      home: const Expense(),
    );
  }
}
