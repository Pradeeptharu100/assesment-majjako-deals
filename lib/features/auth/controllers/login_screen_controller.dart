import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/common/api_services.dart';
import 'package:travel_app/common/logger.dart';
import 'package:travel_app/features/dashboard/screens/travel_screen.dart';

class LoginScreenController extends GetxController {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
// Variables
  final RxMap _loginData = {}.obs;
  // Getter

  Map get loginData => _loginData;

  void register() async {
    try {
      final result = await ApiServices.dio.post(
        ApiServices.register,
        data: {
          "username": userNameController.text,
          "password": passwordController.text
        },
      );
      if (result.statusCode == 200) {
        logger.d('Result data : ${result.data}');
        _loginData(result.data);

        Get.off(() => TravelScreen());
      }
    } catch (error) {}
  }
}
