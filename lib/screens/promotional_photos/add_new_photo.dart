import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_db_provider/AppRouter.dart';
import 'package:todo_db_provider/providers/firestore_provider.dart';
import 'package:todo_db_provider/screens/promotional_photos/all_photos_screen.dart';
import 'package:todo_db_provider/widget/lodig_widget.dart';

class AddNewPhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEAF0F9),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text("Add New Photo"),
      ),
      body: Consumer<FirestoreProvider>(builder: (context, provider, x) {
        return Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            provider.selectedImage == null
                ? InkWell(
                    onTap: () {
                      provider.selectImage();
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      height: 150,
                      width: double.infinity,
                    ),
                  )
                : Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    padding: const EdgeInsets.all(10),
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
              height: 50,
            ),
            Container(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                height: 35,
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: ElevatedButton(
                    onPressed: () async {
                      await provider.AddNewPhoto();
                      Loading();
                      AppRouter.popRoute();
                    },
                    child: const Text("Add Photo")))
          ],
        );
      }),
    );
  }
}
