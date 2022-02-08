import 'package:flutter/material.dart';
import 'package:pokemon_ipt/constants/exports.dart';
import 'package:pokemon_ipt/widgets/input_password.dart';
import 'package:provider/provider.dart';
import 'package:pokemon_ipt/view-models/auth/auth.dart';
import 'package:pokemon_ipt/widgets/input.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController _fullnameController;
  late String _currentFullname;
  late TextEditingController _nicknameController;
  late String _currentNickname;
  late TextEditingController _emailController;
  late String _currentEmail;
  late TextEditingController _phoneController;
  late String _currentPhone;
  late TextEditingController _birthDateController;
  late String _currentBirthDate;
  late TextEditingController _passwordController;
  late String _currentPassword;

  bool _isHidden = true;

  callBackFullName(value) => setState(() => _currentFullname = value);
  callBackNickname(value) => setState(() => _currentNickname = value);
  callBackEmail(value) => setState(() => _currentEmail = value);
  callBackPhone(value) => setState(() => _currentPhone = value);
  callBackBirthDate(value) => setState(() => _currentBirthDate = value);
  callBackPassword(value) => setState(() => _currentPassword = value);

  callBackIsHidden(value) => setState(() => _isHidden = value);

  @override
  void initState() {
    super.initState();
    _currentFullname = '';
    _currentNickname = '';
    _currentEmail = '';
    _currentPhone = '';
    _currentBirthDate = '';
    _currentPassword = '';

    _fullnameController = TextEditingController(text: _currentFullname);
    _nicknameController = TextEditingController(text: _currentNickname);
    _emailController = TextEditingController(text: _currentEmail);
    _phoneController = TextEditingController(text: _currentPhone);
    _birthDateController = TextEditingController(text: _currentBirthDate);
    _passwordController = TextEditingController(text: _currentPassword);
  }

  @override
  Widget build(BuildContext context) {
    var loginViewModel = Provider.of<LoginInViewModel>(context, listen: false);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75),
        child: AppBar(
          elevation: 5,
          centerTitle: true,
          title: const Image(
            fit: BoxFit.fitHeight,
            width: 160,
            image: AssetImage('assets/background/pokemon_welcome.png'),
          ),
          shape: const RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Colors.black),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: <Widget>[
              const ListTile(
                title: Text(
                  'User Information Record',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              InputFormCustom(
                title: 'Nickname:',
                icon: const Icon(Icons.person_pin_circle_rounded),
                textInputType: TextInputType.name,
                callBackValue: callBackNickname,
                controller: _nicknameController,
              ),
              InputFormCustom(
                title: 'Fullname:',
                icon: const Icon(Icons.person),
                textInputType: TextInputType.name,
                callBackValue: callBackFullName,
                controller: _fullnameController,
              ),
              InputFormCustom(
                title: 'Email:',
                icon: const Icon(Icons.email),
                textInputType: TextInputType.emailAddress,
                callBackValue: callBackEmail,
                controller: _emailController,
              ),
              InputFormCustom(
                title: 'Phone:',
                icon: const Icon(Icons.person),
                textInputType: TextInputType.phone,
                callBackValue: callBackPhone,
                controller: _phoneController,
              ),
              InputFormCustom(
                title: 'Birth Date:',
                icon: const Icon(Icons.person),
                textInputType: TextInputType.datetime,
                callBackValue: callBackBirthDate,
                controller: _birthDateController,
              ),
              InputPasswordFormCustom(
                isHidden: _isHidden,
                title: 'Password:',
                textInputType: TextInputType.visiblePassword,
                callBackValue: callBackPassword,
                controller: _passwordController,
                callBackIsHidden: callBackIsHidden,
              ),
              GestureDetector(
                onTap: () async {
                  final result = await loginViewModel.register(
                      fullname: _currentFullname,
                      nickname: _currentNickname,
                      email: _currentEmail,
                      phone: _currentPhone,
                      birthDate: _currentBirthDate,
                      password: _currentPassword);
                  if (!result) {
                    Alert(
                        context: context,
                        title: 'Error!',
                        desc: 'User not registered!',
                        buttons: [
                          DialogButton(
                              child: const Text('Ok'),
                              onPressed: () => Navigator.pop(context))
                        ]).show();
                  } else {
                    Navigator.pushReplacementNamed(context, HOME_ROUTE);
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 15),
                  alignment: Alignment.center,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      border: Border.all(color: Colors.black),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(25))),
                  height: 40,
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.amber[600],
            border: Border.all(color: Colors.black),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      ),
    );
  }
}
