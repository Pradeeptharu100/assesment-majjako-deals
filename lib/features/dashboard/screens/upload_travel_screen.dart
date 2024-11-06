import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travel_app/common/logger.dart';
import 'package:travel_app/features/auth/controllers/login_screen_controller.dart';
import 'package:travel_app/features/dashboard/travel_controller.dart';

class UploadTravelScreen extends StatelessWidget {
  UploadTravelScreen({super.key});

  final TravelController controller = Get.put(TravelController());
  final LoginScreenController loginScreenController =
      Get.put(LoginScreenController());

  @override
  Widget build(BuildContext context) {
    logger.d('Login access token : ${loginScreenController.loginData}');
    return Scaffold(
      body: Form(
        child: Center(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Travel data',
                    style: TextStyle(fontSize: 30),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: controller.nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                        10.r,
                      )),
                      hintText: 'Enter name',
                    ),
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: controller.agendaController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                        10.r,
                      )),
                      hintText: 'Enter agenda',
                    ),
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    maxLines: 3,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: controller.descriptionController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                        10.r,
                      )),
                      hintText: 'Enter description',
                    ),
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: CupertinoButton(
                      color: Colors.deepPurple,
                      onPressed: () {
                        controller.createTravel();
                      },
                      child: const Text('Create travel data'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
