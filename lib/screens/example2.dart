import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_api/controller/fake_api_controller.dart';

class Example2 extends StatefulWidget {
  const Example2({super.key});

  @override
  State<Example2> createState() => _Example2State();
}

class _Example2State extends State<Example2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<FakeApiController>(
        builder: (context, controller,child) {
          return Center(
            child: Switch(value: controller.isSwitch,
                onChanged: (val){
              controller.toggleSwitch();
                }),
          );
        },
      ),
    );
  }
}
