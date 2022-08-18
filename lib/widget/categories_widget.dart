import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_db_provider/AppRouter.dart';
import 'package:todo_db_provider/models/category_data.dart';
import 'package:todo_db_provider/providers/firestore_provider.dart';
import 'package:todo_db_provider/screens/category_screen/update_category.dart';
import 'package:todo_db_provider/screens/products_screen/all_products_screen.dart';

class CategoriesWidget extends StatelessWidget {
  Category category;

  CategoriesWidget(
    this.category,
  );
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: const BoxDecoration(
        color: Color(0xff85AFEE),
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              SizedBox(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: CachedNetworkImage(
                    imageUrl: category.imageUrl,
                    fit: BoxFit.cover,
                  )),
              Positioned(
                  top: 10,
                  child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.white),
                      height: 40,
                      width: 40,
                      child: IconButton(
                          onPressed: () {
                            Provider.of<FirestoreProvider>(context,
                                    listen: false)
                                .deleteCategory(category);
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.blue,
                          )))),
              const SizedBox(
                height: 15,
              ),
              Positioned(
                  top: 80,
                  child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.white),
                      height: 40,
                      width: 40,
                      child: IconButton(
                          onPressed: () {
                            Provider.of<FirestoreProvider>(context,
                                    listen: false)
                                .categoryNameController
                                .text = category.name;
                            AppRouter.NavigateToWidget(
                                UpdateCategory(category));
                          },
                          icon: Icon(Icons.edit, color: Colors.blue)))),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            category.name,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
