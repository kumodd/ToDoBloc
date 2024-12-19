import 'package:flutter/material.dart';
import 'package:todo/ui/screens/show_to_do.dart';
import 'package:todo/utils/custom_easy_loading.dart';

import 'di/injection.dart';

void main() {
  runApp(const MyApp());
  CustomEasyLoading.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ShowToDoScreen());
  }
}
