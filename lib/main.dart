import 'package:case_app/core/theme/theme_app.dart';
import 'package:flutter/material.dart';

import 'app/home/ui/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Case App',
      theme: themeApp,
      home: const HomePage(),
    );
  }
}
