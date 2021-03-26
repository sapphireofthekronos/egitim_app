class CustomersModel {
  String email;
  String firstName;
  String lastName;
  String password;
  String username;

  CustomersModel({
    this.email,
    this.firstName,
    this.lastName,
    this.password,
    this.username,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};

    map.addAll({
      'email': email,
      'first_name': firstName,
      'last_nane': lastName,
      'username': username,
      'password': password,
    });

    return map;
  }
}
