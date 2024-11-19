// controllers/post_controller.dart
import 'package:get/get.dart';
import 'package:pas1_mobilee_11pplg2_19/apiServiceGet.dart';
import 'package:pas1_mobilee_11pplg2_19/model/post_model.dart';


class PostController extends GetxController {
  var isLoading = true.obs;
  var postList = <PostModel>[].obs;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  void fetchPosts() async {
    try {
      isLoading(true);
      var posts = await ApiServiceGet().fetchPosts();
      postList.assignAll(posts);
    } finally {
      isLoading(false);
    }
  }
}