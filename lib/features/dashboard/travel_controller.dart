import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/common/api_services.dart';
import 'package:travel_app/common/logger.dart';
import 'package:travel_app/features/auth/controllers/login_screen_controller.dart';
import 'package:travel_app/features/dashboard/screens/travel_detail_screen.dart';

class TravelController extends GetxController {
  // Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController agendaController = TextEditingController();
  final LoginScreenController loginScreenController =
      Get.put(LoginScreenController());
// Variables
  final RxList _travelList = [].obs;
  final RxMap _travelDetail = {}.obs;
  final RxBool _isLoading = false.obs;

// Getter
  bool get isLoading => _isLoading.value;
  List get travelList => _travelList;
  Map get travelDetail => _travelDetail;
//Setter
//Methods
  fetchTravelList() async {
    _isLoading(true);

    try {
      final result = await ApiServices.dio.get(ApiServices.travel);
      if (result.statusCode == 200) {
        _isLoading(false);

        logger.d('Response success data : ${result.data}');
        _travelList(result.data);
      }
    } catch (error) {
      _isLoading(false);

      logger.e('Travel Data fetch error : $error');
    }
  }

  createTravel() async {
    _isLoading(true);
    try {
      final result = await ApiServices.dio.post(
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization':
                'JWT ${loginScreenController.loginData['access']} ',
          },
        ),
        ApiServices.travel,
        data: {
          "name": nameController.text,
          "description": descriptionController.text,
          "traveldetails_set[0]travel_agenda": agendaController.text,
        },
      );
      if (result.statusCode == 201) {
        _isLoading(false);
        logger.d('travel data created : ${result.data}');
        Get.snackbar(
          "Travel data created",
          "New data upload successful",
          icon: const Icon(Icons.category, color: Colors.white),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
        );

        Get.back();
      }
    } catch (error) {
      _isLoading(false);

      logger.e('Travel Data fetch error : $error');
    }
  }

  fetchTravelDetail(int id) async {
    _isLoading(true);

    try {
      final result =
          await ApiServices.dio.get('${ApiServices.travelDetail}/$id');
      if (result.statusCode == 200) {
        _isLoading(false);
        logger.d('Response success data : ${result.data}');
        _travelDetail(result.data);
        Get.to(() => TravelDetailScreen());
      }
    } catch (error) {
      _isLoading(false);

      logger.e('Travel Data fetch error : $error');
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchTravelList();
  }
}
