import 'package:flutter/material.dart';
import 'package:notebook/components/app_theme.dart';
import 'package:notebook/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final MaterialTheme materialTheme = MaterialTheme(textTheme);
    return MaterialApp(
      title: 'Notebook App',
      theme: materialTheme.light(),
      darkTheme: materialTheme.dark(),
      themeMode: ThemeMode.system,
      highContrastDarkTheme: materialTheme.darkHighContrast(),
      highContrastTheme: materialTheme.lightHighContrast(),
      home: const HomePage(),
    );
  }
}
