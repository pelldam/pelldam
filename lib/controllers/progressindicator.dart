import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:get/get.dart';

class ProgressIndicatorController extends GetxController {
  var isLoading = false.obs;

  void onSubmit() {
    isLoading(true);
  }
}
