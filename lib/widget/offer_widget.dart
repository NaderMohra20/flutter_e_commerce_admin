import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_db_provider/AppRouter.dart';
import 'package:todo_db_provider/models/offers_model.dart';
import 'package:todo_db_provider/providers/firestore_provider.dart';
import 'package:todo_db_provider/screens/offers_screen/updat_offer_screen.dart';

class OffersWidget extends StatelessWidget {
  Offer offer;

  OffersWidget(
    this.offer,
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
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  child: CachedNetworkImage(
                    imageUrl: offer.image,
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
                                .deleteOffer(offer);
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
                                .offerNameController
                                .text = offer.name;
                            AppRouter.NavigateToWidget(UpdateOffer(offer));
                          },
                          icon: Icon(Icons.edit, color: Colors.blue)))),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            offer.name,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
