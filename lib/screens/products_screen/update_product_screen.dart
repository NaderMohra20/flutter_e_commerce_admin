import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_db_provider/AppRouter.dart';
import 'package:todo_db_provider/models/offers_model.dart';
import 'package:todo_db_provider/models/prodect.dart';
import 'package:todo_db_provider/providers/firestore_provider.dart';

class UpdateProdect extends StatelessWidget {
  Prodect prodect;
  String catId;
  UpdateProdect(this.prodect, this.catId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffEAF0F9),
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Update Prodect"),
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
          return Column(
            children: [
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
                height: 20,
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: TextField(
                  controller: provider.productNameController,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          provider.updateproduct(prodect, catId);
                          AppRouter.popRoute();
                        },
                        child: const Text("update Prodect")),
                  ),
                ],
              )
            ],
          );
        }));
  }
}
