import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_db_provider/AppRouter.dart';
import 'package:todo_db_provider/providers/firestore_provider.dart';
import 'package:todo_db_provider/screens/products_screen/add_product_screen.dart';
import 'package:todo_db_provider/widget/categories_widget.dart';
import 'package:todo_db_provider/widget/product_widget.dart';

class ProductsScreen extends StatelessWidget {
  String catId;
  ProductsScreen(this.catId);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text("Products Screen"),
      ),
      body: Consumer<FirestoreProvider>(builder: (y, provider, x) {
        return provider.products.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : GridView.builder(
                itemCount: provider.products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {},
                      child: productsWidget(provider.products[index], catId));
                });
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppRouter.NavigateToWidget(NewProduct(catId));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
