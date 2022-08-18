import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_db_provider/AppRouter.dart';
import 'package:todo_db_provider/models/photos_model.dart';
import 'package:todo_db_provider/providers/firestore_provider.dart';
import 'package:todo_db_provider/screens/category_screen/update_category.dart';

class PhotosWidget extends StatelessWidget {
  Photo photo;
  PhotosWidget(this.photo);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: const BoxDecoration(
        color: Color(0xff85AFEE),
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: CachedNetworkImage(
                imageUrl: photo.imageUrl,
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
                        Provider.of<FirestoreProvider>(context, listen: false)
                            .deletePhoto(photo);
                      },
                      icon: Icon(Icons.delete, color: Colors.blue)))),
        ],
      ),
      // margin: ,
      // padding: EdgeInsets.all(10),
      // decoration: const BoxDecoration(
      //   color:  Color(0xff85AFEE),
      //   borderRadius: BorderRadius.all(Radius.circular(10)),
      // ),
      // height: 150,
      // width: double.infinity,
      // child: Image.network(
      //   photo.imageUrl,
      //   fit: BoxFit.cover,
      // ),
    );
  }
}
