import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_db_provider/AppRouter.dart';
import 'package:todo_db_provider/providers/firestore_provider.dart';
import 'package:todo_db_provider/screens/offers_screen/add_offer_screen.dart';
import 'package:todo_db_provider/widget/offer_widget.dart';

class AllOffersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xffEAF0F9),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text("Offers"),
      ),
      body: Consumer<FirestoreProvider>(builder: (y, provider, x) {
        return provider.offers == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: provider.offers.length,
                itemBuilder: (context, index) {
                  return OffersWidget(provider.offers[index]);
                });
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          AppRouter.NavigateToWidget(NewOffer());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
