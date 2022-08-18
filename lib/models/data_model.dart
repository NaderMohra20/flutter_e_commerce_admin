class AppUser {
  String? userName;
  String? email;
  String? phone;
  String? id;
  String? password;
  AppUser(
      {required this.email,
      required this.phone,
      required this.userName,
      this.id,
      this.password});
  tomap() {
    return {
      "userName": userName,
      "phone": phone,
      "email": email,
    };
  }

  AppUser.frommap(Map<String, dynamic> map) {
    userName = map[""];
    phone = map[""];
    userName = map[""];
  }
}
