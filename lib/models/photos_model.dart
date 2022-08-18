class Photo {
  late String id;
  late String imageUrl;
  Photo({required this.imageUrl});
  Photo.fromMap(Map<String, dynamic> map) {
    imageUrl = map["imageUrl"];
  }
  toMap() {
    return {
      "imageUrl": imageUrl,
    };
  }
}
