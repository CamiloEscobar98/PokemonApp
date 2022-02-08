import 'package:flutter/material.dart';
import 'package:pokemon_ipt/widgets/input_password.dart';
import 'package:provider/provider.dart';
import 'package:pokemon_ipt/view-models/exports.dart';
import 'package:pokemon_ipt/view-models/vm/user_profile.dart';
import 'package:pokemon_ipt/widgets/input.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class FormUserProfile extends StatefulWidget {
  final UserProfileVM user;
  const FormUserProfile({Key? key, required this.user}) : super(key: key);

  @override
  State<FormUserProfile> createState() => _FormUserProfileState();
}

class _FormUserProfileState extends State<FormUserProfile> {
  late TextEditingController _fullnameController;
  late TextEditingController _nicknameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _birthDateController;
  late TextEditingController _passwordController;

  bool _isHidden = true;

  callBackFullName(value) => setState(() => widget.user.fullname = value);
  callBackNickname(value) => setState(() => widget.user.nickname = value);
  callBackEmail(value) => setState(() => widget.user.email = value);
  callBackPhone(value) => setState(() => widget.user.phone = value);
  callBackBirthDate(value) => setState(() => widget.user.birthDate = value);
  callBackPassword(value) => setState(() => widget.user.password = value);
 callBackIsHidden(value) => setState(() => _isHidden = value);

  @override
  void initState() {
    super.initState();
    _fullnameController = TextEditingController(text: widget.user.fullname);
    _nicknameController = TextEditingController(text: widget.user.nickname);
    _emailController = TextEditingController(text: widget.user.email);
    _phoneController = TextEditingController(text: widget.user.phone);
    _birthDateController = TextEditingController(text: widget.user.birthDate);
    _passwordController = TextEditingController(text: widget.user.password);
  }

  @override
  Widget build(BuildContext context) {
    final profileVM = Provider.of<ProfileViewModel>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const ListTile(
            title: Text(
              'User Information',
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
            icon: const Icon(Icons.phone),
            textInputType: TextInputType.phone,
            callBackValue: callBackPhone,
            controller: _phoneController,
          ),
          InputFormCustom(
            title: 'Birth Date:',
            icon: const Icon(Icons.calendar_today),
            textInputType: TextInputType.datetime,
            callBackValue: callBackBirthDate,
            controller: _birthDateController,
          ),
          InputPasswordFormCustom(
            isHidden: _isHidden,
            callBackIsHidden: callBackIsHidden,
            title: 'Password:',
            textInputType: TextInputType.visiblePassword,
            callBackValue: callBackPassword,
            controller: _passwordController,
          ),
          GestureDetector(
            onTap: () async {
              final result = await profileVM.updateProfile(userVM: widget.user);
              if (!result) {
                Alert(
                    context: context,
                    title: 'Error!',
                    desc: 'User information not updated!',
                    buttons: [
                      DialogButton(
                          child: const Text('Ok'),
                          onPressed: () => Navigator.pop(context))
                    ]).show();
              } else {
                Alert(
                    context: context,
                    title: 'Success!',
                    desc: 'User information updated!',
                    buttons: [
                      DialogButton(
                          child: const Text('Ok'),
                          onPressed: () => Navigator.pop(context))
                    ]).show();
              }
            },
            child: Container(
              margin: const EdgeInsets.only(top: 15),
              alignment: Alignment.center,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.amber,
                  border: Border.all(color: Colors.black),
                  borderRadius: const BorderRadius.all(Radius.circular(25))),
              height: 40,
              child: const Text(
                'Update',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
