import 'package:flutter/material.dart';
import 'package:todo_db_provider/AppRouter.dart';
import 'package:todo_db_provider/screens/category_screen/categories_screen.dart';
import 'package:todo_db_provider/screens/offers_screen/add_offer_screen.dart';
import 'package:todo_db_provider/screens/offers_screen/all_Offer_screen.dart';
import 'package:todo_db_provider/screens/promotional_photos/all_photos_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEAF0F9),
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Home Screen",
          ),
          backgroundColor: Colors.blue),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              AppRouter.NavigateToWidget(AllPhotosScreen());
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              padding: EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color(0xff85AFEE),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              height: 155,
              child: const Center(
                child: Text(
                  "promotional photos",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          InkWell(
            onTap: () {
              AppRouter.NavigateToWidget(CategoriesScreen());
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color(0xff85AFEE),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              height: 155,
              child: const Center(
                child: Text(
                  "Categories",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          InkWell(
            onTap: () {
              AppRouter.NavigateToWidget(AllOffersScreen());
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color(0xff85AFEE),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              height: 155,
              child: const Center(
                child: Text(
                  "Offers",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
