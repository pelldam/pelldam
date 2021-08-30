import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FoodCategoriesRepository extends GetxController {
  final _data = [].obs;
  final _selectedData = [].obs;
  // final List<Map<String, dynamic>>? get data => _data.value;

  // final List<String>? get selectedData => _selectedData.value;

  @override
  void onInit() {
    getCategoryData();
    super.onInit();
  }

  void setSelection(List<String> list) {
    _selectedData(list);
  }

  Future getCategoryData() async {
    // final prefs = await SharedPreferences.getInstance();
    // final key = 'token';
    // final value = prefs.get(key) ?? 0;
    try {
      print("getting  category");
      var response = await http.get(
          Uri.parse(
              'https://foodgital2.herokuapp.com/food-category/view-all-categories'),
          headers: {
            "Accept": "application/json",
          });

      // if (!response){errorMessage: food no dey}
      print("response ${response.body.toString()}");
      final body = json.decode(response.body)['response'];

      print("result $body");
      List<Map<String, dynamic>> res = List<Map<String, dynamic>>.from(body);
      // print('$res is good');

      _data(res);

      return res;
    } catch (e) {
      print("error ${e.toString()}");
    }
  }
}
