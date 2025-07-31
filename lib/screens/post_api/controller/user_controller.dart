import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../screen/login_screen.dart';

class UserController extends ChangeNotifier {
  bool isLoading = false;

  /// controller
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> createUser(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    String url = "https://api.escuelajs.co/api/v1/users/";
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "name": nameController.text,
          "email": emailController.text,
          "password": passwordController.text,
          "avatar": "https://picsum.photos/800",
        }),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        showCustomSnackBar(context, "Create User SuccessFully!", Colors.green);
        debugPrint("Data<><><><><><><><> $data");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      } else {
        log('statusCode ------------------- : ${response.statusCode}');
        showCustomSnackBar(context, "Create User Failed!", Colors.red);
      }
    } catch (e, stackTrace) {
      log(" Error $e");
      log("stackTrace $stackTrace");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Reusable function to show snackbar with optional action
  void showCustomSnackBar(
    BuildContext context,
    String message,
    Color? color, {
    Duration duration = const Duration(seconds: 3),
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color ?? Colors.black,
      duration: duration,
      action: (actionLabel != null && onAction != null)
          ? SnackBarAction(label: actionLabel, onPressed: onAction)
          : null,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
