class Offer {
  late String id;
  late String name;
  late String description;
  late String image;
  late String price;
  late String quantity;

  Offer(
      {required this.name,
      required this.description,
      required this.price,
      required this.image,
      required this.quantity});
  Offer.fromMap(Map<String, dynamic> map) {
    // id = map["id"];
    name = map["name"];
    description = map["description"];
    price = map["price"];
    image = map["imageUrl"];
    quantity = map["quantity"];
  }
  toMap() {
    return {
      "name": name,
      "quantity": quantity,
      "imageUrl": image,
      "price": price,
      "description": description
    };
  }
}
