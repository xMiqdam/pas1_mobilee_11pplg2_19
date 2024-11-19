import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart';
import 'package:pas1_mobilee_11pplg2_19/adapter/adapter_liga.dart';
import 'package:pas1_mobilee_11pplg2_19/controller/post_controller.dart';
import 'package:pas1_mobilee_11pplg2_19/model/post_model.dart';
import 'package:pas1_mobilee_11pplg2_19/widgets/color.dart';
import 'package:pas1_mobilee_11pplg2_19/widgets/text.dart';

class HomeMenu extends StatelessWidget {
   final PostController postController = Get.put(PostController());
   HomeMenu({super.key,});

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
                  hintText: 'Tim Liga Inggris',
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
        if (postController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: postController.postList.length,
          itemBuilder: (context, index) {
            final post = postController.postList[index];
            return AdapterLiga(post: post); 
          },
        );
      }),
    );
  }
}