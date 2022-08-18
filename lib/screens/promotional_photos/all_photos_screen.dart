import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_db_provider/AppRouter.dart';
import 'package:todo_db_provider/providers/firestore_provider.dart';
import 'package:todo_db_provider/screens/products_screen/add_product_screen.dart';
import 'package:todo_db_provider/screens/products_screen/all_products_screen.dart';
import 'package:todo_db_provider/screens/promotional_photos/add_new_photo.dart';
import 'package:todo_db_provider/widget/categories_widget.dart';
import 'package:todo_db_provider/widget/photos_widget.dart';

class AllPhotosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: const Color(0xffEAF0F9),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text("photos"),
      ),
      body: Consumer<FirestoreProvider>(builder: (y, provider, x) {
        return provider.photos == null
            ? const Center()
            : ListView.builder(
                itemCount: provider.photos.length,
                itemBuilder: (context, index) {
                  return PhotosWidget(provider.photos[index]);
                });
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          AppRouter.NavigateToWidget(AddNewPhoto());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
