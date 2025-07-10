import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/GetApiController.dart';

class GetApiListScreen extends StatefulWidget {
  const GetApiListScreen({super.key});

  @override
  State<GetApiListScreen> createState() => _GetApiListScreenState();
}

class _GetApiListScreenState extends State<GetApiListScreen> {
  late GetApiController controller;
  @override
  void initState() {
    controller = context.read<GetApiController>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getApiDataList();
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
              : ListView.builder(
                 itemCount: bhaskr.userDataList.length,
                  itemBuilder: (context, index) {
                   var data = bhaskr.userDataList[index];
                    return ListTile(
                      leading: Text(
                        data.id.toString(),
                        style: TextStyle(fontSize: 21),
                      ),
                      title: Text(data.title ?? ""),
                      subtitle: Text(data.body ?? ""),
                    );
                  },
                );
        },
      ),
    );
  }
}
