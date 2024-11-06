import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/common/p_images.dart';
import 'package:travel_app/features/dashboard/travel_controller.dart';

class TravelDetailScreen extends StatelessWidget {
  TravelDetailScreen({super.key});
  final TravelController controller = Get.put(TravelController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: const Text('Travel Detail Screen'),
      ),
      body: Obx(() {
        final travelDetail = controller.travelDetail;

        return controller.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                          imageUrl: travelDetail['group_photo'] ??
                              PImages.travelGroupImage),
                    ),
                    const SizedBox(height: 20),
                    Text(travelDetail['travel']['name'] ?? ""),
                    const SizedBox(height: 20),
                    Text(travelDetail['travel']['travel_agenda'] ?? ""),
                    const SizedBox(height: 20),
                    const Text(
                      'Description',
                      style: TextStyle(fontSize: 25),
                    ),
                    const SizedBox(height: 10),
                    Text(travelDetail['travel']['description'] ?? ""),
                  ],
                ),
              );
      }),
    );
  }
}



/*
{
    "id": 1,
    "travel": {
        "id": 2,
        "name": "asd",
        "description": "asd"
    },
    "group_photo": null,
    "travel_agenda": "asd"
}
*/