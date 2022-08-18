import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_db_provider/AppRouter.dart';
import 'package:todo_db_provider/models/category_data.dart';
import 'package:todo_db_provider/models/prodect.dart';
import 'package:todo_db_provider/providers/firestore_provider.dart';
import 'package:todo_db_provider/screens/category_screen/update_category.dart';
import 'package:todo_db_provider/screens/products_screen/update_product_screen.dart';

class productsWidget extends StatelessWidget {
  Prodect prodect;
  String catId;
  productsWidget(this.prodect, this.catId);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 300,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: const BoxDecoration(
        color: Color(0xff85AFEE),
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: CachedNetworkImage(
                      imageUrl: prodect.image,
                      fit: BoxFit.cover,
                    )),
              ),
              Positioned(
                  top: 2,
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
                                .deleteproduct(prodect, catId);
                          },
                          icon: const Icon(Icons.delete, color: Colors.blue)))),
              Positioned(
                  top: 46,
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
                                .productNameController
                                .text = prodect.name;
                            AppRouter.NavigateToWidget(
                                UpdateProdect(prodect, catId));
                          },
                          icon: const Icon(Icons.edit, color: Colors.blue)))),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Text(prodect.name),
          // const SizedBox(
          //   width: 10,
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Container(
          //     margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          //     decoration: const BoxDecoration(
          //       color: Color(0xff85AFEE),
          //       borderRadius: BorderRadius.all(Radius.circular(15.0)),
          //     ),
          //     width: MediaQuery.of(context).size.width,
          //     child: ElevatedButton(
          //         child: const Text("Edit Prodect"),
          //         onPressed: () {
          //           Provider.of<FirestoreProvider>(context, listen: false)
          //               .deleteproduct(prodect, catId);
          //         }),
          //   ),
          // ),
        ],
      ),
    );
  }
}
