import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pokemon_ipt/view-models/exports.dart';
import 'package:pokemon_ipt/view-models/vm/user_profile.dart';
import 'package:pokemon_ipt/pages/profile/widgets/input.dart';
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

  callBackFullName(value) => setState(() => widget.user.fullname = value);
  callBackNickname(value) => setState(() => widget.user.nickname = value);
  callBackEmail(value) => setState(() => widget.user.email = value);
  callBackPhone(value) => setState(() => widget.user.phone = value);
  callBackBirthDate(value) => setState(() => widget.user.birthDate = value);
  callBackPassword(value) => setState(() => widget.user.password = value);

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
          InputFormProfile(
            title: 'Nickname:',
            icon: const Icon(Icons.person_pin_circle_rounded),
            isHidden: false,
            textInputType: TextInputType.name,
            callBackValue: callBackNickname,
            controller: _nicknameController,
          ),
          InputFormProfile(
            title: 'Fullname:',
            icon: const Icon(Icons.person),
            isHidden: false,
            textInputType: TextInputType.name,
            callBackValue: callBackFullName,
            controller: _fullnameController,
          ),
          InputFormProfile(
            title: 'Email:',
            icon: const Icon(Icons.email),
            isHidden: false,
            textInputType: TextInputType.emailAddress,
            callBackValue: callBackEmail,
            controller: _emailController,
          ),
          InputFormProfile(
            title: 'Phone:',
            icon: const Icon(Icons.person),
            isHidden: false,
            textInputType: TextInputType.phone,
            callBackValue: callBackPhone,
            controller: _phoneController,
          ),
          InputFormProfile(
            title: 'Birth Date:',
            icon: const Icon(Icons.person),
            isHidden: false,
            textInputType: TextInputType.datetime,
            callBackValue: callBackBirthDate,
            controller: _birthDateController,
          ),
          InputFormProfile(
            title: 'Password:',
            icon: const Icon(Icons.person),
            isHidden: false,
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
