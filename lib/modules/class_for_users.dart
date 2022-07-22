class User {
  final int id;
  final String name;
  final String username;
  final String email;
  Map<String, dynamic> address;
  final String phone;
  final String website;
  Map<String, dynamic> company;
  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        address: json["address"],
        phone: json["phone"],
        website: json["website"],
        company: json["company"]);
  }
}
