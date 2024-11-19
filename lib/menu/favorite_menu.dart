import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobilee_11pplg2_19/controller/favorite_controller.dart';
import 'package:pas1_mobilee_11pplg2_19/widgets/color.dart';
import 'package:pas1_mobilee_11pplg2_19/widgets/image.dart';
import 'package:pas1_mobilee_11pplg2_19/widgets/text.dart';

class FavoriteMenu extends StatelessWidget {
  final FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        backgroundColor: grayNavColor,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  hintText: 'Tim yang anda sukai',
                  fontSize: 20,
                  colors: whiteColor,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
          ],
        ),
      ),
      body: Obx(() {
        if (favoriteController.tasks.isEmpty) {
          return Center(
            child: MyText(
              hintText: 'Belum ada tim yang anda sukai',
              fontSize: 16,
              colors: whiteColor,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          );
        }
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: favoriteController.tasks.length,
          itemBuilder: (context, index) {
            final task = favoriteController.tasks[index];
            return Card(
              color: grayNavColor,
              elevation: 4,
              margin: EdgeInsets.all(8),
              child: Column(
                children: [
                  SizedBox(height: 12),
                  MyImage(
                    imageName: task.strBadge,
                    width: 80,
                    height: 80,
                    borderRadius: 8,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 8),
                  MyText(
                    hintText: task.strTeam,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    colors: whiteColor,
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: IconButton(
                      icon: Icon(Icons.delete, color: whiteColor),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: MyText(
                                hintText: "Konfirmasi Penghapusan",
                                fontSize: 18,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                                colors: blackColor,
                              ),
                              content: MyText(
                                hintText:
                                    "Yakin ingin menghapus ${task.strTeam}?",
                                fontSize: 16,
                                colors: blackColor,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: MyText(
                                    hintText: "Tidak",
                                    fontSize: 14,
                                    colors: blackColor,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    await favoriteController
                                        .deleteTask(task.id!);
                                    Navigator.of(context).pop();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: MyText(
                                          hintText:
                                              '${task.strTeam} berhasil dihapus!',
                                          fontSize: 16,
                                          colors: whiteColor,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                        ),
                                        backgroundColor: grayNavColor,
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                  },
                                  child: MyText(
                                    hintText: "Ya",
                                    fontSize: 14,
                                    colors: blackColor,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
