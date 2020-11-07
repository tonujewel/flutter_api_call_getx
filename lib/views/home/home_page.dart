import 'package:flutter/material.dart';
import 'package:flutter_api_call_getx/controllers/comments_controller.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final CommentsController commentsController = Get.put(CommentsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        actions: [Icon(Icons.add_shopping_cart)],
      ),
      body: Column(children: [
        Expanded(
          child: Obx(
            () => GridView.builder(
              itemCount: commentsController.commentsList.length,
              padding: EdgeInsets.only(right: 8,left: 8),
              gridDelegate:
              new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text("${commentsController.commentsList[index].name}",
                            maxLines: 1,
                            style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold,)),
                        SizedBox(height: 10),
                        Text("${commentsController.commentsList[index].email}",
                            maxLines: 1,
                            style: TextStyle(color: Colors.grey[600])),
                        SizedBox(height: 10),
                        Text("${commentsController.commentsList[index].body}",
                            maxLines: 3,
                            style: TextStyle(color: Colors.grey[600])),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        )
      ]),
    );
  }
}
