import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_api/screens/example1.dart';
import 'package:provider_api/screens/example2.dart';
import 'package:provider_api/screens/get_api_list.dart';

import 'controller/GetApiController.dart';
import 'controller/fake_api_controller.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GetApiController()),
        ChangeNotifierProvider(create: (_) => FakeApiController()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: Example1(),
      ),
    );
  }
}
