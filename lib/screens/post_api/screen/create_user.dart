import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/user_controller.dart';

class CreateUserScreen extends StatefulWidget {
  const CreateUserScreen({super.key});

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  // "name": "Bhaskar",
  // "email": "bhaskar@gmail.com",
  // "password": "Test123",
  // "avatar": "https://picsum.photos/800",



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create User'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Consumer<UserController>(
        builder: (BuildContext context, controller, Widget? child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
            child: Column(
              children: [
                TextFormField(
                  controller: controller.nameController,
                  decoration: InputDecoration(hint: Text("Enter Your Name")),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: controller.emailController,
                  decoration: InputDecoration(hint: Text("Enter Your Email")),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: controller.passwordController,
                  decoration: InputDecoration(hint: Text("Enter Your Password")),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    controller.createUser(context);
                  },
                  child: controller.isLoading
                      ? CircularProgressIndicator()
                      : Text('Create User'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
