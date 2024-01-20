import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/pages/first_page.dart';
import '/utils/constants.dart';
import 'models/task_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter ToDo App',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.dark,
        home: const FirstPage(),
      ),
    );
  }
}
