import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_api/controller/GetApiController.dart';

class GetApiScreen extends StatefulWidget {
  const GetApiScreen({super.key});

  @override
  State<GetApiScreen> createState() => _GetApiScreenState();
}

class _GetApiScreenState extends State<GetApiScreen> {
  late GetApiController controller;
  @override
  void initState() {
    controller = context.read<GetApiController>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getApiData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<GetApiController>(
        builder: (BuildContext context, bhaskr, Widget? child) {
          var data = bhaskr.singleUserData;
          print("data >>>>>>>>>>>>>>>>>>> $data");
          return bhaskr.isLoading
              ? Center(child: CircularProgressIndicator()) // Loading indicator
              : Center(
                  child: ListTile(
                    leading: Text(
                      data.id.toString(),
                      style: TextStyle(fontSize: 41),
                    ),
                    title: Text(data.title ?? ""),
                    subtitle: Text(data.body ?? ""),
                  ),
                );
        },
      ),
    );
  }
}
