import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_api/controller/GetApiController.dart';
import 'package:provider_api/controller/fake_api_controller.dart';

class Example1 extends StatelessWidget {
  const Example1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer2<GetApiController,FakeApiController>(
          builder: (context, mahander,controller, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  mahander.count.toString(),
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 16),

                ElevatedButton(
                  onPressed: () {
                   mahander.incrementCount();
                  },
                  child: Text('Increase Counter'),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                  mahander.decrementCount();
                  },
                  child: Text('Decrease Counter'),
                ),
                SizedBox(height: 16),
                Switch(
                    value: controller.isSwitch,

                    onChanged: (val){
                  controller.toggleSwitch();
                })
              ],
            );
          },
        ),
      ),
    );
  }
}
