import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:todo_db_provider/AppRouter.dart';
import 'package:todo_db_provider/data/auth_provider.dart';
import 'package:todo_db_provider/models/category_data.dart';
import 'package:todo_db_provider/providers/firestore_provider.dart';

class UpdateCategory extends StatelessWidget {
  Category category;
  UpdateCategory(this.category);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffEAF0F9),
        appBar: AppBar(
          centerTitle: true,
          title: Text("Update Category"),
          backgroundColor: Colors.blue,
          // actions: [
          //   IconButton(
          //       onPressed: () {
          //         Provider.of<AuthProvider>(context, listen: false).signOut();
          //       },
          //       icon: const Icon(Icons.logout))
          // ],
        ),
        body: Consumer<FirestoreProvider>(builder: (context, provider, x) {
          return SingleChildScrollView(
            child: Column(
              children: [
                provider.selectedImage == null
                    ? InkWell(
                        onTap: () {
                          provider.selectImage();
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          padding: EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          height: 150,
                          width: double.infinity,
                        ),
                      )
                    : Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        padding: EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        height: 150,
                        width: double.infinity,
                        child: Image.file(
                          provider.selectedImage!,
                          fit: BoxFit.cover,
                        ),
                      ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  padding: EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: TextField(
                    controller: provider.categoryNameController,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () async {
                            await provider.updateCategory(category);
                            AppRouter.popRoute();
                          },
                          child: const Text("update Category")),
                    ),
                  ],
                )
              ],
            ),
          );
        }));
  }
}
