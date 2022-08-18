import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_db_provider/AppRouter.dart';
import 'package:todo_db_provider/providers/firestore_provider.dart';
import 'package:todo_db_provider/screens/offers_screen/all_Offer_screen.dart';

class NewOffer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Add New Product"),
          backgroundColor: Colors.blue,
        ),
        body: Consumer<FirestoreProvider>(builder: (context, provider, x) {
          return ListView(
            children: [
              provider.selectedImage == null
                  ? InkWell(
                      onTap: () {
                        provider.selectImage();
                      },
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: "Product Name",
                  ),
                  controller: provider.offerNameController,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 100,
                  child: TextField(
                    decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: "Product Description",
                    ),
                    controller: provider.offerDscController,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: "Offer Quantity",
                  ),
                  controller: provider.offerquantityController,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: "Offer price",
                  ),
                  controller: provider.offerpriceController,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                    onPressed: () async {
                      await provider.AddNewOffer();
                      AppRouter.popRoute();
                    },
                    child: const Text("New Offer")),
              )
            ],
          );
        }));
  }
}
