import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_db_provider/data/firestore_helper.dart';
import 'package:todo_db_provider/data/storege_helper.dart';
import 'package:todo_db_provider/models/category_data.dart';
import 'package:todo_db_provider/models/offers_model.dart';
import 'package:todo_db_provider/models/photos_model.dart';
import 'package:todo_db_provider/models/prodect.dart';

class FirestoreProvider extends ChangeNotifier {
  FirestoreProvider() {
    getAllCategories();
    getAllPhotos();
    getAllOffers();
  }
  List<Category> categories = [];
  List<Prodect> products = [];
  List<Photo> photos = [];
  List<Offer> offers = [];
  TextEditingController categoryNameController = TextEditingController();
  TextEditingController productNameController = TextEditingController();
  TextEditingController productDscController = TextEditingController();
  TextEditingController productpriceController = TextEditingController();
  TextEditingController productquantityController = TextEditingController();
  TextEditingController offerNameController = TextEditingController();
  TextEditingController offerDscController = TextEditingController();
  TextEditingController offerpriceController = TextEditingController();
  TextEditingController offerquantityController = TextEditingController();

  File? selectedImage;
  selectImage() async {
    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    selectedImage = File(xFile!.path);
    notifyListeners();
  }

  AddNewCategory() async {
    // print("selected image: $selectedImage");
    if (selectedImage != null) {
      String imageUrl =
          await StorageHelper.storageHelper.uplodeimage(selectedImage!);

      Category category =
          Category(name: categoryNameController.text, imageUrl: imageUrl);
      Category newCategory =
          await FirestoreHelper.firestoreHelper.addNewCategory(category);
      selectedImage = null;

      categories.add(newCategory);
      notifyListeners();
    }
  }

  getAllCategories() async {
    categories = await FirestoreHelper.firestoreHelper.getAllCategories();
    notifyListeners();
  }

  updateCategory(Category category) async {
    String? imageUrl;
    if (selectedImage != null) {
      imageUrl = await StorageHelper.storageHelper.uplodeimage(selectedImage!);
    }
    Category newCategory = Category(
        name: categoryNameController.text,
        imageUrl: imageUrl ?? category.imageUrl);
    newCategory.catId = category.catId;
    selectedImage = null;
    category.name = "";
    await FirestoreHelper.firestoreHelper.updateCategory(newCategory);
    getAllCategories();
  }

  deleteCategory(Category category) async {
    await FirestoreHelper.firestoreHelper.deleteCategory(category);
    getAllCategories();
  }

  getAllProducts(String catId) async {
    products = await FirestoreHelper.firestoreHelper.getAllProdects(catId);
    notifyListeners();
  }

  AddNewProduct(String catId) async {
    // print("selected image: $selectedImage");
    if (selectedImage != null) {
      String imageUrl =
          await StorageHelper.storageHelper.uplodeimage(selectedImage!);

      Prodect prodect = Prodect(
          name: productNameController.text,
          image: imageUrl,
          description: productDscController.text,
          price: num.parse(productpriceController.text),
          quantity: int.parse(productquantityController.text));

      Prodect newproduct =
          await FirestoreHelper.firestoreHelper.addNewProdect(prodect, catId);
      selectedImage = null;

      products.add(newproduct);
      notifyListeners();
    }
  }

  updateproduct(Prodect prodect, String catId) async {
    String? imageUrl;
    if (selectedImage != null) {
      imageUrl = await StorageHelper.storageHelper.uplodeimage(selectedImage!);
    }
    Prodect newProdect = Prodect(
        name: productNameController.text,
        image: imageUrl ?? prodect.image,
        description: productDscController.text,
        price: num.parse(productpriceController.text),
        quantity: int.parse(productquantityController.text));
    newProdect.id = prodect.id;
    selectedImage = null;
    prodect.name = "";

    await FirestoreHelper.firestoreHelper.updateProdect(newProdect, catId);
    getAllProducts(catId);
  }

  deleteproduct(Prodect prodect, String catId) async {
    await FirestoreHelper.firestoreHelper.deleteProdect(prodect, catId);
    getAllProducts(catId);
  }

  AddNewPhoto() async {
    // print("selected image: $selectedImage");
    if (selectedImage != null) {
      String imageUrl =
          await StorageHelper.storageHelper.uplodeimage(selectedImage!);

      Photo photo = Photo(imageUrl: imageUrl);
      Photo newPhoto = await FirestoreHelper.firestoreHelper.addNewphoto(photo);
      selectedImage = null;
      photos.add(newPhoto);
      notifyListeners();
    }
  }

  getAllPhotos() async {
    photos = await FirestoreHelper.firestoreHelper.getAllPhoto();
    notifyListeners();
  }

  updatePhoto(Photo photo) async {
    String? imageUrl;
    if (selectedImage != null) {
      imageUrl = await StorageHelper.storageHelper.uplodeimage(selectedImage!);
    }
    Photo newphoto = Photo(imageUrl: imageUrl ?? photo.imageUrl);
    newphoto.id = photo.id;
    selectedImage = null;
    await FirestoreHelper.firestoreHelper.updatePhoto(newphoto);
    getAllPhotos();
  }

  deletePhoto(Photo photo) async {
    await FirestoreHelper.firestoreHelper.deletePhoto(photo);
    getAllPhotos();
  }

  AddNewOffer() async {
    // print("selected image: $selectedImage");
    if (selectedImage != null) {
      String imageUrl =
          await StorageHelper.storageHelper.uplodeimage(selectedImage!);

      Offer offer = Offer(
          name: offerNameController.text,
          description: offerDscController.text,
          price: offerpriceController.text,
          image: imageUrl,
          quantity: offerquantityController.text);

      Offer newOffer = await FirestoreHelper.firestoreHelper.addNewOffer(offer);
      selectedImage = null;

      offers.add(newOffer);
      notifyListeners();
    }
  }

  getAllOffers() async {
    offers = await FirestoreHelper.firestoreHelper.getAllOffers();
    notifyListeners();
  }

  updateOffer(Offer offer) async {
    String? imageUrl;
    if (selectedImage != null) {
      imageUrl = await StorageHelper.storageHelper.uplodeimage(selectedImage!);
    }
    Offer newoffer = Offer(
        name: offerNameController.text,
        description: offerDscController.text,
        price: offerpriceController.text,
        image: imageUrl ?? offer.image,
        quantity: offerquantityController.text);
    newoffer.id = offer.id;
    selectedImage = null;
    offer.name = "";
    await FirestoreHelper.firestoreHelper.updateOffer(newoffer);
    getAllOffers();
  }

  deleteOffer(Offer offer) async {
    await FirestoreHelper.firestoreHelper.deleteOffer(offer);
    getAllOffers();
  }

  // deleteCategory() async {

  //   await FirestoreHelper.firestoreHelper.deleteCategory(category);
  // }
  // GlobalKey<FormState> signupKey = GlobalKey();
  // TextEditingController emailController = TextEditingController();
  // TextEditingController userNameController = TextEditingController();
  // TextEditingController phoneController = TextEditingController();
  // TextEditingController idController = TextEditingController();
  // nullValiadation(String? v) {
  //   if (v == null || v.isEmpty) {
  //     return "هذا الحقل مطلوب";
  //   }
  // }

  // emailValiadation(String value) {
  //   if (!isEmail(value)) {
  //     return "صيغة ايميل خاطئة";
  //   }
  // }

  // passwordValiadation(String value) {
  //   if (value.length < 6) {
  //     return "يجب ان تكون كلمة المرور من 6 خانات على الاقل ";
  //   }
  // }

  // insertNewcategory() {
  //   FirestoreHelper.firestoreHelper.insertDummyDatainFirestore();
  // }

  // // addUserToFirestore1() async {
  // //   FirestoreHelper.firestoreHelper.addUserToFirestore(userNameController.text,
  // //       emailController.text, idController.text, phoneController.text);
  // // }

  // signup() async {
  //   if (signupKey.currentState!.validate()) {
  //     UserCredential? credential = await AuthHelper.authHelper
  //         .signUp(emailController.text, idController.text);
  //     if (credential != null) {
  //       AppRouter.NavigateToWidget(HomeScreen());
  //     }
  //   }
  // }

  // register() async {
  //   UserCredential? credential = await AuthHelper.authHelper
  //       .signUp(emailController.text, idController.text);
  //   AppUser appUser = AppUser(
  //       email: emailController.text,
  //       phone: phoneController.text,
  //       userName: userNameController.text,
  //       id: credential!.user!.uid);
  //   FirestoreHelper.firestoreHelper.addUserToFirestore(appUser);
  // }
}
