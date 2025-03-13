import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_flutter/providers/task_provider.dart';
import 'package:task_manager_flutter/screens/home_screen.dart';

import 'package:task_manager_flutter/providers/theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => TaskProvider()),
        ChangeNotifierProvider(create: (ctx) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (ctx, themeProvider, _) => MaterialApp(
          title: 'Task Manager',
          theme: themeProvider.themeData,
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
