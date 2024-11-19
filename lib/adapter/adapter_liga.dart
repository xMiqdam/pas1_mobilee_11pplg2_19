import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobilee_11pplg2_19/controller/favorite_controller.dart';
import 'package:pas1_mobilee_11pplg2_19/model/model_liga.dart';
import 'package:pas1_mobilee_11pplg2_19/model/post_model.dart';
import 'package:pas1_mobilee_11pplg2_19/widgets/color.dart';
import 'package:pas1_mobilee_11pplg2_19/widgets/text.dart';

class AdapterLiga extends StatelessWidget {
  final PostModel post;
  final VoidCallback? onFavorite;
   final FavoriteController favoriteController = Get.put(FavoriteController());

   AdapterLiga({Key? key, required this.post, this.onFavorite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: grayNavColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              title: Text(
                post.strTeam,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: whiteColor),
              ),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      post.strBadge,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Stadium: ${post.strStadium}",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: whiteColor,
                      ),
                    ),
                    Text(
                      "Location: ${post.strLocation}",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: whiteColor,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Description:",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: whiteColor,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      post.strDescriptionEN,
                      style: TextStyle(fontSize: 14, color: whiteColor),
                    ),
                  ],
                ),
              ),
              actions: [
                IconButton(
              icon: Icon(
                Icons.favorite_border,
                color: whiteColor,
                size: 30,
              ),
              onPressed: () {
                favoriteController.addTask(ModelBola(
                  strTeam: post.strTeam,
                  strStadium: post.strStadium,
                  strBadge: post.strBadge,
                  strDescriptionEN: post.strDescriptionEN ?? '',
                  isCompleted: false,
                ));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: MyText(
                      hintText: 'Berhasil Tambah ke favorit',
                      fontSize: 16,
                      colors: whiteColor,
                      fontWeight: FontWeight.w400,
                    ),
                    backgroundColor: grayNavColor,
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Close", style: TextStyle(color: whiteColor)),
                ),
              ],
            );
          },
        );
      },
      child: Card(
        color: grayNavColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(post.strBadge),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.strTeam,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: whiteColor,
                      ),
                    ),
                    Text(
                      post.strStadium,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: whiteColor,
                      ),
                    ),
                    Text(
                      post.strLocation,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: whiteColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
