import 'package:flutter/material.dart';
import 'package:greepp/core/di/injector.dart';

import 'views/greens_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Greepp',
      home: GreensScreen(),
    );
  }
}
