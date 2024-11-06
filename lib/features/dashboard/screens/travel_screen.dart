import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travel_app/features/dashboard/screens/upload_travel_screen.dart';
import 'package:travel_app/features/dashboard/travel_controller.dart';

class TravelScreen extends StatelessWidget {
  TravelScreen({super.key});

  final TravelController controller = Get.put(TravelController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel'),
      ),
      body: Obx(
        () => controller.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                    separatorBuilder: (context, index) {
                      final travel = controller.travelList[index];
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                              color: Colors.grey,
                            )),
                        child: ListTile(
                          onTap: () {
                            controller.fetchTravelDetail(travel['id']);
                          },
                          selected: true,
                          titleAlignment: ListTileTitleAlignment.center,
                          leading: Text(
                            'Id: ${travel['id'] ?? ""}',
                          ),
                          trailing: Text(
                            'Title: ${travel['name'] ?? ""}',
                          ),
                          subtitle: Text(
                            'Description: ${travel['description'] ?? ""}',
                          ),
                        ),
                      );
                    },
                    itemCount: controller.travelList.length),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Get.to(() => UploadTravelScreen());
        },
      ),
    );
  }
}

/*
           {
        "id": 1,
        "name": "asd",
        "description": "asd"
    },

          */
