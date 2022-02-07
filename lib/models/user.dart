class User {
  String fullname;
  String nickname;
  String email;
  String phone;
  String birthDate;
  String password;

  User(
      {required this.fullname,
      required this.nickname,
      required this.email,
      required this.phone,
      required this.birthDate,
      required this.password});

  factory User.fromJSON(Map<String, dynamic> json) {
    return User(
        fullname: json['fullname'],
        nickname: json['nickname'],
        email: json['email'],
        phone: json['phone'],
        birthDate: json['birth_date'],
        password: json['real_password']);
  }
}
