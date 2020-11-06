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
            () => StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              itemCount: commentsController.commentsList.length,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              itemBuilder: (context, index) {
                return Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(color: Colors.red),
                );
              },
              staggeredTileBuilder: (index) => StaggeredTile.fit(1),
            ),
          ),
        )
      ]),
    );
  }
}
