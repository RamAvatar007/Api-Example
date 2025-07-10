import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider_api/model/single_user_model.dart';

class GetApiController extends ChangeNotifier{

  int count = 0;

  void incrementCount(){
    count++;
    notifyListeners();
  }

  void decrementCount(){
    if(count > 0){
      count--;
      notifyListeners();
    }
  }

  /// get Api data
  ///
  /// map
  SingleUserModel singleUserData = SingleUserModel();

  bool isLoading = false;

  Future<void> getApiData() async {
    isLoading = true;
    notifyListeners();

    String url = 'https://jsonplaceholder.typicode.com/posts/1';

    // Example headers (modify these as needed)
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      // 'Authorization': 'Bearer YOUR_TOKEN', // Uncomment if needed
    };

    try {
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        singleUserData = SingleUserModel.fromJson(data);
      } else {
        print('Failed to load data, status code: ${response.statusCode}');
      }
    } catch (e,stackTrace) {
      print('Error fetching data: $e');
      print('Error fetching data: $stackTrace');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }


  List<SingleUserModel> userDataList = [];
  Future<void> getApiDataList() async {
    userDataList.clear();
    isLoading = true;
    notifyListeners();
    String url = 'https://jsonplaceholder.typicode.com/posts';

    // Example headers (modify these as needed)
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      // 'Authorization': 'Bearer YOUR_TOKEN', // Uncomment if needed
    };

    try {
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        for (var item in data) {
          userDataList.add(SingleUserModel.fromJson(item));
        }
        // userDataList = List<SingleUserModel>.from(data.map((json) =>
        //     SingleUserModel.fromJson(json))).toList();
      } else {
        print('Failed to load data, status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

}