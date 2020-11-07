import 'package:flutter_api_call_getx/models/comments.dart';
import 'package:flutter_api_call_getx/services/remote_services.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class CommentsController extends GetxController {
  var isLoading = true.obs;
  var commentsList = List<Comments>().obs;

  @override
  void onInit() {
    fetchComments();
    super.onInit();
  }

  void fetchComments() async {
    isLoading(true);
    try {
      var comments = await RemoteServices.fetchComments();
      if (comments != null) {
        commentsList.value = comments;
      }
    } finally {
      isLoading(false);
    }
  }
}
