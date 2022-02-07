import 'package:pokemon_ipt/models/user.dart';

class UserProfileVM {
  final User user;

  UserProfileVM({required this.user});

  get fullname {
    return user.fullname;
  }

  set fullname(value) {
    user.fullname = value;
  }

  get nickname {
    return user.nickname;
  }

  set nickname(value) {
    user.nickname = value;
  }

  get email {
    return user.email;
  }

  set email(value) {
    user.email = value;
  }

  get phone {
    return user.phone;
  }

  set phone(value) {
    user.phone = value;
  }

  get birthDate {
    return user.birthDate;
  }

  set birthDate(value) {
    user.birthDate = value;
  }

  get password {
    return user.password;
  }

  set password(value) {
    user.password = value;
  }
}
