import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_api/screens/post_api/controller/user_controller.dart';
import 'package:provider_api/screens/post_api/screen/create_user.dart';
import 'controller/GetApiController.dart';
import 'controller/fake_api_controller.dart';
import 'controller/product_controller.dart';

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
        ChangeNotifierProvider(create: (_) => ProductController()),
        ChangeNotifierProvider(create: (_) => UserController()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: CreateUserScreen(),
      ),
    );
  }
}
