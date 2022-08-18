import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_db_provider/AppRouter.dart';
import 'package:todo_db_provider/models/category_data.dart';
import 'package:todo_db_provider/providers/firestore_provider.dart';
import 'package:todo_db_provider/screens/category_screen/add_categorise_screen.dart';
import 'package:todo_db_provider/screens/products_screen/add_product_screen.dart';
import 'package:todo_db_provider/screens/products_screen/all_products_screen.dart';
import 'package:todo_db_provider/widget/categories_widget.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xffEAF0F9),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text("Categories"),
      ),
      body: Consumer<FirestoreProvider>(builder: (y, provider, x) {
        return provider.categories == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: provider.categories.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        provider
                            .getAllProducts(provider.categories[index].catId);
                        AppRouter.NavigateToWidget(
                            ProductsScreen(provider.categories[index].catId));
                      },
                      child: CategoriesWidget(provider.categories[index]));
                });
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          AppRouter.NavigateToWidget(AddCategoriesScreen());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
